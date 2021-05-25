package com.example.WCD_WebComponentDevelopment.Date_05_25;

public class Customer {
    private String Firstname;
    private String Lastname;
    private Boolean IsGoldCustomer;

    public Customer(String firstname, String lastname, Boolean isGoldCustomer) {
        Firstname = firstname;
        Lastname = lastname;
        IsGoldCustomer = isGoldCustomer;
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

    public Boolean getGoldCustomer() {
        return IsGoldCustomer;
    }

    public void setGoldCustomer(Boolean goldCustomer) {
        IsGoldCustomer = goldCustomer;
    }
}
