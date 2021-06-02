package com.example.WCD_WebComponentDevelopment.MVC_Demo.Controller.ProductMenu;

import MyUtilities.Utility;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Product;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Service.MyTaskServiceSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "ProductMenu.Delete", value = {"/product-menu/delete", "/product-menu/delete/"})
public class Delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*Product.delete(Integer.parseInt(request.getParameter("id")));

        response.sendRedirect(request.getContextPath() + "/product-menu");*/
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("id") != null) {
            int id = Integer.parseInt(request.getParameter("id"));

            Product.delete(id);
        }

        if (request.getParameter("ids") != null) {
            String[] str_ids = request.getParameter("ids").split(",");
            int[] ids = Utility.stringToIntArray(str_ids);

            for (int id : ids) {
                Product.delete(id);
            }
        }

        response.sendRedirect(request.getContextPath() + "/product-menu");
    }
}
