package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.MyTask;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.MyTask;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Service.MyTaskServiceSession;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(urlPatterns = {"/task/show", "/task/show/"})
public class Show extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyTask myTask = MyTaskServiceSession.find(request, Integer.parseInt(request.getParameter("id")));

        if (myTask == null) {
            response.setContentType("text/html");
            response.getWriter().println("Hieu_iceTea said: [404] The record does not exist or deleted. 😱 😥 ☹ 🤨 😴");
            return;
        }

        request.setAttribute("myTask", myTask);

        request.getRequestDispatcher("/MVC_Demo/MyTask/show.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
