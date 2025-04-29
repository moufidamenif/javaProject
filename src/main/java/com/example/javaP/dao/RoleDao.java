package com.example.javaP.dao;

import com.example.javaP.models.Role;
import com.example.javaP.utils.JpaUtil;
import jakarta.persistence.*;

import java.util.Arrays;
import java.util.List;

public class RoleDao {

    private final EntityManager emf=JpaUtil.getEntityManagerFactory().createEntityManager();;


public RoleDao() {

        }

    public void initializeRoles() {

        this.emf.getTransaction().begin();
        List<String> roleNames = Arrays.asList("USER", "PROFESSOR", "ADMIN");

        for (String roleName : roleNames) {
            boolean exists = !emf.createQuery("SELECT r FROM Role r WHERE r.roleName = :name", Role.class)
                    .setParameter("name", roleName)
                    .getResultList()
                    .isEmpty();

            if (!exists) {
                Role role = new Role();
                role.setRoleName(roleName);
                emf.persist(role);
            }
        }

        emf.getTransaction().commit();
        emf.close();
    }
    public Role findRole(String roleName) {
        this.emf.getTransaction().begin();

    Role role = emf.createQuery("SELECT r FROM Role r WHERE r.roleName = :name", Role.class).setParameter("name", roleName).getSingleResult();
        emf.getTransaction().commit();
        emf.close();
    if (role != null) {
        return role ;
    }
    else {
        emf.getTransaction().commit();
        throw new EntityNotFoundException("Role with name " + roleName + " not found");
    }
    }
}
