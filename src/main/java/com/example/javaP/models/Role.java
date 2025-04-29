package com.example.javaP.models;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;
@Entity
public class Role {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
  private long roleId;
  private String roleName;
    @OneToMany(mappedBy = "role", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<User> users ;
    @ManyToOne
    @JoinColumn(name = "accessId")
    private Access access;
  public long getRoleId() {
      return roleId;
  }
  public String getRoleName() {
        return roleName;
    }
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
    public void setRoleId(long roleId) {
        this.roleId = roleId;
    }
    public Role() {

    }


    public Role(long roleId, String roleName) {
      this.roleId = roleId;
        this.roleName = roleName;
    }
}
