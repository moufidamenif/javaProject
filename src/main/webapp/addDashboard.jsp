<%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 05/05/2025
  Time: 3:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Subject Add</title>
    <link rel="stylesheet" type="text/css" href="./css/bodyCss.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<form id="addDashboard" action="<%= request.getContextPath() %>/dashboard/add" method="POST" enctype="multipart/form-data">
    <div class="tr">
        <label  for="subjectName" style="display: block; margin-bottom: 10px;">subjectName</label>
        <input  type="text" name="subjectName" id ="subjectName" required style="
    border-radius: 20px;
 width : 400px;
    height: 30px;
        border-color: #49BBBD;"/>

    </div>
    <div class="tr">
        <label  for="subjectDescription" style="display: block; margin-bottom: 10px;">subjectDescription</label>
        <input id ="subjectDescription"   type="text" name="subjectDescription" required style="
    border-radius: 20px;
  width : 400px;
    height: 30px;
    border-color: #49BBBD;"/>

    </div>
    <div class="tr">
        <label  for="subjectImage" style="display: block; margin-bottom: 10px;">subjectImage</label>
        <input id ="subjectImage"   type="file" name="subjectImage" required style="
    border-radius: 20px;
  width : 400px;
    height: 30px;
    border-color: #49BBBD;"/>

    </div>


    <input type="submit" value="Submit"  style="margin-top: 30px; width : 400px;
    height: 30px;background-color: #49BBBD ;border-radius: 20px "/>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>
