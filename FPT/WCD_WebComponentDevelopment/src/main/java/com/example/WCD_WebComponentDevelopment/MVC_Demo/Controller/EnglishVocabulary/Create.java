package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.EnglishVocabulary;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.EnglishVocabulary;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = {"/english-vocabulary/create", "/english-vocabulary/create/"})
public class Create extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.getRequestDispatcher("/MVC_Demo/EnglishVocabulary/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EnglishVocabulary englishVocabulary = new EnglishVocabulary();

        // retrieve data from parameter & set data
        englishVocabulary.setWord(request.getParameter("word"));
        englishVocabulary.setPhonetic(request.getParameter("phonetic"));
        englishVocabulary.setMean(request.getParameter("mean"));
        englishVocabulary.setStatus(Boolean.parseBoolean(request.getParameter("status")));

        EnglishVocabulary.create(englishVocabulary);

        response.sendRedirect(request.getContextPath() + "/english-vocabulary");
    }
}
