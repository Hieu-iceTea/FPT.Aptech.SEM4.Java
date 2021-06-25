package com.example.ServicesRepository_ThiDK.dao;


import com.example.ServicesRepository_ThiDK.entity.User;
import org.springframework.data.repository.CrudRepository;


public interface UserRepository extends CrudRepository<User, Integer> {

}