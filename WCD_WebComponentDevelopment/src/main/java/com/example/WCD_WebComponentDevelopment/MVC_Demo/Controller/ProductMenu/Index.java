package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.ProductMenu;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/product-menu", "/product-menu/", "/product-menu/index", "/product-menu/index/"})
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = Product.all();

        request.setAttribute("products", products);

        request.getRequestDispatcher("/MVC_Demo/ProductMenu/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
