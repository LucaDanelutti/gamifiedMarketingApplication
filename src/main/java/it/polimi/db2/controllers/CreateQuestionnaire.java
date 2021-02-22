package it.polimi.db2.controllers;

import it.polimi.db2.application.entities.User;
import it.polimi.db2.application.services.QuestionnaireService;
import org.thymeleaf.context.WebContext;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;
import org.apache.commons.lang3.time.DateUtils;


/**
 * This is the servlet that handles the POST for the creation of a new questionnaire.
 * It checks that the current user is an Admin.
 * It uses and additional function to parse the uploaded image into a byte[] stream.
 * It needs the MultipartConfig to work with a enctype="multipart/form-data" type of html form.
 */
@WebServlet("/CreateQuestionnaire")
@MultipartConfig
public class CreateQuestionnaire extends HttpServlet {
    @EJB(name = "it.polimi.db2.application.services/QuestionnaireService")
    private QuestionnaireService questionnaireService;


    public CreateQuestionnaire() {
    }

    public void init() throws ServletException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        //check that the user is an admin
        if (user.getIsAdmin() == 0) {
            String homePath = getServletContext().getContextPath() + "/home";
            response.sendRedirect(homePath);
            return;
        }

        //get the values from the post
        String qName;
        Date qDate;
        byte[] qImage;

        try {
            qName = request.getParameter("product-name");

            //parse the String input date into a valid Date format
            String notFormattedDate = request.getParameter("product-date");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            qDate = format.parse(notFormattedDate);


            //throw an error if it is trying to create a questionnaire for a previous date
            //DateUtils allows the comparison of the two Date disregarding the hours of the days
            Date currentDate= new Date(System.currentTimeMillis());
            if(DateUtils.truncatedCompareTo(currentDate,qDate,Calendar.DAY_OF_MONTH)>0){
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Only current date or posterior");
                return;
            }

            //request and parse the image into a byte[]
            Part imgFile = request.getPart("product-image");
            InputStream imgContent = imgFile.getInputStream();
            qImage = readImage(imgContent);

            //if some of the values are null throw an error
            //all the fields must be filled
            if (qName == null || qDate == null ||  qImage==null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All the fields must be filled!");
                return;
            }

        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Something went wrong when trying to retrieve the input data!");
            return;
        }


        //insert the new questionnaire
        try {
            //last value is reviews==null because we create fake reviews on the business side
            questionnaireService.createQuestionnaire(qName,qImage,qDate,null);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Something went wrong when trying to add the new questionnaire!");
            return;
        }

        //prepare the path to redirect the user
        String path = getServletContext().getContextPath() + "/adminCreate";
        response.sendRedirect(path);
    }

    /**
     * Utility function to create a byte[] from an InputStream
     * @param imageInputStream the image to be parsed
     * @return the byte array
     * @throws IOException
     */
    public  byte[] readImage(InputStream imageInputStream) throws IOException {

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[16384];// image can be maximum of 16MB
        int bytesRead = -1;

        try {
            while ((bytesRead = imageInputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            byte[] imageBytes = outputStream.toByteArray();
            return imageBytes;
        } catch (IOException e) {
            throw e;
        }

    }

    public void destroy() {
    }
}
