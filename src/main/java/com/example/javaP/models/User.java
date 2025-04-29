package com.example.javaP.models;
import com.example.javaP.dao.RoleDao;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.util.Date;
import jakarta.persistence.Column;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
@Entity
public class User {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long  userId;

    @Column(name="userEmail", length=50, nullable=false, unique=true)
    private String userEmail ;

    @Column(name="userName", length=50, nullable=false, unique=true)
    private String userName ;
    private String userPassword;
    private long userPhone;

    private Date userDateOfBirth;

    private String userAddress;
    @Enumerated(EnumType.STRING)
    private genderType userGender;
    @Column(name="emailValidated")
    private boolean emailValidated =false ;
    @Column(name="resetPasswordvalidated" )
    private boolean resetPasswordvalidated =false  ;

    private String token ;
    private Date createdDate ;
    @ManyToOne
    @JoinColumn(name = "roleId")
    private Role role;


    public User() {
        emailValidated = false;
        resetPasswordvalidated = false;
    }
    public User(String userEmail, String userPassword, String userName) {
        emailValidated = false;
        resetPasswordvalidated = false;
        RoleDao roleDao =new RoleDao();
        this.role = roleDao.findRole("USER");;
        this.userName = userName;
        this.createdDate = new Date();
        this.userEmail = userEmail;
        this.userPassword =userPassword;
    }
public Long getUserId() {
        return userId;
}
public void setUserId(Long userId) {
        this.userId = userId;
}
public String getUserEmail() {
        return userEmail;
}
public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
}

public boolean isEmailValidated() {
        return emailValidated;
}
public void setEmailValidated(boolean emailValidated) {
        this.emailValidated = emailValidated;
}
public boolean getResetPasswordvalidated() {
        return resetPasswordvalidated;
}
public void setResetPasswordvalidated(boolean resetPasswordvalidated) {
        this.resetPasswordvalidated = resetPasswordvalidated;
}

public String getToken() {
        return token;
}
public void setToken(String token) {
        this.token = token;
}


}
