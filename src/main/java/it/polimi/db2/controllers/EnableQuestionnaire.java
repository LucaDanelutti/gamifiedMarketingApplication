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

@WebServlet("/EnableQuestionnaire")
@MultipartConfig
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

        int questionnaireId;

        try {
            questionnaireId=Integer.parseInt(request.getParameter("toBeEnabledId"));
            questionnaireService.enableQuestionnaire(questionnaireId);
        } catch (Exception e) {
            e.printStackTrace();
            //response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing credential value");
            return;
        }

        String path = getServletContext().getContextPath() + "/adminCreate";
        response.sendRedirect(path);
    }


    public void destroy() {
    }
}
