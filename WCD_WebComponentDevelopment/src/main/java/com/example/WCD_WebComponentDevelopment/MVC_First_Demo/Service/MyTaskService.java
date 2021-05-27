package com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Service;

import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.MyTask;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.Status;
import com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.User;
import jakarta.servlet.http.HttpServletRequest;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class MyTaskService {
    private static final String SessionName = "myTasks";

    private static List<MyTask> initialization() {
        List<MyTask> myTasks = new ArrayList<>();

        myTasks.add(new MyTask(1, "Ăn", "Ăn thật ngon", new User(1, "Hieu_iceTea"), Status.Todo));
        myTasks.add(new MyTask(2, "Ngủ", "Ngủ thật kỹ", new User(2, "DinhHieu8896"), Status.Done));
        myTasks.add(new MyTask(3, "Code", "Code thật siêu", new User(3, "HieuND"), Status.Doing));

        return myTasks;
    }

    public static List<MyTask> all(HttpServletRequest request) {
        List<MyTask> myTasksFromSession = (List<MyTask>) request.getSession().getAttribute(SessionName);

        if (myTasksFromSession == null) {
            myTasksFromSession = initialization();
            request.getSession().setAttribute("myTasks", myTasksFromSession);
        }

        //Xóa cứng
        //return myTasksFromSession;

        //Xóa mềm:
        return myTasksFromSession.stream().filter(item -> !item.getDeleted()).collect(Collectors.toList());
    }

    public static MyTask find(HttpServletRequest request, int id) {
        List<MyTask> myTasksFromSession = all(request);

        MyTask myTask = myTasksFromSession.stream()
                .filter(item -> item.getId() == id)
                .filter(item -> !item.getDeleted())
                .findAny()
                .orElse(null);

        return myTask;
    }

    public static void create(HttpServletRequest request, MyTask myTask) {
        List<MyTask> myTasksFromSession = (List<MyTask>) request.getSession().getAttribute(SessionName);

        if (myTask.getId() == 0) {
            if (myTasksFromSession.size() == 0) {
                myTask.setId(1);
            } else {
                MyTask lastItem = myTasksFromSession.get(myTasksFromSession.size() - 1);

                myTask.setId(lastItem.getId() + 1);
            }
        }

        myTasksFromSession.add(myTask);
    }

    public static void update(HttpServletRequest request, int id, MyTask myTask) {
        List<MyTask> myTasksFromSession = all(request);

        MyTask MyTask_Old = find(request, id);
        int index = myTasksFromSession.indexOf(MyTask_Old);

        myTask.setVersion(MyTask_Old.getVersion() + 1);
        myTask.setUpdatedAt(LocalDateTime.now());
        myTask.setUpdatedBy("Anonymous");

        myTasksFromSession.set(index, myTask);
    }

    public static void delete(HttpServletRequest request, int id) {
        MyTask myTask = find(request, id);

        //Xóa cứng:
        List<MyTask> myTasksFromSession = all(request);
        //myTasksFromSession.remove(searchMyTask);

        //Xóa mềm:
        myTask.setDeleted(true);
        //updateMyTask(request, id, searchMyTask);
    }
}
