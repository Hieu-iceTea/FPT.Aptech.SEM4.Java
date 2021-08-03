package Hieu_iceTea.API.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "employees")
public class Employee extends BaseModel implements Serializable {

    //region - Define Fields -
    private String firstName;
    private String lastName;
    private String email;
    //endregion


    //region - Relationship -

    //endregion


    //region - Getter, Setter -
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    //endregion


    //region - Method Extend -

    //endregion

}