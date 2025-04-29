package com.example.javaP.models;
import com.example.javaP.models.permissionType;
import jakarta.persistence.*;
import java.util.HashSet;
import java.util.Set;
@Entity
public class Permission {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long permissionId;
    private permissionType permissionType;
    @ManyToMany(mappedBy = "permissions")
    private Set<Access> accessSet ;
    public Permission() {
    }
    public Permission(long permissionId, permissionType permissionType) {
        this.permissionId = permissionId;
        this.permissionType = permissionType;
    }
    public long getPermissionId() {
        return permissionId;
    }
    public void setPermissionId(long permissionId) {
        this.permissionId = permissionId;
    }
    public permissionType getPermissionType() {
        return permissionType;
    }
    public void setPermissionType(permissionType permissionType) {
        this.permissionType = permissionType;
    }

}
