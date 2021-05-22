package com.example.WCD_WebComponentDevelopment.Date_05_22;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "FormResponse", value = "/FormResponse")
public class FormResponse extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Step 1: set the content type
        response.setContentType("text/html");

        // Step 2: get the printwriter
        PrintWriter out = response.getWriter();

        // Step 3: generate HTML content
        out.println("<html><body>");

        out.println("First name: " + request.getParameter("firstname"));
        out.println("<br>");
        out.println("Last name: " + request.getParameter("lastname"));

        out.println("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
