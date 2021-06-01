package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.MyTask;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.MyTask;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Status;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Service.MyTaskService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(urlPatterns = {"/task/edit", "/task/edit/"})
public class Edit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyTask myTask = MyTaskService.find(request, Integer.parseInt(request.getParameter("id")));

        if (myTask == null) {
            response.setContentType("text/html");
            response.getWriter().println("Hieu_iceTea said: [404] The record does not exist or deleted. 😱 😥 ☹ 🤨 😴");
            return;
        }

        request.setAttribute("myTask", myTask);

        request.getRequestDispatcher("/MVC_Demo/MyTask/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyTask myTask = MyTaskService.find(request, Integer.parseInt(request.getParameter("id")));

        myTask.setTitle(request.getParameter("title"));
        myTask.setContent(request.getParameter("content"));
        //myTask.setAssign(request.getParameter("assign"));
        if (!request.getParameter("startDate").isEmpty())
            myTask.setStartDate(LocalDateTime.parse(request.getParameter("startDate")));
        if (!request.getParameter("endDate").isEmpty())
            myTask.setEndDate(LocalDateTime.parse(request.getParameter("endDate")));
        myTask.setStatus(Status.valueOf(request.getParameter("status")));
        myTask.setNote(request.getParameter("note"));

        MyTaskService.update(request, Integer.parseInt(request.getParameter("id")), myTask);

        response.sendRedirect(request.getContextPath() + "/task/show/?id=" + myTask.getId());
    }
}
