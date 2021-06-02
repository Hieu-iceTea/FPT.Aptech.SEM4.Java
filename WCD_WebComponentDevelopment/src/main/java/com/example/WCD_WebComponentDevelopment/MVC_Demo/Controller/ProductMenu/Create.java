package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.ProductMenu;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.MyTask;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Product;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Status;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Service.MyTaskServiceSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "ProductMenu.Create", value = {"/product-menu/create", "/product-menu/create/"})
public class Create extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/MVC_Demo/ProductMenu/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();

        // retrieve data from parameter & set data
        product.setProductCategoryId(Integer.parseInt(request.getParameter("productCategoryId")));
        product.setRestaurantId(Integer.parseInt(request.getParameter("restaurantId")));
        product.setName(request.getParameter("name"));
        product.setIngredients(request.getParameter("ingredients"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setImage(request.getParameter("image"));
        product.setCountry(request.getParameter("country"));
        product.setTag(request.getParameter("tag"));
        product.setDescription(request.getParameter("description"));
        product.setFeatured(Boolean.parseBoolean(request.getParameter("featured")));

        Product.create(product);

        response.sendRedirect(request.getContextPath() + "/product-menu");
    }
}
