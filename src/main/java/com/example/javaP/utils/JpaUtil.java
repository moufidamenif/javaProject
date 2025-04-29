package com.example.javaP.utils;


import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtil {
    private static  EntityManagerFactory emf ;
    static {
        // Automatically initialize EntityManagerFactory on class load
        initEntityManagerFactory();
    }
    public static void initEntityManagerFactory() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory("javaPPU");
            System.out.println("EntityManagerFactory initialized.");
        }
    }
    public static EntityManagerFactory getEntityManagerFactory() {
        return emf;
    }

    public static void closeEntityManagerFactory() {
        if (emf != null && emf.isOpen()) {
            emf.close();
            System.out.println("EntityManagerFactory closed.");
        }
    }











}
