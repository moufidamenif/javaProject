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
<%@ page import="com.example.javaP.models.Course" %>
<html>
<head>

    <title>courses subjects</title>
    <link rel="stylesheet" type="text/css" href="./css/bodyCss.css">
</head>
<body>
<%@ include file="navbar.jsp" %>
<main style="flex: 1">
<%
    Subject subject = (Subject) request.getAttribute("subject");
    String subjectName =subject.getSubjectName();



%>
<h3>Your <%=subjectName %> Courses:</h3>

<ul style="display: flex; flex-wrap: wrap; ;gap: 1rem;padding: 0; margin: 0;
  justify-content: space-around;">
    <%
        List<Course> courses = (List<Course>) request.getAttribute("courses");
        if (courses != null && !courses.isEmpty()) {
            for (Course course : courses) {
                System.out.println(request.getContextPath() + "/" + course.getVideoLink());
    %>


            <li  style=" position: relative;list-style-type: none;flex: 1 1 300px;
                 height : 100% ; width: 100%; ; overflow: hidden;padding: 0">
                <div  style=" margin:10px  auto ; text-align:center;border-radius: 5px ;background-color: grey;color: black; height: 500px">


                    <div><b><%= course.getCourseName() %></b></div>

                    <div ><%= course.getCourseDescription() %></div>
                    <video  id="video_<%= course.getCourseId() %>" controls style="
                            object-fit: cover;
                            display: block;
                            border-radius: 8px;
                            width: 100%;
                            height: 400px">
                        <source src="<%= request.getContextPath() + "/" + course.getVideoLink() %>" type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                    <form action="<%= request.getContextPath()+"/course/details" %>" method="post" >
                        <input type="hidden" name="courseId" value="<%=course.getCourseId()%>">
                    <button type="submit" style=" padding: 0;
    border-radius: 10px;
    background-color: #49BBBD;
    border :none;
    opacity: 100%;
    width: 161px;
    height: 45px;">Course's Details </button>
                    </form>

                </div>
                <form action="<%= request.getContextPath() %>/course/delete" method="post" style="">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="subjectName" value="<%= subjectName %>">
                    <input type="hidden" name="courseId" value="<%= course.getCourseId() %>">

                    <button type="submit" onclick="return confirm('Are you sure you want to delete this course?')" style=" padding: 0;
    border-radius: 10px;
    background-color: #49BBBD;
    border :none;
    opacity: 100%;
    width: 161px;
    height: 45px;">Delete</button>
                </form>
            </li>


    <%
        }
    } else {
    %>
    <li>No Courses found.</li>
    <%
        }
    %>
</ul>

<form action="addCourse.jsp" method="post" style="display: flex; justify-content: center; margin: 30px auto;">
    <input type="hidden" name="subjectName" value="<%= subject.getSubjectName() %>">
    <button type="submit" style="width:600px; height: 45px; background-color: #49BBBD; border-radius: 10px; border: none;">
        ADD COURSE
    </button>
</form>
</main>
<%@ include file="footer.jsp" %>
</body>
</html>
