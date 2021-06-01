package com.example.WCD_WebComponentDevelopment.MVC_Demo.Service;

import MyUtilities.DatabaseUtility;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Product;
import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.User;

import java.util.List;

public class UserService {

    public static List<User> all() {
        List<User> users = (List<User>) DatabaseUtility.executeQuery("SELECT * FROM product ORDER BY id DESC", Product.class.getName());

        return users;
    }

    public static User find(int id) {
        User user = (User) DatabaseUtility.executeQuery("SELECT * FROM product WHERE id = " + id, Product.class.getName());

        return user;
    }

    public static void create(User users) {
        //
    }

    public static void update(int id, User users) {
        //
    }

    public static void delete(int id) {
        //
    }
}

