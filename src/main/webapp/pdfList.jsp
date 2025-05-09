<%@ page import="com.example.javaP.models.Pdf" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.javaP.models.Course" %><%--
  Created by IntelliJ IDEA.
  User: Moufida Menif
  Date: 09/05/2025
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<%@ include file="navbar.jsp" %>
<div style="display: grid;
    grid-template-columns: repeat(2, 1fr); background-color: rgba(157, 204, 255, 0.2);
">



</div>
<%
    Course course =(Course) request.getAttribute("course");%>
<h1><%="your "+course+"pdfs"%></h1>
<ul style="display: flex; flex-wrap: wrap; ;gap: 1rem;padding: 0; margin: 0;
  justify-content: space-around;">
    <%
        List<Pdf> pdfs = (List<Pdf>) request.getAttribute("pdfs");
        if (pdfs != null && !pdfs.isEmpty()) {
            for (Pdf pdf : pdfs) {
    %>


        <li onclick="this.closest('form').submit()" style="  position: relative;list-style-type: none;flex: 1 1 200px;
  width: 100%; height: 200px; overflow: hidden;padding: 0">
            <div>
                <file src="<%= request.getContextPath() + "/" + pdf.getPdfLink() %>" alt="pdf file" style="
  width: 100%; height: 100%; object-fit: cover;
  display: block;
  border-radius: 8px;" />



            </div>
        </li>
    <%
        }
    } else {
    %>
    <li>No pdfs found.</li>
    <%
        }
    %>
</ul>
</body>
</html>
