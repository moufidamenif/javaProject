package com.example.javaP.models;

import jakarta.persistence.*;

import java.util.List;

@Entity
public class Course {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long courseId;
    private String courseName;
    private String courseDescription;
    private String VideoLink;

    @ManyToOne
    @JoinColumn(name = "subjectId")
    private Subject subject;
    @OneToMany(mappedBy = "course", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Pdf> pdfs ;
        public Course(String courseName, String courseDescription,String videoLink,Subject subject) {
            this.courseName = courseName;
            this.courseDescription = courseDescription;
            this.VideoLink = videoLink;
            this.subject = subject;

        }
        public Course() {}
    public String getCourseName() {
        return courseName;
    }
    public long getCourseId() {
            return courseId;
    }
    public String getCourseDescription() {
        return courseDescription;
    }
    public String getVideoLink() {
        return VideoLink;
    }
}
