package it.polimi.db2.controllers;

import it.polimi.db2.application.entities.User;
import it.polimi.db2.application.services.UserService;
import org.apache.commons.lang.StringEscapeUtils;
import org.thymeleaf.context.WebContext;

import javax.ejb.EJB;
import javax.json.Json;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.StringReader;

@WebServlet(urlPatterns = "/SubmitAnswers")
public class SubmitAnswers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "it.polimi.db2.application.services/UserService")
	private UserService usrService;

	public SubmitAnswers() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// If the user is not logged in (not present in session) redirect to the login
		HttpSession session = request.getSession();
		if (session.isNew() || session.getAttribute("user") == null) {
			String loginPath = getServletContext().getContextPath() + "/login";
			response.sendRedirect(loginPath);
			return;
		}

		// obtain and escape params
		try {
			// TODO: Parse input params
		} catch (Exception e) {
			// TODO: Update error text
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Input error");
			return;
		}

		User user = (User) session.getAttribute("user");
		// If the user exists, add info to the session and go to home page, otherwise
		// show login page with error message

		String path;
		if (user == null) { // User not logged in
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			request.getSession().setAttribute("errorMsg", "Incorrect username or password");
			path = getServletContext().getContextPath() + "/login";

		} else { // User logged in
			request.getSession().setAttribute("user", user);
			path = getServletContext().getContextPath() + "/greetings";
		}

		response.sendRedirect(path);
	}
}