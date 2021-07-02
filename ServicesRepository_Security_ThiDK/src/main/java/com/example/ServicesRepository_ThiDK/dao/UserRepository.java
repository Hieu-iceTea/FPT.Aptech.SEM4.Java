package com.example.ServicesRepository_ThiDK.dao;


import com.example.ServicesRepository_ThiDK.entity.User;

//import org.springframework.data.jpa.repository.JpaRepository; //Cách cô Thi
import org.springframework.data.repository.CrudRepository; //Cách trang chủ spring hướng dẫn

import java.util.List;


//public interface UserRepository extends JpaRepository<User, Integer> { //Cách cô Thi
public interface UserRepository extends CrudRepository<User, Integer> { //Cách trang chủ spring hướng dẫn

    // that's it ... no need to write any code LOL!

    // add a method to sort by full name
    public List<User> findAllByOrderByFullNameAsc();

    public List<User> findAll();
    public List<User> findAllByOrderByIdDesc();

    // search by name
    public List<User> findByFullNameContainsIgnoreCase(String fullName);
}