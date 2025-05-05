package com.example.javaP.listeners;
import com.example.javaP.dao.RoleDao;

import com.example.javaP.dao.RoleDao;
import com.example.javaP.models.Role;
import com.example.javaP.utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

import java.util.Arrays;
import java.util.List;

public class AppInitializer implements ServletContextListener {
    private static EntityManagerFactory emf;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            emf = Persistence.createEntityManagerFactory("javaPOO");
            System.out.println("✅ EntityManagerFactory initialized");

            // Inject the factory into JpaUtil
            JpaUtil.setEntityManagerFactory(emf);

            // Initialize default roles now that the factory is ready
            this.initializeRoles();
            System.out.println("✅ Default roles inserted successfully!");

        } catch (Exception e) {

            System.err.println("❌ Error initializing application"+e.getMessage());
        }
    }
    public void initializeRoles() {
         EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();
        try{
            em.getTransaction().begin();
            List<String> roleNames = Arrays.asList("USER", "PROFESSOR", "ADMIN");

            for (String roleName : roleNames) {
                boolean exists = !em.createQuery("SELECT r FROM Role r WHERE r.roleName = :name", Role.class)
                        .setParameter("name", roleName)
                        .getResultList()
                        .isEmpty();

                if (!exists) {
                    Role role = new Role();
                    role.setRoleName(roleName);
                    em.persist(role);
                }
            }

            em.getTransaction().commit();
            em.close();}
        catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();  // Rollback in case of an error
            }

            System.err.println("Error initializing roles."+e.getMessage());
        } finally {
            if (em != null && em.isOpen()) {
                em.close(); // Always close the EntityManager
            }
        }    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (emf != null && emf.isOpen()) {
            emf.close();
            System.out.println("🔁 EntityManagerFactory closed");
        }
    }
}
