package com.example.javaP.dao;

import com.example.javaP.models.Course;
import com.example.javaP.models.Subject;
import com.example.javaP.models.User;
import com.example.javaP.utils.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;

public class courseDao {
    public List<Course> findAllBySubject(Subject subject) {
        EntityManager em= JpaUtil.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
        List<Course> courses = em.createQuery(
                        "SELECT c FROM Course c  WHERE c.subject = :subject", Course.class)
                .setParameter("subject", subject)
                .getResultList();
        em.getTransaction().commit();
        em.close();
        if (courses.isEmpty()){
           return null;
        } else {
            return courses;
        }
    }
    public void SaveCourse(Course course ) {
        EntityManager em= JpaUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        em.persist(course);
        em.getTransaction().commit();
        em.close();
    }
    public void DeleteCourse(long courseId) {
        EntityManager em= JpaUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        List<Course> courses = em.createQuery(
                        "SELECT c FROM Course c  WHERE c.courseId = :courseId", Course.class)
                .setParameter("courseId", courseId)
                .getResultList();
        if (!courses.isEmpty()){
            em.remove(courses.get(0));
        }

        em.getTransaction().commit();
        em.close();

    }
    public Course findCourse(long courseId){
        EntityManager em= JpaUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        Course course = em.find(Course.class, courseId);
        em.getTransaction().commit();
        em.close();
        return course;
    }
}
