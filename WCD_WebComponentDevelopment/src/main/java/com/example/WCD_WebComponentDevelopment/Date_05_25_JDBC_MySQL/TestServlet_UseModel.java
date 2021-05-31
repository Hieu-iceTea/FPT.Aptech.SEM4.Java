package com.example.WCD_WebComponentDevelopment.Date_05_25_JDBC_MySQL;

import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "JDBC_MySQL.TestServlet_UseModel", value = {"/JDBC_MySQL/test-servlet-use-model", "/JDBC_MySQL/test-servlet-use-model/"})
public class TestServlet_UseModel extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Context initialContext = new InitialContext();
            Context environmentContext = (Context) initialContext.lookup("java:comp/env");
            DataSource dataSource = (DataSource) environmentContext.lookup("jdbc/mysql/WCD_WebComponentDevelopment");

            Connection connection = dataSource.getConnection();

            // BEGIN...use this connection to access the database...

            PreparedStatement statement = connection.prepareStatement("select * from wcd_webcomponentdevelopment.user");
            ResultSet resultSet = statement.executeQuery();

            List<User> users = new ArrayList<>();

            while (resultSet != null && resultSet.next()) {
                User tmpUser = new User();

                tmpUser.setId(Integer.parseInt(resultSet.getString("id")));
                tmpUser.setUsername(resultSet.getString("username"));
                tmpUser.setEmail(resultSet.getString("email"));

                users.add(tmpUser);
            }


            response.setContentType("text/plain");
            PrintWriter out = response.getWriter();

            out.println("TestServlet_UseModel - Results:\n\n");

            for (User user : users) {
                out.println(
                        user.getId() + ": " + user.getUsername() + ", " + user.getEmail()
                );
            }

            // END...use this connection to access the database...

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

