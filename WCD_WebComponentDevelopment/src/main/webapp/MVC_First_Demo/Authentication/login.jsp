<%--
  Created by IntelliJ IDEA.
  User: Hieu_iceTea
  Date: 28/05/2021
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Login</title>
</head>
<body>

<jsp:include page="/components/menu.jsp"/>

<h2>Login</h2>

<jsp:include page="/components/errorMessage.jsp"/>

<form action="login" method="post">
    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username"><br>
    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password"><br><br>
    <input type="submit" value="Log in">
</form>

</body>
</html>
