package com.example.javaP.controllers;

import com.example.javaP.dao.SubjectDao;
import com.example.javaP.dao.UserDao;
import com.example.javaP.models.Course;
import com.example.javaP.models.Subject;
import com.example.javaP.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import com.example.javaP.dao.courseDao;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.security.GeneralSecurityException;
import java.util.List;

import static java.lang.Long.parseLong;

@MultipartConfig
public class courseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String servletPath = request.getPathInfo();
            if ("/add".equals(servletPath)) {
                handleAddCourse(request, response);
            } else if ("/delete".equals(servletPath)) {
                handleDeleteCourse(request, response);
            } else if ("/update".equals(servletPath)) {
                handleUpdateCourse(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown path");
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servletPath = request.getServletPath(); // returns "/login" or "/register"
        if ("/course".equals(servletPath)) {
            handleCourse(request, response);
        }

    }

    protected void handleCourse(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        try {

            String subjectName = request.getParameter("subjectName");
            String userName = null;
            Cookie[] cookies = request.getCookies();
            System.out.println(cookies[0].toString());

            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userName")) userName = cookie.getValue();
            }
            if (userName == null) {
                response.sendRedirect("landingPage.jsp");
            } else {
                SubjectDao subjectDao = new SubjectDao();
                UserDao userDao = new UserDao();
                User user = userDao.findByEmail(userName);
                Subject subject = subjectDao.findBySubjectName(subjectName, user);
                courseDao courseDao = new courseDao();
                List<Course> courses = courseDao.findAllBySubject(subject);
                request.setAttribute("courses", courses);
                request.setAttribute("subject", subject);
                request.getRequestDispatcher("course.jsp").forward(request, response);


            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void handleAddCourse(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String subjectName = request.getParameter("subjectName");
            String courseName = request.getParameter("courseName");
            String courseDescription = request.getParameter("courseDescription");
            Part filePart = request.getPart("video"); // name in input
            String fileName = new File(filePart.getSubmittedFileName()).getName();
            if (fileName.isEmpty()) {
                throw new RuntimeException("File name is missing");
            }
            String relativeFilePath = "uploads/" + fileName;
            String userName = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("userName")) userName = cookie.getValue();
                }
            }
            if (userName == null) {
                response.sendRedirect("landingPage.jsp");
            } else if (courseName != null && courseDescription != null) {

                UserDao userDao = new UserDao();
                User user = userDao.findByEmail(userName);
                SubjectDao subjectDao = new SubjectDao();
                Subject subject = subjectDao.findBySubjectName(subjectName, user);
                courseDao courseDao = new courseDao();
                Course course = new Course(courseName, courseDescription, relativeFilePath, subject);
                courseDao.SaveCourse(course);
                response.sendRedirect(request.getContextPath() + "/course?subjectName=" + URLEncoder.encode(subjectName, "UTF-8"));
            } else {
                throw new IllegalArgumentException(
                        "Parameter is not present in configuration file");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal error: " + e.getMessage());
        }
    }


     protected void handleDeleteCourse(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
         try{
             String courseId = request.getParameter("courseId");
             String subjectName =request.getParameter("subjectName");
             String userName = null;
             Cookie[] cookies = request.getCookies();
             System.out.println(cookies[0].toString());

             for(Cookie cookie : cookies){
                 if(cookie.getName().equals("userName")) userName = cookie.getValue();
             }
             if(userName == null)
             {response.sendRedirect("landingPage.jsp");}
             else if (courseId!=null){
                 UserDao userDao = new UserDao();
                 User user = userDao.findByEmail(userName);
                 courseDao courseDao = new courseDao();
                 courseDao.DeleteCourse(parseLong(courseId));
                 response.sendRedirect(request.getContextPath() + "/course?subjectName=" + URLEncoder.encode(subjectName, "UTF-8"));
             }
         }catch (Exception e){
             System.out.println(e.getMessage());}
     }

    protected void handleUpdateCourse(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {}
}
