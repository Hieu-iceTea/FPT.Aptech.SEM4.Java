<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP</title>
</head>
<body>
<h1>
    Form student - Servlet
</h1>
<br/>

<jsp:include page="../components/menu.jsp"/>

<form action="FormResponse">
    <label>First name:</label>
    <input type="text" name="firstname">
    <br>
    <br>
    <label>Last name:</label>
    <input type="text" name="lastname">
    <br>
    <br>
    <button type="submit">Submit</button>
</form>

</body>
</html>