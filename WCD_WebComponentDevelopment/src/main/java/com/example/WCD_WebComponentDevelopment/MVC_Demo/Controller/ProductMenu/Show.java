package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.ProductMenu;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = {"/product-menu/show", "/product-menu/show/"})
public class Show extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = Product.find(Integer.parseInt(request.getParameter("id")));

        if (product == null) {
            response.setContentType("text/html");
            response.getWriter().println("Hieu_iceTea said: [404] The record does not exist or deleted. 😱 😥 ☹ 🤨 😴");
            return;
        }

        request.setAttribute("product", product);

        request.getRequestDispatcher("/MVC_Demo/ProductMenu/show.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
