package it.polimi.db2.controllers;

import it.polimi.db2.application.entities.User;
import it.polimi.db2.application.services.QuestionnaireService;
import it.polimi.db2.application.services.UserService;
import org.thymeleaf.context.WebContext;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CreateQuestionnaireReplies")
public class CreateQuestionnaireReplies extends HttpServlet {
    @EJB(name = "it.polimi.db2.application.services/QuestionnaireService")
    private QuestionnaireService qService;

    @EJB(name = "it.polimi.db2.application.services/UserService")
    private UserService uService;

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

        //TODO: parse data

        List<String> marketingReplies = new ArrayList<>();
        List<String> statsReplies = new ArrayList<>();
        List<String> values = new ArrayList<>();
        Boolean toBan = qService.checkReplies(values);
        if (toBan) {
            uService.banUser(user);
            String bannedPath = getServletContext().getContextPath() + "/banned";
            response.sendRedirect(bannedPath);
        }
        else {
            for (String reply : marketingReplies) {
                qService.addMarketingReply(reply, 1, user);
            }
            for (String reply : statsReplies) {
                qService.addStatsReply(reply, 1, 1, user);
            }
            String greetingsPath = getServletContext().getContextPath() + "/greetings";
            response.sendRedirect(greetingsPath);
        }
    }

    public void destroy() {
    }
}
