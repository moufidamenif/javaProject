<%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 26/03/2025
  Time: 8:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <form id="registerForm" action="<%= request.getContextPath() %>/register" method="POST">
            <div class ="tr">

                   <label for="userName" style="display: block; margin-bottom: 10px;">userName </label>
                       <input type="text" name="userName" required id="userName" style="
    border-radius: 20px;
     width : 400px;
    height: 30px;
    border-color: #49BBBD;"/>
                </div>
            </div>
            <div class="tr">

                    <label for="userEmail" style="display: block; margin-bottom: 10px;">email</label>
                        <input type="email" name="userEmail" required id ="userEmail" style="
    border-radius: 20px;
     width : 400px;
    height: 30px;
    border-color: #49BBBD;"/>
            </div>
            <div class="tr ">

                <label for="userPassword" style="display: block; margin-bottom: 10px;">userPassword</label>
                    <input type="password" name="userPassword" required id ="userPassword" style="
    border-radius: 20px;
    width : 400px;
    height: 30px;
    border-color: #49BBBD;"/>

            </div>
        <input type="submit" value="Submit"  style="margin-top: 30px; width : 400px;
    height: 30px;background-color: #49BBBD ;border-radius: 20px " />
    </form>
