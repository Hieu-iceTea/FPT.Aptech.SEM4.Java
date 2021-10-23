package com.example.WCD_WebComponentDevelopment.Date_05_25_JDBC_MySQL;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.PrintWriter;
import java.sql.Connection;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "JDBC_MySQL.TestServlet", value = {"/JDBC_MySQL/test-servlet", "/JDBC_MySQL/test-servlet/"})
public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Context initialContext = new InitialContext();
            Context environmentContext = (Context) initialContext.lookup("java:comp/env");
            DataSource dataSource = (DataSource) environmentContext.lookup("jdbc/mysql/DatabaseName_Test");

            Connection connection = dataSource.getConnection();

            // BEGIN...use this connection to access the database...

            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();

            out.println("TestServlet - Results:\n\n");

            PreparedStatement statement = connection.prepareStatement("select * from databasename_test.tablename_test");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet != null && resultSet.next()) {
                out.println(
                        resultSet.getString("id") + ": "
                                + resultSet.getString("foo") + ", "
                                + resultSet.getString("bar")
                );
            }

            // END...use this connection to access the database...

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

