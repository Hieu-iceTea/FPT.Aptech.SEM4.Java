package com.example.WCD_WebComponentDevelopment.MVC_Demo.Service;

import com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.User;
import jakarta.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class UserServiceSession {
    private static final String SessionName = "users";

    private static List<User> initialization() {
        List<User> users = new ArrayList<>();

        users.add(new User(1, "Hieu_iceTea", "123456"));
        users.add(new User(2, "DinhHieu8896", "123456"));
        users.add(new User(3, "HieuND", "123456"));
        users.add(new User(4, "Admin", "123456"));
        users.add(new User(5, "Customer", "123456"));

        return users;
    }

    public static List<User> all(HttpServletRequest request) {
        List<User> usersFromSession = (List<User>) request.getSession().getAttribute(SessionName);

        if (usersFromSession == null) {
            usersFromSession = initialization();
            request.getSession().setAttribute("users", usersFromSession);
        }

        //Xóa cứng
        //return usersFromSession;

        //Xóa mềm:
        return usersFromSession.stream().filter(item -> !item.getDeleted()).collect(Collectors.toList());
    }

    public static User find(HttpServletRequest request, int id) {
        List<User> usersFromSession = all(request);

        User user = usersFromSession.stream()
                .filter(item -> item.getId() == id)
                .filter(item -> !item.getDeleted())
                .findAny()
                .orElse(null);

        return user;
    }

    public static void create(HttpServletRequest request, User users) {
        List<User> usersFromSession = (List<User>) request.getSession().getAttribute(SessionName);

        if (users.getId() == 0) {
            if (usersFromSession.size() == 0) {
                users.setId(1);
            } else {
                User lastItem = usersFromSession.get(usersFromSession.size() - 1);

                users.setId(lastItem.getId() + 1);
            }
        }

        usersFromSession.add(users);
    }

    public static void update(HttpServletRequest request, int id, User users) {
        List<User> usersFromSession = all(request);

        User MyTask_Old = find(request, id);
        int index = usersFromSession.indexOf(MyTask_Old);

        users.setVersion(MyTask_Old.getVersion() + 1);
        users.setUpdatedAt(new Date());
        users.setUpdatedBy("Anonymous");

        usersFromSession.set(index, users);
    }

    public static void delete(HttpServletRequest request, int id) {
        User users = find(request, id);

        //Xóa cứng:
        List<User> usersFromSession = all(request);
        //usersFromSession.remove(searchMyTask);

        //Xóa mềm:
        users.setDeleted(true);
        //updateMyTask(request, id, searchMyTask);
    }

    public static User check(HttpServletRequest request, String username, String password) {
        List<User> usersFromSession = all(request);

        return usersFromSession.stream()
                .filter(item -> item.getUsername().equalsIgnoreCase(username))
                .filter(item -> item.getPassword().equals(password))
                .filter(item -> !item.getDeleted())
                .findAny()
                .orElse(null);
    }
}

