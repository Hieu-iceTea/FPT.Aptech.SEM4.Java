package Hieu_iceTea.API.controller.api;


import Hieu_iceTea.API.controller.api.exception.EmployeeNotFoundException;
import Hieu_iceTea.API.model.Employee;
import Hieu_iceTea.API.service.employee.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping(path = "/api/employees")
public class EmployeeControllerApi {

    //Video hướng dẫn của cô ThiDK: http://youtube.com/watch?v=pMxgLOPe_OE
    //Video hướng dẫn của cô ThiDK - video 2: https://www.youtube.com/watch?v=nimev8Djyd8

    //region - Autowired Service -
    @Autowired
    private EmployeeService employeeService;
    //endregion


    //region - Display -
    @GetMapping(path = {"", "/", "/index"})
    public List<Employee> index(@RequestParam(required = false) String search) {

        return employeeService.getAll(search);

    }

    @GetMapping(path = {"/{id}", "/{id}/"})
    public Employee show(@PathVariable int id) {

        Employee employee = employeeService.findById(id);

        if (employee == null) {
            throw new EmployeeNotFoundException("Employee id not found - " + id);
        }

        return employee;

    }
    //endregion


    //region - Create -
    @PostMapping(path = {"", "/"})
    public Employee store(@RequestBody Employee employee) {

        employee.setId(0);

        return employeeService.save(employee);

    }
    //endregion


    //region - Edit -
    @PutMapping(path = {"/{id}", "/{id}/"})
    public Employee update(@RequestBody Employee employee) {

        return employeeService.save(employee);

    }
    //endregion


    //region - Delete -
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public String delete(@PathVariable int id) {

        if (employeeService.findById(id) == null) {
            throw new EmployeeNotFoundException("Employee id not found - " + id);
        }

        // 02. Xóa bản ghi database
        employeeService.deleteById(id);

        return "Deleted employee id - " + id;

    }
    //endregion

}
