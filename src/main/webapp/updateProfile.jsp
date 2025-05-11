<%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 30/04/2025
  Time: 9:54 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Landing Page</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bodyCss.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/landingPage.css">
    <script src="./js/landingPage.js"></script>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div  class="wrapper">
    <img src="./images/updateProfile.png"  >
    <div >
        <h1>Update your profile please </h1>
<form id="loginForm" action="<%= request.getContextPath() %>/updateProfile" method="POST">

    <div class="tr">
        <label  for="userPhone" style="display: block; margin-bottom: 10px;">userPhone</label>
        <input id ="userPhone"   type="number" name="userPhone" required style="
    border-radius: 20px;
  width : 400px;
    height: 30px;
    border-color: #49BBBD;"/>

    </div>
    <div class="tr">
        <label  for="userDateOfBirth" style="display: block; margin-bottom: 10px;">userDateOfBirth</label>
        <input  type="date" name="userDateOfBirth" id ="userDateOfBirth" required style="
    border-radius: 20px;
 width : 400px;
    height: 30px;
        border-color: #49BBBD;"/>

    </div>
    <div class="tr">
        <label  for="userAddress" style="display: block; margin-bottom: 10px;">userAddress</label>
        <input  type="text" name="userAddress" id ="userAddress" required style="
    border-radius: 20px;
 width : 400px;
    height: 30px;
        border-color: #49BBBD;"/>

    </div>
    <div class="tr">
        <label style="display: block; margin-bottom: 10px;">Gender</label>

        <label>
            <input type="radio" name="userGender" value="FEMALE" required />
            Female
        </label>

        <label>
            <input type="radio" name="userGender" value="MALE" required />
            Male
        </label>
    </div>
    <div class="tr">
        <label style="display: block; margin-bottom: 10px;">Are you a Professor ?</label>

        <label>
            <input type="radio" name="userRole" value="PROFESSOR" required />
            Yes
        </label>

        <label>
            <input type="radio" name="userRole" value="USER" required />
            No
        </label>
    </div>
    <input type="submit" value="Submit"  style="margin-top: 30px; width : 400px;
    height: 30px;background-color: #49BBBD ;border-radius: 20px "/>
</form>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
