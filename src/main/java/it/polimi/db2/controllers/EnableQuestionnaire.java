package it.polimi.db2.controllers;

import it.polimi.db2.application.entities.User;
import it.polimi.db2.application.services.QuestionnaireService;
import org.thymeleaf.context.WebContext;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * This is the servlet that handles the POST for the activation of a questionnaire.
 * A questionnaire needs to be enabled after creation, so that the admin has time to insert all
 * the marketing questions before a user answers them.
 * This applies only when we are creating a questionnaire for the same day.
 *
 */
@WebServlet("/EnableQuestionnaire")
public class EnableQuestionnaire extends HttpServlet {
    @EJB(name = "it.polimi.db2.application.services/QuestionnaireService")
    private QuestionnaireService questionnaireService;


    public EnableQuestionnaire() {
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

        //retrieve the questionnaire id from the input data
        int questionnaireId;
        try {
            questionnaireId=Integer.parseInt(request.getParameter("toBeEnabledId"));
            //enable the selected questionnaire
            questionnaireService.enableQuestionnaire(questionnaireId);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Something went wrong when trying to enable the questionnaire!");
            return;
        }

        //create the path to redirect the user
        String path = getServletContext().getContextPath() + "/adminCreate";
        response.sendRedirect(path);
    }


    public void destroy() {
    }
}
