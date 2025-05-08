package com.example.javaP.dao;

import com.example.javaP.models.Subject;
import com.example.javaP.models.User;
import com.example.javaP.utils.JpaUtil;
import jakarta.persistence.EntityManager;

import java.lang.reflect.Array;
import java.util.List;

public class SubjectDao {
    public void save(Subject subject) {
        EntityManager em= JpaUtil.getEntityManagerFactory().createEntityManager();

        em.getTransaction().begin();
        em.persist(subject);
        em.getTransaction().commit();
        em.close();
    }
    public List<Subject> findALLbyUser(User user) {
        EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();

        em.getTransaction().begin();

        List<Subject> subjects = em.createQuery(
                        "SELECT s FROM Subject s WHERE s.professor = :user", Subject.class)
                .setParameter("user", user)
                .getResultList();
        em.getTransaction().commit();
        em.close();
        return subjects;
    }
    public void removeSubject(String subjectName, User user) {
        EntityManager em=JpaUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        List<Subject> subjects = em.createQuery(
                        "SELECT s FROM Subject s WHERE s.professor = :user AND s.subjectName= :subjectName", Subject.class)
                .setParameter("subjectName",subjectName)
                .setParameter("user", user)
                .getResultList();

        if (!subjects.isEmpty()){
            em.remove(subjects.get(0));
        }
        em.getTransaction().commit();
        em.close();
    }
    public Subject findBySubjectName(String subjectName, User user) {
        try {


            EntityManager em = JpaUtil.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            List<Subject> subjects = em.createQuery(
                            "SELECT s FROM Subject s WHERE s.professor = :user AND s.subjectName= :subjectName", Subject.class)
                    .setParameter("subjectName", subjectName)
                    .setParameter("user", user)
                    .getResultList();
            em.getTransaction().commit();
            em.close();
            return subjects.get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
