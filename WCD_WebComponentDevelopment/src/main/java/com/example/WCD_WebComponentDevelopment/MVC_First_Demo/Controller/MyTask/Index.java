package com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Controller.MyTask;

import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.MyTask;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Service.MyTaskContext;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/task", "/task/index", "/task/index/"})
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*List<MyTask> myTasks = (List<MyTask>) request.getSession().getAttribute("myTasks");

        if (myTasks == null) {
            myTasks = new ArrayList<>();
        }

        myTasks.add(new MyTask(3, "Code", "Code thật siêu"));

        request.getSession().setAttribute("myTasks", myTasks);*/

        List<MyTask> myTasks = MyTaskContext.getMyTasks(request);

        request.setAttribute("myTasks", myTasks);

        //response.sendRedirect("MVC_First_Demo/MyTask/index.jsp");
        request.getRequestDispatcher("MVC_First_Demo/MyTask/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
