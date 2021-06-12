package com.example.listemployee.repository;

import com.example.listemployee.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Integer> {
    //
}
