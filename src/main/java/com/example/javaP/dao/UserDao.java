package com.example.javaP.dao;
import com.example.javaP.models.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import java.util.List;
import com.example.javaP.utils.JpaUtil;

public class UserDao {

    public User findById(int id) {
          EntityManager emf=JpaUtil.getEntityManagerFactory().createEntityManager();

        emf.getTransaction().begin();
        User user = emf.find(User.class, id);
        emf.getTransaction().commit();
        emf.close();
        return user;
    }
    public User findByEmail(String email) {
        EntityManager emf=JpaUtil.getEntityManagerFactory().createEntityManager();

        emf.getTransaction().begin();
        User user = null;
        try{
            user = emf.createQuery("SELECT u FROM User u WHERE u.userEmail = :email", User.class)
                .setParameter("email", email)
                .getSingleResult();
        }
        catch(NoResultException e){
            user= null;

        }
        finally {
            emf.getTransaction().commit();
            emf.close();
        }
        return user;}



    public void save(User user) {
        EntityManager emf=JpaUtil.getEntityManagerFactory().createEntityManager();

        emf.getTransaction().begin();
        emf.persist(user);
        emf.getTransaction().commit();
        emf.close();
    }

    public void update(User user) {
        EntityManager emf=JpaUtil.getEntityManagerFactory().createEntityManager();

        emf.getTransaction().begin();
        emf.merge(user);
        emf.getTransaction().commit();
        emf.close();
    }

    public void delete(User user) {
        EntityManager emf=JpaUtil.getEntityManagerFactory().createEntityManager();


        emf.getTransaction().begin();
        emf.remove(emf.contains(user) ? user : emf.merge(user));
        emf.getTransaction().commit();
        emf.close();
    }

    public List<User> findAll() {
        EntityManager emf=JpaUtil.getEntityManagerFactory().createEntityManager();


        List<User> users = emf.createQuery("FROM User", User.class).getResultList();
        emf.getTransaction().commit();
        emf.close();
        return users;
    }
    public User updateUser(User user) {
        EntityManager emf=JpaUtil.getEntityManagerFactory().createEntityManager();
        emf.getTransaction().begin();
        User updatedUser =emf.merge(user);
        emf.getTransaction().commit();
        emf.close();
        return updatedUser;
    }
}

