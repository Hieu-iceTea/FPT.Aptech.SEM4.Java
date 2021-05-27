package com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Controller.MyTask;

import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.MyTask;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Service.MyTaskContext;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(urlPatterns = {"/task/show", "/task/show/"})
public class Show extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyTask myTask = MyTaskContext.getMyTask(request, Integer.parseInt(request.getParameter("id")));

        if (myTask == null) {
            response.getWriter().println("The record does not exist or deleted. 😥 🤨 😴 ☹ 😱");
            return;
        }

        request.setAttribute("myTask", myTask);

        request.getRequestDispatcher("/MVC_First_Demo/MyTask/show.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
