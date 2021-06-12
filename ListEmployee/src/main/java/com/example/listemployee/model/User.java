package com.example.listemployee.model;

import javax.persistence.Entity;

@Entity
public class User extends BaseModel {
    private String Username;
    private String Password;

    private String Firstname;
    private String Lastname;

    private int Gender;
    private String Email;
    private String Phone;
    private String Address;

    private int Level;
    private String Image;

    private Boolean Active;

    public User() {
        super();
    }

    public User(String firstname, String lastname) {
        super();

        Firstname = firstname;
        Lastname = lastname;
    }

    public User(int id, String firstname, String lastname, String email) {
        super(id);

        Firstname = firstname;
        Lastname = lastname;
        Email = email;
    }

    public User(int id, String username) {
        super(id);

        Username = username;
    }

    public User(int id, String username, String password) {
        super(id);

        Username = username;
        Password = password;
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

    public int getGender() {
        return Gender;
    }

    public void setGender(int gender) {
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

    public int getLevel() {
        return Level;
    }

    public void setLevel(int level) {
        Level = level;
    }

    public Boolean getActive() {
        return Active;
    }

    public void setActive(Boolean active) {
        Active = active;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }

    @Override
    public String toString() {
        return "User{" +

                "Id=" + getId() +

                ", Username='" + Username + '\'' +
                ", Password='" + Password + '\'' +
                ", Firstname='" + Firstname + '\'' +
                ", Lastname='" + Lastname + '\'' +
                ", Gender=" + Gender +
                ", Email='" + Email + '\'' +
                ", Phone='" + Phone + '\'' +
                ", Address='" + Address + '\'' +
                ", Level=" + Level +
                ", Image='" + Image + '\'' +
                ", Active=" + Active +

                ", CreatedAt='" + getCreatedAt() + '\'' +
                ", CreatedBy='" + getCreatedBy() + '\'' +
                ", UpdatedAt='" + getUpdatedAt() + '\'' +
                ", UpdatedBy='" + getUpdatedBy() + '\'' +
                ", Version=" + getVersion() +
                ", Deleted=" + getDeleted() +

                '}';
    }
}
