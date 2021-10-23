package com.example.WCD_WebComponentDevelopment.Date_05_22;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "HelloServlet_Date", value = "/05_22/Hello-Servlet-Date")
public class HelloServlet_Date extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Step 1: set the content type
        response.setContentType("text/html");

        // Step 2: get the printwriter
        PrintWriter out = response.getWriter();

        // Step 3: generate HTML content
        out.println("<html><body>");

        out.println("<h1>" + "Hello World - Date" + "</h1>");
        out.println("<hr>");
        out.println("Time on the server is: " + new java.util.Date());

        out.println("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
