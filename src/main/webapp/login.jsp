<%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 30/04/2025
  Time: 9:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <form id="loginForm" action="<%= request.getContextPath() %>/login" method="POST">

            <div class="tr">
                <label  for="userEmail" style="display: block; margin-bottom: 10px;">email</label>
                <input id ="userEmail"   type="email" name="userEmail" required style="
    border-radius: 20px;
  width : 400px;
    height: 30px;
    border-color: #49BBBD;"/>

            </div>
            <div class="tr">
                <label  for="userPassword" style="display: block; margin-bottom: 10px;">Password</label>
                <input  type="password" name="userPassword" id ="userPassword" required style="
    border-radius: 20px;
 width : 400px;
    height: 30px;
        border-color: #49BBBD;"/>

            </div>

        <input type="submit" value="Submit"  style="margin-top: 30px; width : 400px;
    height: 30px;background-color: #49BBBD ;border-radius: 20px "/>
    </form>

