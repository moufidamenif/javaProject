package com.example.javaP.dao;

import com.example.javaP.models.Course;
import com.example.javaP.models.Pdf;
import com.example.javaP.utils.JpaUtil;
import jakarta.persistence.EntityManager;

import java.util.List;

public class pdfDao {
    public pdfDao() {}
    public void savePdf(Pdf pdf ) {
        EntityManager em= JpaUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        em.persist(pdf);
        em.getTransaction().commit();
        em.close();
    }
    public List<Pdf> pdfByCourse(Course course ) {
        EntityManager em= JpaUtil.getEntityManagerFactory().createEntityManager();
        em.getTransaction().begin();
        List<Pdf> pdfs = em.createQuery(
                        "SELECT p FROM Pdf p  WHERE p.course =:course", Pdf.class)
                .setParameter("course", course)
                .getResultList();
              em.getTransaction().commit();
              em.close();
              if (!pdfs.isEmpty()){
                  return pdfs ;
              }
              return null;
    }
}
