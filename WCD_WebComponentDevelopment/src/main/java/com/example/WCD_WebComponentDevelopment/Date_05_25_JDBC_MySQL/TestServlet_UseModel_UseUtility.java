package com.example.WCD_WebComponentDevelopment.Date_05_25_JDBC_MySQL;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "JDBC_MySQL.TestServlet_UseModel_UseUtility", value = {"/JDBC_MySQL/test-servlet-use-model-use-utility", "/JDBC_MySQL/test-servlet-use-model-use-utility/"})
public class TestServlet_UseModel_UseUtility extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //List<User> users = (List<User>) (List<?>) Utility.executeQuery("select * from user", User.class.getName());
        //List<User> users = (List<User>) Utility.executeQuery("select * from user", User.class.getName());
        List<User> users = User.all();

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        out.println("TestServlet_UseModel - Results:\n\n");

        for (User user : users) {
            out.println(
                    user.getId() + ": " + user.getUsername() + ", " + user.getEmail()
            );
        }
    }
}

