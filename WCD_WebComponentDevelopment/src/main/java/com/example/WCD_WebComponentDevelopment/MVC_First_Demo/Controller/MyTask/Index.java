package com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Controller.MyTask;

import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.MyTask;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Service.MyTaskService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/task", "/task/", "/task/index", "/task/index/"})
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MyTask> myTasks = MyTaskService.all(request);

        request.setAttribute("myTasks", myTasks);

        //response.sendRedirect("MVC_First_Demo/MyTask/index.jsp");
        request.getRequestDispatcher("/MVC_First_Demo/MyTask/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
