package it.polimi.db2.controllers;

import it.polimi.db2.application.entities.MarketingQuestion;
import it.polimi.db2.application.entities.Questionnaire;
import it.polimi.db2.application.entities.User;
import it.polimi.db2.application.services.QuestionnaireService;
import org.thymeleaf.context.WebContext;

import javax.ejb.EJB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/adminCreate")
public class GoToCreationPage extends HttpServlet {
	@EJB(name = "it.polimi.db2.application.services/QuestionnaireService")
	private QuestionnaireService qService;

	public GoToCreationPage() {
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

		if (user.getIsAdmin() == 0) {
			String homePath = getServletContext().getContextPath() + "/home";
			response.sendRedirect(homePath);
			return;
		}


		//Retrieve the questionnaire of the day
		try {
			ArrayList<Questionnaire> notEnabled = qService.getNotEnabledQuestionnaires();
			ctx.setVariable("questionnaires", notEnabled);
		} catch (Exception e) {
			e.printStackTrace();
			//TODO: add correct exception handling
			//ctx.setVariable("errorMsg", "Couldn't retrieve marketing questions!");
		} finally {
			Thymeleaf.render("creation", ctx);
		}
	}
}
