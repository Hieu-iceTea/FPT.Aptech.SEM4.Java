package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.EnglishVocabulary;

import MyUtilities.Utility;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.EnglishVocabulary;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = {"/english-vocabulary/delete", "/english-vocabulary/delete/"})
public class Delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*EnglishVocabulary.delete(Integer.parseInt(request.getParameter("id")));

        response.sendRedirect(request.getContextPath() + "/english-vocabulary");*/
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));

            EnglishVocabulary.delete(id);
        }

        response.sendRedirect(request.getContextPath() + "/english-vocabulary");
    }
}
