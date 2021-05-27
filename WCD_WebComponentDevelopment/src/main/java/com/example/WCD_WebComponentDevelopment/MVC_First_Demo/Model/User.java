package com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model;

public class User extends BaseModel {
    private String Username;
    private String Password;

    private String Firstname;
    private String Lastname;

    private String Gender;
    private String Email;
    private String Phone;
    private String Address;

    private String Level;
    private Boolean Active;

    public User() {
        super();
    }

    public User(String firstname, String lastname) {
        super();

        Firstname = firstname;
        Lastname = lastname;
    }

    public User(int id, String username) {
        super(id);

        Username = username;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getFirstname() {
        return Firstname;
    }

    public void setFirstname(String firstname) {
        Firstname = firstname;
    }

    public String getLastname() {
        return Lastname;
    }

    public void setLastname(String lastname) {
        Lastname = lastname;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        Gender = gender;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getLevel() {
        return Level;
    }

    public void setLevel(String level) {
        Level = level;
    }

    public Boolean getActive() {
        return Active;
    }

    public void setActive(Boolean active) {
        Active = active;
    }
}
