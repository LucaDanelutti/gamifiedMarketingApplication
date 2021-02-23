package it.polimi.db2.controllers;

import it.polimi.db2.application.entities.MarketingQuestion;
import it.polimi.db2.application.entities.User;
import it.polimi.db2.application.services.QuestionnaireService;
import it.polimi.db2.application.services.UserService;
import org.apache.commons.lang.StringEscapeUtils;
import org.thymeleaf.context.WebContext;

import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import java.io.IOException;
import java.util.*;

@WebServlet("/CreateQuestionnaireReplies")
public class CreateQuestionnaireReplies extends HttpServlet {
    @EJB(name = "it.polimi.db2.application.services/QuestionnaireService")
    private QuestionnaireService qService;

    @EJB(name = "it.polimi.db2.application.services/UserService")
    private UserService uService;

    @Resource
    UserTransaction tx;

    public CreateQuestionnaireReplies() {
    }

    public void init() throws ServletException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // If the user is not logged in (not present in session) redirect to the login
        HttpSession session = request.getSession();
        if (session.isNew() || session.getAttribute("user") == null) {
            String loginPath = getServletContext().getContextPath() + "/login";
            response.sendRedirect(loginPath);
            return;
        }

        // Get user
        User user = (User) session.getAttribute("user");

        // Get servlet context
        final WebContext ctx = new WebContext(request, response, getServletContext(), request.getLocale());

        //If the user is banned redirect to the banned page
        if (user.getBanned()) {
            String bannedPath = getServletContext().getContextPath() + "/banned";
            response.sendRedirect(bannedPath);
            return;
        }

        //Retrieve dynamic parameters
        Map<String, String> requestContent = new HashMap<>();
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String[] paramValues = request.getParameterValues(paramName);
            for (int i = 0; i < paramValues.length; i++) {
                String paramValue = paramValues[i];
                requestContent.put(paramName, paramValue);
            }
        }

        //Split requestContent in marketingReplies and statsReplies, parse map keys (ex. "marketing5":"true" -> "5":"true")
        Map<Integer, String> marketingReplies = new HashMap<>();
        Map<Integer, String> statsReplies = new HashMap<>();
        List<String> values = new ArrayList<>();
        for (String key: requestContent.keySet()) {
            if (key.contains("marketing")) {
                if (!requestContent.get(key).equals("")) {
                    marketingReplies.put(Integer.parseInt(key.split("marketing")[1]), requestContent.get(key));
                    values.add(requestContent.get(key));
                }
            } else if (key.contains("stats")) {
                if (!requestContent.get(key).equals("")) {
                    statsReplies.put(Integer.parseInt(key.split("stats")[1]), requestContent.get(key));
                    values.add(requestContent.get(key));
                }
            }
        }

        //Checks for mandatory marketing replies
        Collection<MarketingQuestion> marketingQuestions = qService.getQuestionnaireOfTheDay().getMarketingQuestions();
        for (MarketingQuestion question: marketingQuestions) {
            if (!marketingReplies.containsKey(question.getId())) {
                String incompleteForm = getServletContext().getContextPath() + "/incomplete_form";
                response.sendRedirect(incompleteForm);
                return;
            }
        }

        //Checks for forbidden words
        Boolean toBan = qService.checkReplies(values);
        if (toBan) {
            uService.banUser(user);
            String bannedPath = getServletContext().getContextPath() + "/banned";
            response.sendRedirect(bannedPath);
        }
        else {
            try {
                //Application managed transaction
                tx.begin();
                for (int replyId : marketingReplies.keySet()) {
                    qService.addMarketingReply(marketingReplies.get(replyId), replyId, user);
                }
                int questionnaireId = qService.getQuestionnaireOfTheDay().getId();
                for (int replyId : statsReplies.keySet()) {
                    qService.addStatsReply(statsReplies.get(replyId), replyId, questionnaireId, user);
                }
                tx.commit();
                String greetingsPath = getServletContext().getContextPath() + "/greetings";
                response.sendRedirect(greetingsPath);
            } catch (Exception e) {
                try {
                    tx.rollback();
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
                String greetingsPath = getServletContext().getContextPath() + "/greetings";
                response.sendRedirect(greetingsPath);
                return;
            }
        }
        uService.setCompilationCompleted(user);
    }

    public void destroy() {
    }
}
