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
 * This is the servlet that handles the GET for the deletion page of the admin side.
 * It retrieves all the previous questionnaires.
 * If the get to this servlet was made with the parameter "id" set, the servlet deletes the specified questionnaire.
 * A check is made so that the questionnaire deleted was actually available to be deleted.
 */
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

		//check if the user is an admin
		if (user.getIsAdmin() == 0) {
			String homePath = getServletContext().getContextPath() + "/home";
			response.sendRedirect(homePath);
			return;
		}


		String idString;
		ArrayList<Questionnaire> questionnaires;
		try {
			idString = request.getParameter("id");


			if(idString==null){ //the parameter "id" was NOT set
				//just retrieve the questionnaires and render the page
				questionnaires=questionnaireService.getAllPreviousQuestionnaires();
				ctx.setVariable("questionnaires", questionnaires);
				Thymeleaf.render("deletion", ctx);
			}
			else{ //the parameter "id" WAS set
				//retrieve the questionnaires
				questionnaires=questionnaireService.getAllPreviousQuestionnaires();
				//check if the provided "id" corresponds to one of the previous questionnaires
				for (Questionnaire q: questionnaires) {
					if(q.getId()==Integer.parseInt(idString)){
						//if a match is found, delete the questionnaire
						questionnaireService.deleteQuestionnaire(Integer.parseInt(idString));
						//and redirect the user to the delete page
						String path = getServletContext().getContextPath() + "/adminDelete";
						response.sendRedirect(path);
						return;
					}
				}
				//if a match is not found render an error page
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "The provided ID does not correspond to any previous questionnaire!");
			}

		} catch (Exception e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Something went wrong when trying to delete a questionnaire!");
		}

	}
}
