package it.polimi.db2.controllers;

import org.thymeleaf.context.WebContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

// "" is what you thing "/" would do. Except the fact that "/" matches all pages.
@WebServlet(urlPatterns = {"/login", ""})
public class GoToLogin extends HttpServlet {

    public GoToLogin() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // If the user is not logged in (not present in session) redirect to the login
        HttpSession session = request.getSession();
        if (session.isNew() || session.getAttribute("user") == null) {
            Thymeleaf.render("login", new WebContext(request, response, getServletContext()));
            return;
        }

        String homePath = getServletContext().getContextPath() + "/home";
        response.sendRedirect(homePath);
    }
}
