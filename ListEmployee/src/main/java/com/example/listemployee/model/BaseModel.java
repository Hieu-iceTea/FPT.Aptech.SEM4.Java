package com.example.listemployee.model;

import javax.persistence.*;
import java.util.Date;

@MappedSuperclass
public class BaseModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int Id;

    private Date CreatedAt;
    private String CreatedBy;
    private Date UpdatedAt;
    private String UpdatedBy;

    @Version
    private int Version;
    private Boolean Deleted;

    private void initializeSystemValue() {
        CreatedAt = new Date();
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

    public Date getCreatedAt() {
        return CreatedAt;
    }

    public void setCreatedAt(Date createdAt) {
        CreatedAt = createdAt;
    }

    public String getCreatedBy() {
        return CreatedBy;
    }

    public void setCreatedBy(String createdBy) {
        CreatedBy = createdBy;
    }

    public Date getUpdatedAt() {
        return UpdatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
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
