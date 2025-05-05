package com.example.javaP.utils;

import jakarta.persistence.EntityManagerFactory;

public class JpaUtil {
    private static EntityManagerFactory emf;

    public static EntityManagerFactory getEntityManagerFactory() {
        return emf;
    }

    public static void setEntityManagerFactory(EntityManagerFactory factory) {
        emf = factory;
    }
}
