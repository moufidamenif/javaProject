package com.example.javaP.controllers;
import com.example.javaP.models.Role;
import com.example.javaP.models.User;
import com.example.javaP.utils.JpaUtil;
import com.example.javaP.utils.secretKey;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.GeneralSecurityException;

import com.example.javaP.dao.userDao;
import com.example.javaP.dao.RoleDao;
import javax.crypto.spec.SecretKeySpec;


public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private userDao userDao;
    public void init() {
        userDao = new userDao();


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  {
        try {
            processRequest(request, response);
        } catch (GeneralSecurityException e) {
            throw new ServletException("Security exception occurred", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/register.jsp").forward(request, response);
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET not supported");
    }


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws  IOException ,GeneralSecurityException{
        System.out.println("processRequest");
        userDao userDao = new userDao();

        String userEmail = request.getParameter("userEmail");
        if( userDao.findByEmail(userEmail)!=null)
        {
            response.sendRedirect("userExists.jsp");
        }
        else {
            String password = request.getParameter("userPassword");
            String userName = request.getParameter("userName");
            if (password == null || userName == null || userEmail == null) {
                throw new IllegalArgumentException(
                        "Parameter is not present in configuration file");
            }

            byte[] salt = new String("622836429").getBytes();
            int iterationCount = 10000;
            int keyLength = 128;

            secretKey object = new secretKey();
            SecretKeySpec key = object.generateSecretKey(
                    password.toCharArray(), salt, iterationCount,
                    keyLength);

            String encryptedPassword
                    = object.encrypt(password, key);

        /*long phone = 0;
        if(contact != null && !contact.trim().isEmpty()) {
            try {
                phone = Long.parseLong(contact);
            } catch (NumberFormatException e) {
                throw new RuntimeException("Invalid phone number format: " + contact);
            }
        }


        String userDateOfBirth = request.getParameter("dateOfBirth");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Adjust the format if needed
        Date dateOfBirth = null;
        try {
            dateOfBirth = sdf.parse(userDateOfBirth);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Role userRole = null;

        if (role != null) {
            if (role.equals("professor")) {
                userRole = em.createQuery("SELECT r FROM Role r WHERE r.roleName = :roleName", Role.class)
                        .setParameter("roleName", "PROFESSOR")
                        .getSingleResult();
            } else if (role.equals("admin")) {
                userRole = em.createQuery("SELECT r FROM Role r WHERE r.roleName = :roleName", Role.class)
                        .setParameter("roleName", "ADMIN")
                        .getSingleResult();
            } else {
                userRole = em.createQuery("SELECT r FROM Role r WHERE r.roleName = :roleName", Role.class)
                        .setParameter("roleName", "USER")
                        .getSingleResult();
            }
        }*/
            try {

                User user = new User(userEmail, encryptedPassword, userName);


                userDao.save(user);
                response.sendRedirect("userDetails.jsp");
            } catch (Exception e) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while registering.");
                e.printStackTrace();
            }
        }

    }
}