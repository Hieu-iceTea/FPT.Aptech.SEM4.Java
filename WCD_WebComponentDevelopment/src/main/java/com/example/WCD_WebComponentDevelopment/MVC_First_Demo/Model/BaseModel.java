package com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model;

import java.time.LocalDateTime;

public class BaseModel {
    private int Id;

    private LocalDateTime CreatedAt;
    private String CreatedBy;
    private LocalDateTime UpdatedAt;
    private String UpdatedBy;

    private int Version;
    private Boolean Deleted;

    private void initializeSystemValue() {
        CreatedAt = LocalDateTime.now();
        CreatedBy = "Hieu_iceTea";
        Version = 1;
        Deleted = false;
    }

    public BaseModel() {
        initializeSystemValue();
    }

    public BaseModel(int id) {
        initializeSystemValue();

        Id = id;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public LocalDateTime getCreatedAt() {
        return CreatedAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        CreatedAt = createdAt;
    }

    public String getCreatedBy() {
        return CreatedBy;
    }

    public void setCreatedBy(String createdBy) {
        CreatedBy = createdBy;
    }

    public LocalDateTime getUpdatedAt() {
        return UpdatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        UpdatedAt = updatedAt;
    }

    public String getUpdatedBy() {
        return UpdatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        UpdatedBy = updatedBy;
    }

    public int getVersion() {
        return Version;
    }

    public void setVersion(int version) {
        Version = version;
    }

    public Boolean getDeleted() {
        return Deleted;
    }

    public void setDeleted(Boolean deleted) {
        Deleted = deleted;
    }
}
