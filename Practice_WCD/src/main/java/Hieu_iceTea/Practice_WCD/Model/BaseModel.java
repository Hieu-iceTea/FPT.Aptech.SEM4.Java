package Hieu_iceTea.Practice_WCD.Model;

import java.util.Date;

public class BaseModel {
    private int Id;

    private Date CreatedAt;
    private String CreatedBy;
    private Date UpdatedAt;
    private String UpdatedBy;

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

    public BaseModel(int id, Date createdAt, String createdBy, Date updatedAt, String updatedBy, int version, Boolean deleted) {
        initializeSystemValue();

        Id = id;

        CreatedAt = createdAt;
        CreatedBy = createdBy;
        UpdatedAt = updatedAt;
        UpdatedBy = updatedBy;
        Version = version;
        Deleted = deleted;
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
