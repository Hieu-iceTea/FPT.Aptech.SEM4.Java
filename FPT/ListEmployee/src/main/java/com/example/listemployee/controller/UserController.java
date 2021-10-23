package com.example.listemployee.controller;

import java.util.ArrayList;
import java.util.List;

import com.example.listemployee.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private UserRepository userRepository;

    /*private List<User> _users;

    @PostConstruct
    private void loadData() {
        _users = new ArrayList<>();

        _users.add(new User(1, "Nguyen Dinh", "Hieu", "DinhHieu8896@gmail.com"));
        _users.add(new User(2, "Nguyen Van", "Tu", "NguyenVanTu@gmail.com"));
        _users.add(new User(3, "Vo Thi", "Na", "VoThiNa@gmail.com"));
    }*/

    @GetMapping("/list")
    public String index(Model model) {
        List<User> users = (List<User>) userRepository.findAll();

        model.addAttribute("users", users);

        return "list-employee";
    }

    @GetMapping("/detail/{id}")
    public String detail(Model model, @PathVariable int id) {
        /*List<User> user = new ArrayList<>();
        user.add(new User(1, "Nguyen Dinh", "Hieu", "DinhHieu8896@gmail.com"));
        model.addAttribute("users", user);*/

        List<User> users = new ArrayList<>();
        users.add(userRepository.findById(id).orElse(null));
        model.addAttribute("users", users);

        return "list-employee";
    }
}
