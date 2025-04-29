package com.example.javaP.controllers;

import com.example.javaP.dao.RoleDao;
import com.example.javaP.utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

@WebListener
public class RoleServlet implements ServletContextListener {


    @Override
    public void contextInitialized(ServletContextEvent sce) {
        EntityManager emf= JpaUtil.getEntityManagerFactory().createEntityManager();
        RoleDao roleDao = new RoleDao();
        roleDao.initializeRoles();
        System.out.println("✅ Default roles inserted successfully!");
    }

    /*@Override
   public void contextDestroyed(ServletContextEvent sce) {
        EntityManager emf=JpaUtil.getEntityManagerFactory().createEntityManager();

        try {
            if (emf != null && emf.isOpen()) {
                emf.close();
                System.out.println("✅ EntityManagerFactory closed.");
            }

            // Cleanup MySQL Abandoned Connection Thread
            AbandonedConnectionCleanupThread.checkedShutdown();
            System.out.println("✅ MySQL Abandoned Connection Cleanup completed.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/
}
