package com.example.ServicesRepository_ThiDK.service;

import com.example.ServicesRepository_ThiDK.dao.UserRepository;
import com.example.ServicesRepository_ThiDK.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImplement implements UserService {

    @Autowired //Dùng từ khóa @Autowired ở đây để không phải thêm hàm khởi tạo (Constructor) cho cơ chế DI: Dependency Injection
    private UserRepository userRepository;

    /*@Autowired
    public UserServiceImplement(UserRepository userRepository) {
        this.userRepository = userRepository;
    }*/

    @Override
    public List<User> findAll() {
        return (List<User>) userRepository.findAll();
        //return userRepository.findAllByOrderByFullNameAsc();
    }

    @Override
    public List<User> findAllByOrderByIdDesc() {
        return userRepository.findAllByOrderByIdDesc();
    }

    @Override
    public User findById(int id) {
        //Cách 1: (Tự làm)
        //return userRepository.findById(id).orElse(null);

        //Cách 2: (Tham khảo cô Thi làm)
        Optional<User> userOptional = userRepository.findById(id);

        User user;

        if (userOptional.isPresent()) {
            user = userOptional.get();
        } else {
            throw new RuntimeException("Did not find item id - " + id);
        }

        return user;
    }

    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public void deleteById(int id) {
        userRepository.deleteById(id);
    }
}
