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
    <link rel="stylesheet" type="text/css" href="./css/bodyCss.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<div style="display: grid;
    grid-template-columns: repeat(2, 1fr); background-color: rgba(157, 204, 255, 0.2);
">
    <div>
        <h1>Welcome to your dashboard, Professor.</h1>
        <p style="width: 500px; padding: 10px;
">Here, you can find a personalized overview of all the subjects you are currently managing.<br> Each subject is displayed with its title and associated image, allowing for quick and easy access to your teaching materials.<br> Use this dashboard to stay organized, monitor your courses, and manage your educational content efficiently.</p>
        <button STYLE=" padding: 0;
    border-radius: 10px;
    background-color: #49BBBD;
    border :none;
    opacity: 100%;
    width: 161.2px;
    height: 45.2px;">Start teaching Now</button>
    </div>
    <div><img src="images/professorDashboard.png" alt="professorDashboard"></div>


</div>

<h3>Your Subjects:</h3>

<ul style="display: flex; flex-wrap: wrap; ;gap: 1rem;padding: 0; margin: 0;
  justify-content: space-around;">
    <%
        List<Subject> subjects = (List<Subject>) request.getAttribute("subjects");
        if (subjects != null && !subjects.isEmpty()) {
            for (Subject subject : subjects) {
    %>

    <form action="<%= request.getContextPath() %>/course" method="get" style="margin: 0; padding: 0;">
        <input type="hidden" name="subjectName" value="<%= subject.getSubjectName() %>">
    <li onclick="this.closest('form').submit()" style="  position: relative;list-style-type: none;flex: 1 1 200px;
  width: 100%; height: 200px; overflow: hidden;padding: 0">
        <div>
        <img src="<%= request.getContextPath() + "/" + subject.getImagePath() %>" alt="Subject Image" style="
  width: 100%; height: 100%; object-fit: cover;
  display: block;
  border-radius: 8px;" />

     <div style="text-align:center;height: 40px; width: 150px; position: absolute; bottom: 10px; left: 40px;border-radius: 5px ;background-color: rgba(255, 255, 255, 0.7);color: black;"><%= subject.getSubjectName() %></div>
            <form action="<%= request.getContextPath() %>/dashboard" method="post" style="margin-top: 10px;position: absolute; bottom: -10px; right: 10px;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="subjectName" value="<%= subject.getSubjectName() %>">
                <button type="submit" onclick="return confirm('Are you sure you want to delete this subject?')" style=" padding: 0;
    border-radius: 10px;
    background-color: #49BBBD;
    border :none;
    opacity: 100%;
    width: 161.2px;
    height: 45.2px;">Delete</button>
            </form>
        </div>
    </li>
    </form>
    <%
        }
    } else {
    %>
    <li>No subjects found.</li>
    <%
        }
    %>
</ul>

<button style=" width:600px;margin: 30px auto;
    height: 45.2px;background-color: #49BBBD ;border-radius: 10px ;border: none "><a href="addDashboard.jsp" style="all: unset">addSubject</a></button>
<%@ include file="footer.jsp" %>
</body>
</html>
