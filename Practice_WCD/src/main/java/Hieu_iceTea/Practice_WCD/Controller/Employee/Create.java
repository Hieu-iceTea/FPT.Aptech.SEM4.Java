package Hieu_iceTea.Practice_WCD.Controller.Employee;

import Hieu_iceTea.Practice_WCD.Model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "Employee.Create", value = {"/employee/create", "/employee/create/"})
public class Create extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/Employee/employee.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Employee employee = new Employee();

        // retrieve data from parameter & set data
        employee.setFullName(request.getParameter("full_name"));
        try {
            employee.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birthday")));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        employee.setAddress(request.getParameter("address"));
        employee.setPosition(request.getParameter("position"));
        employee.setDepartment(request.getParameter("department"));

        Employee.create(employee);

        response.sendRedirect(request.getContextPath() + "/employee");
    }
}
