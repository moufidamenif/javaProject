package com.example.javaP.dao;

import com.example.javaP.models.Role;
import com.example.javaP.utils.JpaUtil;
import jakarta.persistence.*;

import java.util.Arrays;
import java.util.List;

public class RoleDao {




public RoleDao() {

        }

    public Role findRole(String roleName) {
          EntityManager  em;
        em = JpaUtil.getEntityManagerFactory().createEntityManager();

        try {
            // Start transaction
            em.getTransaction().begin();

            // Get the role from the database
            Role role = em.createQuery("SELECT r FROM Role r WHERE r.roleName = :name", Role.class)
                    .setParameter("name", roleName)
                    .getSingleResult();

            // Commit transaction
            em.getTransaction().commit();
            return role;

        } catch (NoResultException e) {
            throw new EntityNotFoundException("Role with name " + roleName + " not found");
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();  // Rollback in case of an error
            }
            e.printStackTrace();
            System.err.println("Error finding role.");
            return null; // Return null or handle it based on your needs.
        } finally {
            if (em != null && em.isOpen()) {
                em.close(); // Always close the EntityManager
            }
        }
    }
}