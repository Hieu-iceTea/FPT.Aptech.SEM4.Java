package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.EnglishVocabulary;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.EnglishVocabulary;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = {"/english-vocabulary/edit", "/english-vocabulary/edit/"})
public class Edit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Find
        EnglishVocabulary englishVocabulary = EnglishVocabulary.find(Integer.parseInt(request.getParameter("id")));

        // retrieve data from parameter & set data
        englishVocabulary.setWord(request.getParameter("word"));
        englishVocabulary.setPhonetic(request.getParameter("phonetic"));
        englishVocabulary.setMean(request.getParameter("mean"));
        englishVocabulary.setStatus(Boolean.parseBoolean(request.getParameter("status")));

        //englishVocabulary.setVersion(Integer.parseInt(request.getParameter("version")));

        // Update
        EnglishVocabulary.update(englishVocabulary);

        // Show list
        response.sendRedirect(request.getContextPath() + "/english-vocabulary");
    }
}
