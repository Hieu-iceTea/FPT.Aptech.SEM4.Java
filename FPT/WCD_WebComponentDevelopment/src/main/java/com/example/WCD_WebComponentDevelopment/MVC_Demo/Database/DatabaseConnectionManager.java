package com.example.WCD_WebComponentDevelopment.MVC_Demo.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnectionManager {
    private Connection connection;

    public DatabaseConnectionManager(String username, String password, String driver, String dbUrl) throws ClassNotFoundException, SQLException {
        Class.forName(driver); //TODO ???
        this.connection = DriverManager.getConnection(dbUrl, username, password);
    }

    public Connection getConnection() {
        return this.connection;
    }
}
