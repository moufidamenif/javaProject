<%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 08/05/2025
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<video  id="video_<%= course.getCourseId() %>" controls style="
                            object-fit: cover;
                            display: block;
                            border-radius: 8px;">
    <source src="<%= request.getContextPath() + "/" + course.getVideoLink() %>" type="video/mp4">
    Your browser does not support the video tag.
</video>
</body>
</html>
