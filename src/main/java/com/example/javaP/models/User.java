package com.example.javaP.models;
import com.example.javaP.dao.RoleDao;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    @OneToMany(mappedBy = "professor",cascade = CascadeType.ALL,orphanRemoval = true)
    private List<Subject> taughtSubjects= new ArrayList<>();
    @ManyToMany
    @JoinTable(
            name = "use-subject", // join table name
            joinColumns = @JoinColumn(name = "userId"),
            inverseJoinColumns = @JoinColumn(name = "subjectId")
    )
    private List<Subject> subjects = new ArrayList<>();
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
    public genderType getUserGender(){
        return this.userGender;
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
public void setUserPhone(long userPhone) {
        this.userPhone = userPhone;
}
public String getUserPassword() {
        return userPassword;
}

public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
}
public void setUserGender(genderType userGender) {
        this.userGender = userGender;
}
public void setUserDateOfBirth(Date userDateOfBirth) {
        this.userDateOfBirth = userDateOfBirth;
}


    public void setRole(Role role) {
        this.role = role;
    }
}
