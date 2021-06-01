package com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Controller.User;

import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.MyTask;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.User;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Service.MyTaskService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/user", "/user/", "/user/index", "/user/index/"})
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = User.all();

        request.setAttribute("users", users);

        request.getRequestDispatcher("/MVC_First_Demo/User/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
