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

            String notFormattedDate = request.getParameter("product-date");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            qDate = format.parse(notFormattedDate);

            Date currentDate= new Date(System.currentTimeMillis());

            if(DateUtils.isSameDay(qDate,currentDate)){
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Only current date or posterior");
                return;
            }

            Part imgFile = request.getPart("product-image");
            InputStream imgContent = imgFile.getInputStream();
            qImage = readImage(imgContent);

            if (qName == null || qDate == null ||  qImage==null) {
                throw new Exception("Missing some input!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            //response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing credential value");
            return;
        }


        try {
            //last value is reviews==null because we create fake reviews on the business side
            questionnaireService.createQuestionnaire(qName,qImage,qDate,null);
        } catch (Exception e) {
            //TODO: catch correct exception
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Duplicate Date");
            return;
        }

        String path = getServletContext().getContextPath() + "/adminCreate";
        response.sendRedirect(path);
    }

    public  byte[] readImage(InputStream imageInputStream) throws IOException {

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];// image can be maximum of 4MB
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
