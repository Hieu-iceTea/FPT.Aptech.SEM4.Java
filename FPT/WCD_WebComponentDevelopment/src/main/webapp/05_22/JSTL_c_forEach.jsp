<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP</title>
</head>
<body>
<h1>
    JSTL_c_forEach
</h1>
<br/>

<jsp:include page="../components/menu.jsp"/>

<p>
    <c:forEach var="i" begin="1" end="5">
        Item <c:out value="${i}"/>
    </c:forEach>
</p>

<ul>
    <c:forEach var="i" begin="1" end="8">
        <li>Item: ${i}</li>
    </c:forEach>
</ul>

</body>
</html>