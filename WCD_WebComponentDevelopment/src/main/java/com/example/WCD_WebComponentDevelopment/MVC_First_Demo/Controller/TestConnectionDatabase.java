package com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet({"/test-connection-database", "/test-connection-database/"})
public class TestConnectionDatabase extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        Connection connection = (Connection) request.getServletContext().getAttribute("dbConnection");
        try {
            out.println("List of users from databases:\n");
            PreparedStatement statement = connection.prepareStatement("select * from wcd_webcomponentdevelopment.user ORDER BY id DESC");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet != null && resultSet.next()) {
                out.println(
                        resultSet.getString("username") + ": "
                                + resultSet.getString("firstname") + ", "
                                + resultSet.getString("lastname")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
