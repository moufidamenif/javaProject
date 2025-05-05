<%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 28/04/2025
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Landing Page</title>
    <link rel="stylesheet" type="text/css" href="./css/landingPage.css">
    <script src="./js/landingPage.js"></script>
</head>
<body>


<div  class="wrapper">
<img src="./images/landingPage.png"  >
    <div >
    <h1>welcome to Learnify</h1>
        <div id ="container_buttons">
            <button id ="login_button"  onclick=showForm('login.jsp') >Login</button>
            <button  id ="register_button"  onclick=showForm('register.jsp') >Register</button>

        </div>
            <h1>Education is key to success </h1>
        <div id="formContainer"></div>


    </div>
</div>

</body>
</html>
