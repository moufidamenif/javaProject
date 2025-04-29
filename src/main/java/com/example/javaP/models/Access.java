package com.example.javaP.models;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
import java.util.HashSet;
import java.util.Set;
@Entity
public class Access {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long accessId;
    private String accessName;
    @OneToMany(mappedBy = "access", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Role> roles = new ArrayList<>();
    @ManyToMany
    @JoinTable(
            name = "access_permission",
            joinColumns = @JoinColumn(name = "accessId"),
            inverseJoinColumns = @JoinColumn(name = "permissionId")
    )
    private Set<Permission> permissions ;
    public Long getAccessId() {
        return accessId;
    }
    public void setAccessId(Long accessId) {
        this.accessId = accessId;
    }
    public String getAccessName() {
        return accessName;
    }
    public void setAccessName(String accessName) {
        this.accessName = accessName;
    }
    public Access() {
    }
    public Access(Long accessId, String accessName) {
        this.accessId = accessId;
        this.accessName = accessName;
    }
}
