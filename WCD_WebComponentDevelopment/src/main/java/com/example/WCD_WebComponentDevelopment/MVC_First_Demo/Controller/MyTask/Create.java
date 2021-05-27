package com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Controller.MyTask;

import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.MyTask;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.Status;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Service.MyTaskService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "Task.Create", value = {"/task/create", "/task/create/"})
public class Create extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/MVC_First_Demo/MyTask/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyTask myTask = new MyTask();

        myTask.setTitle(request.getParameter("title"));
        myTask.setContent(request.getParameter("content"));
        //myTask.setAssign(request.getParameter("assign"));
        if (!request.getParameter("startDate").isEmpty())
            myTask.setStartDate(LocalDateTime.parse(request.getParameter("startDate")));
        if (!request.getParameter("endDate").isEmpty())
            myTask.setEndDate(LocalDateTime.parse(request.getParameter("endDate")));
        myTask.setStatus(Status.valueOf(request.getParameter("status")));
        myTask.setNote(request.getParameter("note"));

        MyTaskService.create(request, myTask);

        response.sendRedirect(request.getContextPath() + "/task/show/?id=" + myTask.getId());
    }
}
