package Hieu_iceTea.API.service.employee;


import Hieu_iceTea.API.model.Employee;
import Hieu_iceTea.API.repository.EmployeeRepository;
import Hieu_iceTea.API.service.base.BaseServiceImplement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class EmployeeServiceImplement extends BaseServiceImplement<Employee, Integer> implements EmployeeService {

    //region Initialization - Autowired
    @Autowired
    private EmployeeRepository employeeRepository;

    public EmployeeServiceImplement(EmployeeRepository repository) {
        super(repository);
    }
    //endregion


    //region Method
    @Override
    public List<Employee> getAll(String KeywordSearch) {
        List<Employee> products;
        if (KeywordSearch == null) {
            products = employeeRepository.findAllByOrderByIdDesc();
        } else {
            products = employeeRepository.findAllByNameContainsOrderByIdDesc(KeywordSearch);
        }

        return products;
    }
    //endregion

}
