package it.polimi.db2.controllers;

import it.polimi.db2.application.entities.User;
import org.thymeleaf.context.WebContext;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * This is the servlet that handles the GET for the admin page.
 */
@WebServlet(urlPatterns = "/admin")
public class GoToAdminPage extends HttpServlet {


	public GoToAdminPage() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

		//Redirect the user if not an admin
		if (user.getIsAdmin() == 0) {
			String homePath = getServletContext().getContextPath() + "/home";
			response.sendRedirect(homePath);
			return;
		}

		Thymeleaf.render("admin", ctx);
	}
}
