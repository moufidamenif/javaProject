<%@ page import="com.example.javaP.dao.UserDao" %>
<%@ page import="com.example.javaP.models.User" %><%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 06/05/2025
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Learnify</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href=<%=request.getContextPath() + "/"+"dashboard"%>>Subjects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">Courses</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link disabled" aria-disabled="true">About Us </a>
                </li>
                <li class="nav-item dropdown">
                    <%
                        String username = null;
                        Cookie[] cookies = request.getCookies();
                        if (cookies != null) {
                            for (Cookie cookie : cookies) {
                                if ("userName".equals(cookie.getName())) {
                                    UserDao userDao = new UserDao();
                                    User user = userDao.findByEmail(cookie.getValue());
                                    username = user.getUserName();
                                    break;
                                }
                            }
                        }
                    %>
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <%=username!=null ?username :"Guest" %>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">updatePhoto</a></li>
                        <li><a class="dropdown-item" href="#">upgrade</a></li>
                        <li><a class="dropdown-item" href="#">Account Settings </a></li>

                        <li> <form action="<%=request.getContextPath() + "/"+"logout"%>" method="POST">
                            <button type="submit"  class="dropdown-item" style="background: none; border: none;"  >
                            Logout
                            </button>
                        </form>




                        </li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>

</body>
</html>
