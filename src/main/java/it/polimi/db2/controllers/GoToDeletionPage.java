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

@WebServlet(urlPatterns = "/adminDelete")
public class GoToDeletionPage extends HttpServlet {
	@EJB(name = "it.polimi.db2.application.services/QuestionnaireService")
	private QuestionnaireService questionnaireService;

	public GoToDeletionPage() {
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

		String idString;
		ArrayList<Questionnaire> questionnaires;
		try {
			idString = request.getParameter("id");
			if(idString==null){
				questionnaires=questionnaireService.getAllPreviousQuestionnaires();
				ctx.setVariable("questionnaires", questionnaires);
				Thymeleaf.render("deletion", ctx);
			}
			else{
				questionnaireService.deleteQuestionnaire(Integer.parseInt(idString));
				String path = getServletContext().getContextPath() + "/adminDelete";
				response.sendRedirect(path);
			}

		} catch (Exception e) {
			e.printStackTrace();
			//response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing credential value");
			return;
		}




	}
}
