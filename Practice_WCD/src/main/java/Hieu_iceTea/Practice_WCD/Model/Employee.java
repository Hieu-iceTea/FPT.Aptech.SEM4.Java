package Hieu_iceTea.Practice_WCD.Model;

import Hieu_iceTea.Practice_WCD.Service.EmployeeDatabaseUtility;
import MyUtilities.DatabaseUtility;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.Date;
import java.util.List;

public class Employee extends BaseModel {
    private String FullName;
    private Date Birthday;
    private String Address;
    private String Position;
    private String Department;

    //region - Getter, Setter -

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String fullName) {
        FullName = fullName;
    }

    public Date getBirthday() {
        return Birthday;
    }

    public void setBirthday(Date birthday) {
        Birthday = birthday;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getPosition() {
        return Position;
    }

    public void setPosition(String position) {
        Position = position;
    }

    public String getDepartment() {
        return Department;
    }

    public void setDepartment(String department) {
        Department = department;
    }


    //endregion

    //region - Query SQL Methods -
    
    private static EmployeeDatabaseUtility getEmployeeDatabaseUtility() {
        try {
            Context initContext = null;
            DataSource dataSource;

            initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/mysql/WCD_WebComponentDevelopment_Practice");

            return new EmployeeDatabaseUtility(dataSource);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static List<Employee> all() {
        //Cách 1: Mapping model bằng tay thủ công
        /*try {
            return getEmployeeDatabaseUtility().all();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }*/

        //Cách 2: Tự lập trình chức năng "Auto Mapping To Model", để tái sử dụng nhiều lần
        return (List<Employee>) DatabaseUtility.executeQuery_AutoMappingToModel("SELECT * FROM employee WHERE deleted = false ORDER BY id DESC", Employee.class.getName());
    }

    public static Employee find(int id) {
        //Cách 1: Mapping model bằng tay thủ công
        /*try {
            return getEmployeeDatabaseUtility().find(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }*/

        //Cách 2: Tự lập trình chức năng "Auto Mapping To Model", để tái sử dụng nhiều lần
        List<?> result = DatabaseUtility.executeQuery_AutoMappingToModel("SELECT * FROM employee WHERE deleted = false and id = " + id, Employee.class.getName());
        if (result.size() == 0) {
            return null;
        }

        return (Employee) result.get(0);
    }

    public static void create(Employee employee) {
        try {
            getEmployeeDatabaseUtility().create(employee);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void update(Employee employee) {
        try {
            getEmployeeDatabaseUtility().update(employee);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delete(int id) {
        try {
            getEmployeeDatabaseUtility().delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Employee> search(String keyword) {
        //Cách 1: Mapping model bằng tay thủ công
        /*try {
            return getEmployeeDatabaseUtility().search();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }*/

        //Cách 2: Tự lập trình chức năng "Auto Mapping To Model", để tái sử dụng nhiều lần
        return (List<Employee>) DatabaseUtility.executeQuery_AutoMappingToModel("SELECT * FROM employee WHERE deleted = false and full_name like '%" + keyword + "%' ORDER BY id DESC", Employee.class.getName());
    }
    
    //endregion
}
