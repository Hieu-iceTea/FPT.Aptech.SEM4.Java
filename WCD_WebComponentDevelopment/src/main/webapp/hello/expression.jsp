<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Expression</title>
</head>
<body>
<h1><%= "Expression" %>
</h1>
<br/>

<jsp:include page="../components/menu.jsp"/>

<p>
    The time on the server is: <%= new Date() %>
</p>

<p>
    Converting a string to uppercase: <%= "Hello World!".toUpperCase() %>
</p>

<p>
    25 multiplied by 4 equals: <%= 25 * 4 %>
</p>

<p>
    Is 75 less than 69?: <%= 75 < 69 %>
</p>

</body>
</html>