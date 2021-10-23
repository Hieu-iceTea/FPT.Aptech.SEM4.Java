package com.example.ServicesRepository_ThiDK.controller;


import com.example.ServicesRepository_ThiDK.entity.User;
import com.example.ServicesRepository_ThiDK.service.UserService;
import org.hibernate.mapping.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(path = "/user")
public class UserController {
    /*@Autowired
    private UserRepository userRepository;*/

    @Autowired //Dùng từ khóa @Autowired ở đây để không phải thêm hàm khởi tạo (Constructor) cho cơ chế DI: Dependency Injection
    private UserService userService;

    /*public UserController(UserService userService) {
        this.userService = userService;
    }*/

    @GetMapping(path = {"", "/", "/index"})
    public String index(Model model) {
        // get users from database
        //List<User> users = (List<User>) userRepository.findAll();
        //List<User> users = userService.findAll();
        List<User> users = userService.findAllByOrderByIdDesc();

        // add to the spring model
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

        //userRepository.save(user);
        userService.save(user);

        return "redirect:/user/index";
    }

    @GetMapping(path = "/edit/{id}")
    public String edit(Model model, @PathVariable int id) {
        //User user = userRepository.findById(id).orElse(null);
        User user = userService.findById(id);

        model.addAttribute("user", user);

        return "user/edit";
    }

    @PostMapping(path = "/edit")
    public String update(@ModelAttribute User user) {

        User myUser = userService.findById(1);



        //userRepository.save(user);
        userService.save(user);

        return "redirect:/user/index";
    }

    @GetMapping(path = "/delete/{id}")
    public String delete(@PathVariable int id) {

        //userRepository.deleteById(id);
        userService.deleteById(id);

        return "redirect:/user/index";
    }
}