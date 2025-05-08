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
}
