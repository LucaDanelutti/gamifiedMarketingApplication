package it.polimi.db2.controllers;

import it.polimi.db2.application.entities.User;
import it.polimi.db2.application.exceptions.CredentialsException;
import it.polimi.db2.application.services.UserService;
import org.apache.commons.lang.StringEscapeUtils;
import org.thymeleaf.context.WebContext;

import javax.ejb.EJB;
import javax.persistence.NonUniqueResultException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/CheckLogin")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB(name = "it.polimi.db2.application.services/UserService")
	private UserService usrService;

	public CheckLogin() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// obtain and escape params
		String username;
		String password;
		try {
			username = StringEscapeUtils.escapeJava(request.getParameter("username"));
			password = StringEscapeUtils.escapeJava(request.getParameter("password"));
			if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
				throw new Exception("Missing or empty credential value");
			}

		} catch (Exception e) {
			// for debugging only e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing credential value");
			return;
		}
		User user;
		try {
			// query db to authenticate for user
			user = usrService.checkCredentials(username, password);
		} catch (CredentialsException | NonUniqueResultException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Could not check credentials");
			return;
		}

		// If the user exists, add info to the session and go to home page, otherwise
		// show login page with error message

		String path;
		if (user == null) { // User not logged in
			ServletContext servletContext = getServletContext();
			final WebContext ctx = new WebContext(request, response, servletContext, request.getLocale());
			request.getSession().setAttribute("errorMsg", "Incorrect username or password");
			path = getServletContext().getContextPath() + "/login";

//			ctx.setVariable("errorMsg", "Incorrect username or password");
//			Thymeleaf.render("login", ctx);
		} else { // User logged in
			request.getSession().setAttribute("user", user);
			path = getServletContext().getContextPath() + "/home";
		}

		response.sendRedirect(path);
	}
}