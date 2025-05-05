package com.example.javaP.models;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Subject {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long subjectId;
    private String subjectName;
    private String subjectDescription;

    @ManyToOne
    @JoinColumn(name = "userId")
    private User professor;
    @ManyToMany(mappedBy = "subjects")
    private List<User> students;
    public Subject() {

    }
public Subject(String subjectName, String subjectDescription, User professor) {
    this.subjectName = subjectName;
    this.subjectDescription = subjectDescription;
    this.professor = professor;
}
public String getSubjectName (){
        return subjectName;
    }
}
