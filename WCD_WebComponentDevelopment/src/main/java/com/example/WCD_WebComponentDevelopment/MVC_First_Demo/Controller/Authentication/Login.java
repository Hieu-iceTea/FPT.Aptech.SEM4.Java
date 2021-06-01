package com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Controller.Authentication;

import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.User;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(urlPatterns = {"/login", "/login/"})
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/MVC_First_Demo/Authentication/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String urlContinue = request.getParameter("urlContinue");

        User user = UserService.check(request, username, password);

        if (user != null) {
            request.getSession().setAttribute("isLoggedIn", true);
            request.getSession().setAttribute("user", user);

            response.sendRedirect(request.getContextPath() + "/" + urlContinue);
        } else {
            request.getSession().setAttribute("errorMessage", "Invalid Username/Password.");

            response.sendRedirect(request.getContextPath() + "/login/?urlContinue=" + urlContinue);
        }
    }
}
