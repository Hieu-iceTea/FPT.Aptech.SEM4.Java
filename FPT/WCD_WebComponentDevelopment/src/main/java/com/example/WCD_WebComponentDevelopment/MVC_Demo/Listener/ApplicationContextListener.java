package com.example.WCD_WebComponentDevelopment.MVC_Demo.Listener;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Database.DatabaseConnectionManager;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.sql.Connection;
import java.sql.SQLException;

@WebListener
public class ApplicationContextListener  implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();

        String username = context.getInitParameter("username");
        String password = context.getInitParameter("password");
        String driver = context.getInitParameter("driver");
        String dbUrl = context.getInitParameter("dbUrl");

        try {
            DatabaseConnectionManager databaseConnectionManager = new DatabaseConnectionManager(username, password, driver, dbUrl);
            Connection connection = databaseConnectionManager.getConnection();
            context.setAttribute("dbConnection", connection);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        Connection connection = (Connection) sce.getServletContext().getAttribute("dbConnection");
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
