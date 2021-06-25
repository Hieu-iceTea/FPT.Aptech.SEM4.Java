package com.example.ServicesRepository_ThiDK.controller;

import com.example.ServicesRepository_ThiDK.dao.UserRepository;
import com.example.ServicesRepository_ThiDK.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(path = "/user")
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping(path = {"", "/", "/index"})
    public String index(Model model) {
        List<User> users = (List<User>) userRepository.findAll();

        model.addAttribute("users", users);

        return "user/index";
    }

    @GetMapping(path = "/create")
    public String create(Model model) {

        model.addAttribute("user", new User());

        return "user/create";
    }

    @PostMapping(path = "/create")
    public String store(@ModelAttribute User user) {

        userRepository.save(user);

        return "redirect:/user/index";
    }

    @GetMapping(path = "/edit/{id}")
    public String edit(Model model, @PathVariable int id) {
        User user = userRepository.findById(id).orElse(null);

        model.addAttribute("user", user);

        return "user/edit";
    }

    @PostMapping(path = "/edit")
    public String update(@ModelAttribute User user) {

        userRepository.save(user);

        return "redirect:/user/index";
    }

    @GetMapping(path = "/delete/{id}")
    public String delete(@PathVariable int id) {

        userRepository.deleteById(id);

        return "redirect:/user/index";
    }
}