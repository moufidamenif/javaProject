package com.example.javaP.models;

import jakarta.persistence.*;

@Entity
public class Pdf {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private long pdfId;
    private String pdfLink;
    @ManyToOne
    @JoinColumn(name = "courseId")
    private Course course;

    public String getPdfLink() {
        return pdfLink;
    }

    public void setPdfLink(String pdfLink) {
        this.pdfLink = pdfLink;
    }

    public long getPdfId() {
        return pdfId;
    }

    public void setPdfId(long pdfId) {
        this.pdfId = pdfId;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}
