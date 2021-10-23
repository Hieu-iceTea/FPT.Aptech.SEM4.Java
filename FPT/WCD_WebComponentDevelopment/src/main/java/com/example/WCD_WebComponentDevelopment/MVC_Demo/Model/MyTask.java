package com.example.WCD_WebComponentDevelopment.MVC_Demo.Model;

import java.time.LocalDateTime;

public class MyTask extends BaseModel {
    private String Title;
    private String Content;
    private User Assign;
    private LocalDateTime StartDate;
    private LocalDateTime EndDate;
    private Status Status;
    private String Note;

    public MyTask() {
        super();
    }

    public MyTask(String title, String content) {
        super();

        Title = title;
        Content = content;
    }

    public MyTask(int id, String title, String content) {
        super(id);

        Title = title;
        Content = content;
    }

    public MyTask(int id, String title, String content, User assign, com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Status status) {
        super(id);
        Title = title;
        Content = content;
        Assign = assign;
        Status = status;
    }

    public MyTask(String title, String content, User assign, LocalDateTime startDate, LocalDateTime endDate, com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Status status, String note) {
        super();

        Title = title;
        Content = content;
        Assign = assign;
        StartDate = startDate;
        EndDate = endDate;
        Status = status;
        Note = note;
    }


    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public User getAssign() {
        return Assign;
    }

    public void setAssign(User assign) {
        Assign = assign;
    }

    public LocalDateTime getStartDate() {
        return StartDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        StartDate = startDate;
    }

    public LocalDateTime getEndDate() {
        return EndDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        EndDate = endDate;
    }

    public Status getStatus() {
        return Status;
    }

    public void setStatus(Status status) {
        Status = status;
    }

    public String getNote() {
        return Note;
    }

    public void setNote(String note) {
        Note = note;
    }
}
