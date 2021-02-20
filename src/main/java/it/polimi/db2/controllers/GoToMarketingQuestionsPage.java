package it.polimi.db2.controllers;

import it.polimi.db2.application.entities.MarketingQuestion;
import it.polimi.db2.application.entities.User;
import it.polimi.db2.application.services.QuestionnaireService;
import it.polimi.db2.application.services.UserService;
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

@WebServlet(urlPatterns = "/marketing_questions")
public class GoToMarketingQuestionsPage extends HttpServlet {
	@EJB(name = "it.polimi.db2.application.services/QuestionnaireService")
	private QuestionnaireService qService;

	@EJB(name = "it.polimi.db2.application.services/UserService")
	private UserService uService;

	public GoToMarketingQuestionsPage() {
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

		//If the user is banned redirect to the banned page
		if (user.getBanned()) {
			String bannedPath = getServletContext().getContextPath() + "/banned";
			response.sendRedirect(bannedPath);
			return;
		}

		uService.setCompilationRequested(user);

		//Retrieve the questionnaire of the day
		try {
			List<MarketingQuestion> marketingQuestions = qService.getMarketingQuestions(qService.getQuestionnaireOfTheDay().getId());
			ctx.setVariable("marketing_questions", marketingQuestions);
		} catch (Exception e) {
			ctx.setVariable("errorMsg", "Couldn't retrieve marketing questions!");
		} finally {
			Thymeleaf.render("marketing_questions", ctx);
		}
	}
}
