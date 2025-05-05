<%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 05/05/2025
  Time: 3:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.javaP.models.Subject" %>
<html>
<head>
    <title>dashboard subjects</title>
</head>
<body>
<h2>Welcome!</h2>

<h3>Your Subjects:</h3>

<ul>
    <%
        List<Subject> subjects = (List<Subject>) request.getAttribute("subjects");
        if (subjects != null && !subjects.isEmpty()) {
            for (Subject subject : subjects) {
    %>
    <li><%= subject.getSubjectName() %></li> <!-- Adjust to your actual field -->
    <%
        }
    } else {
    %>
    <li>No subjects found.</li>
    <%
        }
    %>
</ul>
<button style="margin-top: 30px; width : 400px;
height: 30px;background-color: #49BBBD ;border-radius: 20px "><a href="addDashboard.jsp">addSubject</a></button>
</body>
</html>
