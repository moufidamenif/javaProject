package com.example.javaP.models;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(
        uniqueConstraints = @UniqueConstraint(columnNames = {"subjectName", "userId"})
)
public class Subject {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long subjectId;
    private String subjectName;
    private String subjectDescription;
    private String imagePath;
    @ManyToOne
    @JoinColumn(name = "userId")
    private User professor;
    @ManyToMany(mappedBy = "subjects")
    private List<User> students;
    public Subject() {

    }
public Subject(String subjectName, String subjectDescription, User professor,String imagePath) {
    this.subjectName = subjectName;
    this.subjectDescription = subjectDescription;
    this.professor = professor;
    this.imagePath = imagePath;
}
public String getSubjectName (){
        return subjectName;
    }
    public String getImagePath(){
        return imagePath;
    }
}
