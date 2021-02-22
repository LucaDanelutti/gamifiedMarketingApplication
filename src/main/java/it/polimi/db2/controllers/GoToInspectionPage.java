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
import java.util.List;

@WebServlet(urlPatterns = "/adminInspect")
public class GoToInspectionPage extends HttpServlet {

	@EJB(name = "it.polimi.db2.application.services/QuestionnaireService")
	private QuestionnaireService qService;

	@EJB(name = "it.polimi.db2.application.services/UserService")
	private UserService uService;

	public GoToInspectionPage() {
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

		String questionnaireId = request.getParameter("id");

		if ( questionnaireId == null) { // We're on the LIST page

			ctx.setVariable("questionnaires", qService.getQuestionnaires());
			Thymeleaf.render("inspection", ctx);
		} else { // We're on the DETAILS page
			List<User> usersSubmit = uService.getUsersWhoSubmittedQuestionnaire(questionnaireId);
			List<User> usersCancel = uService.getUsersWhoCancelledQuestionnaire(questionnaireId);
			List<MarketingQuestion> marketingQuestions = qService.getQuestionnaireMarketingQuestions(questionnaireId);
			ctx.setVariable("users_submit", usersSubmit);
			ctx.setVariable("users_cancel", usersCancel);
			ctx.setVariable("marketing_questions", marketingQuestions);
			Thymeleaf.render("inspection_details", ctx);
		}
	}
}
