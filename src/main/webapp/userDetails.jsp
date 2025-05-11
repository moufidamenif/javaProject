<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Details</title>
</head>
<body>
<script>
    function LandingPage(url) {
        location.href=url;

    }
</script>
<h1>User successfully registered!</h1>
<h3>return to landing Page </h3>
<button
        onclick="LandingPage('<%= request.getContextPath() %>/landingPage.jsp')"
        style="margin-top : 30px; border-radius: 10px; background-color: #49BBBD; border: none; height: 40px; width: 150px; ">
    LandingPage
</button>
</body>
</html>