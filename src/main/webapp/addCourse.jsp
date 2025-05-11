<%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 08/05/2025
  Time: 3:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.javaP.models.Subject" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bodyCss.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<main style="flex: 1">
<form id="addCourse" action="<%= request.getContextPath() %>/course/add" method="POST" enctype="multipart/form-data">
    <%
        String subjectName = request.getParameter("subjectName");

    %>

    <input type="hidden" name="subjectName" value="<%= subjectName %>">
    <div class="tr">
        <label  for="courseName" style="display: block; margin-bottom: 10px;">courseName</label>
        <input  type="text" name="courseName" id ="courseName" required style="
    border-radius: 20px;
 width : 400px;
    height: 30px;
        border-color: #49BBBD;"/>

    </div>
    <div class="tr">
        <label  for="courseDescription" style="display: block; margin-bottom: 10px;">courseDescription</label>
        <input id ="courseDescription"   type="text" name="courseDescription" required style="
    border-radius: 20px;
  width : 400px;
    height: 30px;
    border-color: #49BBBD;"/>

    </div>
    <div class="tr">
        <label  for="video" style="display: block; margin-bottom: 10px;">Video</label>
        <input id ="video"   type="file" name="video" required style="
    border-radius: 20px;
  width : 400px;
    height: 30px;
    border-color: #49BBBD;"/>

    </div>


    <input type="submit" value="Submit"  style="margin-top: 30px; width : 400px;
    height: 30px;background-color: #49BBBD ;border-radius: 20px "/>
</form>
</main>
<%@ include file="footer.jsp" %>

</body>
</html>
