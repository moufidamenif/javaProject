<%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 26/03/2025
  Time: 8:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Form</title>
</head>
<body>
<div>
    <h1>User Register Form</h1>
    <form action="<%= request.getContextPath() %>/register" method="POST">
        <table style="width: 80%">
            <tr>
                    <td>UserName</td>
                <td><label>
                    <input type="text" name="userName" required/>
                </label></td>
            </tr>
            <tr>
                <td>email</td>
                <td><label>
                    <input type="email" name="userEmail" required/>
                </label></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><label>
                    <input type="password" name="userPassword" required/>
                </label></td>
            </tr>

        </table>
        <input type="submit" value="Submit" />
    </form>
</div>
</body>
</html>