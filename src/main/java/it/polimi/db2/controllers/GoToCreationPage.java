package it.polimi.db2.controllers;

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


/**
 * This is the servlet that handles the GET of the creation page for the admin side.
 * It retrieves all the non active questionnaires, so that the user can select them to be enabled.
 */
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

		//check if the user is an admin
		if (user.getIsAdmin() == 0) {
			String homePath = getServletContext().getContextPath() + "/home";
			response.sendRedirect(homePath);
			return;
		}

		//Retrieve the questionnaires not enabled
		try {
			ArrayList<Questionnaire> notEnabled = qService.getNotEnabledQuestionnaires();
			//set the variable only if it is not empty
			if(!notEnabled.isEmpty()) {
				ctx.setVariable("questionnaires", notEnabled);
			}
		} catch (Exception e) {
			ctx.setVariable("errorMsg", "Something went wrong when trying to retrieve the not enabled questionnaires!");
		} finally {
			Thymeleaf.render("creation", ctx);
		}
	}
}
