package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.EnglishVocabulary;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.EnglishVocabulary;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/english-vocabulary", "/english-vocabulary/", "/english-vocabulary/index", "/english-vocabulary/index/"})
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("search");

        List<EnglishVocabulary> englishVocabularies;
        if (keyword != null) {
            englishVocabularies = EnglishVocabulary.search(keyword);
        } else {
            englishVocabularies = EnglishVocabulary.all();
        }

        request.setAttribute("englishVocabularies", englishVocabularies);

        request.getRequestDispatcher("/MVC_Demo/EnglishVocabulary/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
