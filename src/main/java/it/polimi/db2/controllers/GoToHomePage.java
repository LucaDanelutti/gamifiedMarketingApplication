package it.polimi.db2.controllers;

import it.polimi.db2.application.entities.MarketingQuestion;
import it.polimi.db2.application.entities.Questionnaire;
import it.polimi.db2.application.entities.User;
import it.polimi.db2.application.services.QuestionnaireService;
import it.polimi.db2.application.services.UserService;
import org.apache.commons.lang.time.DateUtils;
import org.thymeleaf.context.WebContext;

import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/home")
public class GoToHomePage extends HttpServlet {

	@EJB(name = "it.polimi.db2.application.services/QuestionnaireService")
	private QuestionnaireService qService;

	@EJB(name = "it.polimi.db2.application.services/UserService")
	private UserService uService;

	public GoToHomePage() {
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

		if(user.getIsAdmin()==1){
			String adminPath = getServletContext().getContextPath() + "/admin";
			response.sendRedirect(adminPath);
			return;
		}

		// Get servlet context
		final WebContext ctx = new WebContext(request, response, getServletContext(), request.getLocale());


		//Set user logs to ctx variable
		try {
			ctx.setVariable("logs", user.getLogs());
		}catch (Exception e ){
			ctx.setVariable("errorMsg", "Unable to retrieve logs!");
		}


		//If the user is banned redirect to the banned page
		if (user.getBanned()) {
			String bannedPath = getServletContext().getContextPath() + "/banned";
			response.sendRedirect(bannedPath);
			return;
		}

		//Retrieve the questionnaire of the day
		try {
			Questionnaire questionnaire = qService.getQuestionnaireOfTheDay();
			ctx.setVariable("questionnaire", questionnaire);
			ctx.setVariable("compilationEnabled", !checkCompilation(user));
		} catch (Exception e) {
			ctx.setVariable("errorMsg", "Couldn't retrieve questionnaire of the day!");
		} finally {
			Thymeleaf.render("home", ctx);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		doGet(request, response); // Redirecting post to gets?
	}

	private Boolean checkCompilation(User user) {
		if (DateUtils.isSameDay(user.getLastLog().getTimestamp(), new java.util.Date(System.currentTimeMillis()))) {
			return user.getLastLog().getCompilation_completed();
		}
		return false;
	}
}
