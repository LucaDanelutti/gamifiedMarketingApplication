package it.polimi.db2.controllers;

import it.polimi.db2.application.entities.User;
import it.polimi.db2.application.services.QuestionnaireService;
import org.thymeleaf.context.WebContext;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * This is the servlet the receives the POST to create a new marketing question.
 * It checks that the user asking for the operation is an Admin user.
 * It receives the id of the questionnaire, the text of the question and the type of the question.
 */
@WebServlet("/CreateMarketingQuestion")
public class CreateMarketingQuestion extends HttpServlet {
    @EJB(name = "it.polimi.db2.application.services/QuestionnaireService")
    private QuestionnaireService questionnaireService;


    public CreateMarketingQuestion() {
    }

    public void init() throws ServletException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        //check that the user is an admin
        if (user.getIsAdmin() == 0) {
            String homePath = getServletContext().getContextPath() + "/home";
            response.sendRedirect(homePath);
            return;
        }


        int questionnaireId;
        String text;
        int type;
        try {
            //get the parameters from the post
            questionnaireId=Integer.parseInt(request.getParameter("question-questionnaireID"));
            text = request.getParameter("question-text");
            type = Integer.parseInt(request.getParameter("question-type"));
            //contact the EJB QuestionnaireService to add the marketing question
            questionnaireService.addMarketingQuestion(questionnaireId,type,text);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Something went wrong when adding the question!");
            return;
        }

        //set the path to redirect
        String path = getServletContext().getContextPath() + "/adminCreate";
        response.sendRedirect(path);
    }


    public void destroy() {
    }
}
