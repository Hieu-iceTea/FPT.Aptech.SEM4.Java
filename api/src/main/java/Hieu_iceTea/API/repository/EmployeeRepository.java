package Hieu_iceTea.API.repository;


import Hieu_iceTea.API.model.Employee;

import java.util.List;


public interface EmployeeRepository extends BaseRepository<Employee, Integer> {

    List<Employee> findAllByFirstNameContainsOrderByIdDesc(String firstName);

}