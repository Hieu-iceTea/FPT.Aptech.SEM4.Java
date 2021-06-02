package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.ProductMenu;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = {"/product-menu/edit", "/product-menu/edit/"})
public class Edit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = Product.find(Integer.parseInt(request.getParameter("id")));

        if (product == null) {
            response.setContentType("text/html");
            response.getWriter().println("Hieu_iceTea said: [404] The record does not exist or deleted. 😱 😥 ☹ 🤨 😴");
            return;
        }

        request.setAttribute("product", product);

        request.getRequestDispatcher("/MVC_Demo/ProductMenu/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Find
        Product product = Product.find(Integer.parseInt(request.getParameter("id")));

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

        product.setVersion(Integer.parseInt(request.getParameter("version")));

        // Update
        Product.update(product);

        // Show
        response.sendRedirect(request.getContextPath() + "/product-menu/show/?id=" + product.getId());
    }
}
