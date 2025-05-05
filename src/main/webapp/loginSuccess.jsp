<%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 30/04/2025
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LoginSuccess</title>
</head>
<body>
<%
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("userName")) userName = cookie.getValue();
        }
    }
    if(userName == null)
    {
        if(userName == null) response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
<h3>Hi <%=userName %>, Login successful.</h3>
<br>
<form action="<%= request.getContextPath() %>/logout" method="POST">
    <input type="submit" value="Logout" >
</form>
</body>
</html>

