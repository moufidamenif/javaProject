package com.example.javaP.controllers;
import com.example.javaP.dao.RoleDao;
import com.example.javaP.dao.SubjectDao;
import com.example.javaP.models.*;

import com.example.javaP.utils.secretKey;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.example.javaP.dao.UserDao;


public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String servletPath = request.getServletPath(); // returns "/login" or "/register"
            if ("/register".equals(servletPath)) {
                handleRegister(request, response);
            } else if ("/login".equals(servletPath)) {
                handleLogin(request, response);
            } else if ("/logout".equals(servletPath)) {

                handleLogOut(request, response);
            }
            else if ("/updateProfile".equals(servletPath)) {
                handleUpdateProfile(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown path");
            }
        } catch (GeneralSecurityException e) {
            throw new ServletException("Security exception occurred", e);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String servletPath = request.getServletPath();

        switch (servletPath) {
            case "/register":
                request.getRequestDispatcher("register.jsp").forward(request, response);
                break;

            case "/login":
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Page not found");
        }
    }


    protected void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws IOException, GeneralSecurityException {
        UserDao userDao = new UserDao();

        String userEmail = request.getParameter("userEmail");
        if (userDao.findByEmail(userEmail) != null) {
            response.sendRedirect("userExists.jsp");
        } else {
            String password = request.getParameter("userPassword");
            String userName = request.getParameter("userName");
            if (password == null || userName == null || userEmail == null) {
                throw new IllegalArgumentException(
                        "Parameter is not present in configuration file");
            }

            byte[] salt = "622836429".getBytes();
            int iterationCount = 10000;
            int keyLength = 128;

            secretKey object = new secretKey();


            String hashedPassword = object.hashPassword(password, salt, iterationCount, keyLength);


            try {

                User user = new User(userEmail, hashedPassword, userName);


                userDao.save(user);
                response.sendRedirect(request.getContextPath()+"/userDetails.jsp");
            } catch (Exception e) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while registering.");

            }
        }

    }

    protected void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws IOException, GeneralSecurityException, ServletException {
        UserDao userDao = new UserDao();

        String userEmail = request.getParameter("userEmail");
        String password = request.getParameter("userPassword");
        if (password == null || userEmail == null) {
            throw new IllegalArgumentException(
                    "Parameter is not present in configuration file");
        }
        User user = userDao.findByEmail(userEmail);
        byte[] salt = "622836429".getBytes();
        int iterationCount = 10000;
        int keyLength = 128;

        secretKey object = new secretKey();

        String hashedPassword = object.hashPassword(password, salt, iterationCount, keyLength);
        if (user != null && user.getUserPassword().equals(hashedPassword)) {
            Cookie loginCookie = new Cookie("userName", userEmail);
            loginCookie.setMaxAge(30 * 60);
            response.addCookie(loginCookie);
            if (user.getUserGender() != null) {
                SubjectDao subjectDao = new SubjectDao();
                List<Subject> subjects = subjectDao.findALLbyUser(user);
                request.setAttribute("subjects", subjects);
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            } else {
                response.sendRedirect("updateProfile.jsp");
            }

        } else {
            response.sendRedirect("loginFailure.jsp");
        }


    }

    protected void handleLogOut(HttpServletRequest request, HttpServletResponse response)
            throws  IOException {

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("JSESSIONID".equals(cookie.getName())) {

                    break;
                }
            }
        }

        // Delete the userName cookie
        Cookie userCookie = new Cookie("userName", "");
        userCookie.setMaxAge(0); // Delete cookie
        response.addCookie(userCookie);

        // Invalidate the session if exists
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        response.sendRedirect("landingPage.jsp");
    }

    protected void handleUpdateProfile(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        String userName = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userName")) userName = cookie.getValue();
            }
        }
        if (userName == null) {
            response.sendRedirect("landingPage.jsp");
        } else {
            UserDao userDao = new UserDao();
            User user = userDao.findByEmail(userName);
            String userPhone = request.getParameter("userPhone");
            String userDateOfBirth = request.getParameter("userDateOfBirth");
            String userAddress = request.getParameter("userAddress");
            String userGender = request.getParameter("userGender");
            String userRole = request.getParameter("userRole");
            long phone ;
            if (userPhone != null && !userPhone.trim().isEmpty()) {
                try {
                    phone = Long.parseLong(userPhone);
                    user.setUserPhone(phone);
                } catch (NumberFormatException e) {
                    System.err.println("Invalid phone number");
                    throw new RuntimeException("Invalid phone number format: " + userPhone);
                }
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Adjust the format if needed
            Date dateOfBirth ;
            try {
                dateOfBirth = sdf.parse(userDateOfBirth);
                user.setUserDateOfBirth(dateOfBirth);
            } catch (ParseException e) {
                System.err.println("Invalid date of birth");
                throw new RuntimeException(e);
            }
            try {


                if (genderType.valueOf(userGender).equals(genderType.MALE)) {
                    user.setUserGender(genderType.MALE);
                } else if (genderType.valueOf(userGender).equals(genderType.FEMALE)) {
                    user.setUserGender(genderType.FEMALE);
                }
            } catch (IllegalArgumentException e) {
                System.err.println("Invalid gender format ");
                throw new RuntimeException("Invalid gender format: " + userGender);
            }
            RoleDao roleDao = new RoleDao();
            user.setUserAddress(userAddress);
            if (roleType.valueOf(userRole).equals(roleType.USER)) {

                Role role = roleDao.findRole("USER");
                user.setRole(role);
                userDao.updateUser(user);
                response.sendRedirect("CoursesOnline.jsp");
            } else {
                Role role = roleDao.findRole("PROFESSOR");
                user.setRole(role);
                userDao.updateUser(user);
                response.sendRedirect("dashboard.jsp");
            }


        }

    }

}
