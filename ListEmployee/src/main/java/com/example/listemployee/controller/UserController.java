package com.example.listemployee.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.listemployee.model.User;

@Controller
@SpringBootApplication
@RequestMapping("user")
public class UserController {
    private List<User> users;

    @PostConstruct
    private void loadData() {
        users = new ArrayList<>();

        users.add(new User(1, "Nguyen Dinh", "Hieu", "DinhHieu8896@gmail.com"));
        users.add(new User(2, "Nguyen Van", "Tu", "NguyenVanTu@gmail.com"));
        users.add(new User(3, "Vo Thi", "Na", "VoThiNa@gmail.com"));
    }

    @GetMapping("/list")
    public String index(Model model) {
        model.addAttribute("users", users);

        return "list-employee";
    }

}
