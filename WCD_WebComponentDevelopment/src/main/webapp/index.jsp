<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>

<jsp:include page="components/menu.jsp"/>

<p>
    The time on the server is: <%= new Date() %>
</p>


<br/>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>