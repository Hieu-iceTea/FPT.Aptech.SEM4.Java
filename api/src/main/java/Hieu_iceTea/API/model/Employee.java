package Hieu_iceTea.API.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "employees")
public class Employee extends BaseModel implements Serializable {

    //region - Define Fields -
    private String name;
    private double wage;
    //endregion


    //region - Relationship -

    //endregion


    //region - Getter, Setter -
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getWage() {
        return wage;
    }

    public void setWage(double wage) {
        this.wage = wage;
    }
    //endregion


    //region - Method Extend -

    //endregion

}