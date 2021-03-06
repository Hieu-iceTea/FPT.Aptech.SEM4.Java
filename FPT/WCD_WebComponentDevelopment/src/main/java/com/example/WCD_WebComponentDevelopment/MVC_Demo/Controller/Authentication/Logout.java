package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.Authentication;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Logout", urlPatterns = {"/logout", "/logout/"})
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("isLoggedIn");
        request.getSession().removeAttribute("user");

        request.getSession().setAttribute("notification", "You have logged out successfully from the system.");

        response.sendRedirect(request.getContextPath() + "/login");
    }
}
