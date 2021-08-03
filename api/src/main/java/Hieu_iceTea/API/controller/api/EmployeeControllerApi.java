package Hieu_iceTea.API.controller.api;


import Hieu_iceTea.API.model.Employee;
import Hieu_iceTea.API.service.employee.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping(path = "/api/employees")
public class EmployeeControllerApi {

    //Video hướng dẫn của cô ThiDK: http://youtube.com/watch?v=pMxgLOPe_OE

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

        return employeeService.findById(id);

    }
    //endregion


    //region - Create -
    @PostMapping(path = {"", "/"})
    public Employee store(@ModelAttribute Employee user) {

        Employee newEmployee = employeeService.save(user);

        return employeeService.findById(newEmployee.getId());

    }
    //endregion


    //region - Edit -
    @PostMapping(path = {"/{id}", "/{id}/"})
    public Employee update(@ModelAttribute Employee employee) {

        employeeService.save(employee);

        return employeeService.findById(employee.getId());

    }
    //endregion


    //region - Delete -
    @DeleteMapping(path = {"/{id}", "/{id}/"})
    public List<Employee> delete(@PathVariable int id) {

        // 02. Xóa bản ghi database
        employeeService.deleteById(id);

        return employeeService.findAll();

    }
    //endregion

}
