package Hieu_iceTea.API.service.employee;


import Hieu_iceTea.API.model.Employee;
import Hieu_iceTea.API.service.base.BaseService;

import java.util.List;


public interface EmployeeService extends BaseService<Employee, Integer> {

    List<Employee> getAll(String KeywordSearch);

}
