package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.User;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.User;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Service.UserDatabaseUtility;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

@WebServlet(name = "DemoCRUD", value = "/user/demo-crud")
public class DemoCRUD extends HttpServlet {

    private UserDatabaseUtility userDatabaseUtility;
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        super.init();

        Context initContext = null;
        try {
            initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/mysql/WCD_WebComponentDevelopment");
        } catch (NamingException e) {
            e.printStackTrace();
        }

        // create our user db util ... and pass in the conn pool / datasource
        try {
            userDatabaseUtility = new UserDatabaseUtility(dataSource);
        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // read the "command" parameter
            String theCommand = request.getParameter("command");

            // if the command is missing, then default to listing users
            if (theCommand == null) {
                theCommand = "LIST";
            }

            // route to the appropriate method
            switch (theCommand) {
                case "LIST":
                    listUsers(request, response);
                    break;
                case "ADD":
                    addUser(request, response);
                    break;
                case "LOAD":
                    loadUser(request, response);
                    break;
                case "UPDATE":
                    updateUser(request, response);
                    break;
                case "DELETE":
                    deleteUser(request, response);
                    break;
                default:
                    listUsers(request, response);
            }

        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // read user id from form data
        String id = request.getParameter("id");

        // delete user from database
        userDatabaseUtility.delete(Integer.parseInt(id));

        // send them back to "list users" page
        listUsers(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // create a new user object
        User item = new User();

        // read user info from form data
        item = getUserFormRequest(request);
        item.setId(Integer.parseInt(request.getParameter("id")));
        item.setVersion(Integer.parseInt(request.getParameter("version")));

        // perform update on database
        userDatabaseUtility.update(item);

        // send them back to the "list users" page
        listUsers(request, response);

    }

    private void loadUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // read user id from form data
        String id = request.getParameter("id");

        // get user from database (db util)
        User user = userDatabaseUtility.find(Integer.parseInt(id));

        // place user in the request attribute
        request.setAttribute("user", user);

        // send to jsp page: edit.jsp
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/MVC_Demo/User/DemoCRUD/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // create a new user object
        User item = new User();

        // read user info from form data
        item = getUserFormRequest(request);

        // add the user to the database
        userDatabaseUtility.create(item);

        // send back to main page (the user list)
        listUsers(request, response);
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // get users from db util
        List<User> users = userDatabaseUtility.all();

        // add users to the request
        request.setAttribute("users", users);

        // send to JSP page (view)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/MVC_Demo/User/DemoCRUD/index.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    private User getUserFormRequest(HttpServletRequest request) throws SQLException, ParseException {
        // create new item object
        User tempItem = new User();

        // retrieve data from result set row & set data
        tempItem.setUsername(request.getParameter("username"));
        tempItem.setPassword(request.getParameter("password"));
        tempItem.setFirstname(request.getParameter("firstname"));
        tempItem.setLastname(request.getParameter("lastname"));
        tempItem.setGender(Integer.parseInt(request.getParameter("gender")));
        tempItem.setEmail(request.getParameter("email"));
        tempItem.setPhone(request.getParameter("phone"));
        tempItem.setAddress(request.getParameter("address"));
        tempItem.setLevel(Integer.parseInt(request.getParameter("level")));
        tempItem.setImage(request.getParameter("image"));
        tempItem.setActive(Boolean.parseBoolean(request.getParameter("active")));

        return tempItem;
    }
}
