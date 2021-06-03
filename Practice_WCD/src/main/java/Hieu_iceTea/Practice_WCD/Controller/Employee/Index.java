package Hieu_iceTea.Practice_WCD.Controller.Employee;

import Hieu_iceTea.Practice_WCD.Model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/employee", "/employee/", "/employee/index", "/employee/index/"})
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("search");

        List<Employee> employees;
        if (keyword != null) {
            employees = Employee.search(keyword);
        } else {
            employees = Employee.all();
        }

        request.setAttribute("employees", employees);

        request.getRequestDispatcher("/Employee/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
