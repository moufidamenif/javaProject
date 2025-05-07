package com.example.javaP.controllers;

import com.example.javaP.dao.SubjectDao;
import com.example.javaP.dao.UserDao;
import com.example.javaP.models.Subject;
import com.example.javaP.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;

import java.security.GeneralSecurityException;
import java.util.List;
@MultipartConfig
public class SubjectServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String servletPath = request.getPathInfo();
            if ("/add".equals(servletPath)) {
                handleAddDashboard(request, response);
            } else if ("/delete".equals(servletPath)) {
                handleDeleteDashboard(request, response);
            }
            else if ("/update".equals(servletPath)) {
                handleupdateDashboard(request, response);}
            else if( request.getParameter("action").equals("delete")){
                handleDeleteDashboard(request, response);
            }

            else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown path");
            }
        }
        catch (GeneralSecurityException e) {
            throw new ServletException("Security exception occurred", e);

        }}
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String servletPath = request.getServletPath(); // returns "/login" or "/register"
        if ("/dashboard".equals(servletPath))
        {

    try {
        handleDashboard(request, response);
    } catch (GeneralSecurityException e) {
        throw new RuntimeException(e);
    }
}}
    protected void handleAddDashboard (HttpServletRequest request, HttpServletResponse response)
            throws  GeneralSecurityException {
        try{
        String subjectDescription = request.getParameter("subjectDescription");
        String subjectName = request.getParameter("subjectName");
            Part filePart = request.getPart("subjectImage"); // name in input
            String fileName = new File(filePart.getSubmittedFileName()).getName();
            String uploadPath = getServletContext().getRealPath("") + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            // Save the file
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
        String userName = null;
        Cookie[] cookies = request.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("userName")) userName = cookie.getValue();
            }
        }
        if(userName == null)
        {response.sendRedirect("landingPage.jsp");}
        else if (subjectDescription != null && subjectName != null) {

             UserDao userDao = new UserDao();
            User user = userDao.findByEmail(userName);

            Subject subject= new Subject(subjectName,subjectDescription,  user,"uploads/" + fileName);
            System.out.println(subject.getSubjectName());
            SubjectDao subjectDao = new SubjectDao();
            subjectDao.save(subject);
            response.sendRedirect(request.getContextPath() + "/dashboard");
        }
        else {
              throw new IllegalArgumentException(
                    "Parameter is not present in configuration file");
        }
        }catch(Exception e){
        System.out.println("error is "+e.getMessage());}
    }
    protected void handleDeleteDashboard (HttpServletRequest request, HttpServletResponse response)
            throws  IOException ,GeneralSecurityException{
        try{
            String subjectName = request.getParameter("subjectName");
            String userName = null;
            Cookie[] cookies = request.getCookies();
            System.out.println(cookies[0].toString());

            for(Cookie cookie : cookies){
                if(cookie.getName().equals("userName")) userName = cookie.getValue();
            }
            if(userName == null)
            {response.sendRedirect("landingPage.jsp");}
            else {
                UserDao userDao = new UserDao();
                User user = userDao.findByEmail(userName);
                SubjectDao subjectDao = new SubjectDao();
                subjectDao.removeSubject(subjectName, user);
                response.sendRedirect(request.getContextPath() + "/dashboard");
            }
        }catch (Exception e){
            System.out.println(e.getMessage());}
    }
    protected void handleupdateDashboard (HttpServletRequest request, HttpServletResponse response)
            throws IOException, GeneralSecurityException, ServletException {
        String userName = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userName")) userName = cookie.getValue();
            }
        }
        if (userName == null) {
            response.sendRedirect("landing¨Page.jsp");
        } else {
            UserDao userDao = new UserDao();
            User user = userDao.findByEmail(userName);
            handleDashboard(request, response);
        }
    }
    protected void handleDashboard (HttpServletRequest request, HttpServletResponse response)
            throws IOException, GeneralSecurityException, ServletException {
        try{
            System.out.println("working");
        String userName = null;
        Cookie[] cookies = request.getCookies();
        System.out.println(cookies[0].toString());

            for(Cookie cookie : cookies){
                if(cookie.getName().equals("userName")) userName = cookie.getValue();
            }
        if(userName == null)
        {response.sendRedirect("landingPage.jsp");}
        else {
            UserDao userDao = new UserDao();
            User user = userDao.findByEmail(userName);
            SubjectDao subjectDao = new SubjectDao();
            List<Subject> subjects = subjectDao.findALLbyUser(user);
            request.setAttribute("subjects", subjects);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }catch (Exception e){
        System.out.println(e.getMessage());}
    }




}
