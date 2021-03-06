package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.MyTask;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Service.MyTaskServiceSession;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Task.Delete", value = {"/task/delete", "/task/delete/"})
public class Delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyTaskServiceSession.delete(request, Integer.parseInt(request.getParameter("id")));

        response.sendRedirect(request.getContextPath() + "/task");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
