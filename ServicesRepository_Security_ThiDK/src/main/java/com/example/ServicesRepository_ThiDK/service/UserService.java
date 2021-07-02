package com.example.ServicesRepository_ThiDK.service;

import com.example.ServicesRepository_ThiDK.entity.User;

import java.util.List;

public interface UserService {
    public List<User> findAll();

    public User findById(int id);

    public void save(User user);

    public void deleteById(int id);

    //
    public List<User> findAllByOrderByIdDesc();
}
