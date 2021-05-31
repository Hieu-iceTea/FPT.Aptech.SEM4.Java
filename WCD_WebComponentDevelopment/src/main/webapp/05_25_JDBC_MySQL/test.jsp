<%--
  Created by IntelliJ IDEA.
  User: Hieu_iceTea
  Date: 31/05/2021
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="resultSet" dataSource="jdbc/mysql/DatabaseName_Test">
    select * from TableName_Test
</sql:query>

<html>
<head>
    <title>DB Test</title>
</head>
<body>

<h2>Results</h2>

<c:forEach var="row" items="${resultSet.rows}">
    Foo: ${row.foo} <br>
    Bar: ${row.bar} <br>
    <br>
</c:forEach>

</body>
</html>
