<%@ page import="com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Status" %><%--
  Created by IntelliJ IDEA.
  User: Hieu_iceTea
  Date: 26/05/2021
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Task list</title>
</head>
<body>

<jsp:include page="../../components/menu.jsp"/>

<h2>Task list | Edit</h2>

<jsp:useBean id="myTask" scope="request" type="com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.MyTask"/>

<form action="task/edit/?id=${ myTask.id }" method="post">
    <label>Title:</label>
    <br>
    <input style="width: 33%" required type="text" name="title" value="${ myTask.title }">
    <br>
    <br>

    <label>Content:</label>
    <br>
    <textarea style="width: 33%" required rows="5" name="content">${ myTask.content }</textarea>
    <br>
    <br>

    <label>Assign (username):</label>
    <br>
    <input readonly style="width: 33%" type="text" name="assign" value="${ myTask.assign.username }">
    <br>
    <br>

    <label>StartDate:</label>
    <br>
    <input style="width: 33%" type="datetime-local" name="startDate" value="${ myTask.startDate }">
    <br>
    <br>

    <label>EndDate:</label>
    <br>
    <input style="width: 33%" type="datetime-local" name="endDate" value="${ myTask.endDate }">
    <br>
    <br>

    <label>Status:</label>
    <br>
    <select name="status" required style="width: 33%">
        <option value="">-- Chose Status --</option>
        <c:set var="StatusValues"
               value="<%=com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Status.values()%>"/>
        <c:forEach var="item" items="${ StatusValues }">
            <option ${ myTask.status == item ? "selected" : "" }>${ item }</option>
        </c:forEach>
    </select>
    <br>
    <br>

    <label>Note:</label>
    <br>
    <input style="width: 33%" type="text" name="note" value="${ myTask.note }">
    <br>
    <br>

    <button type="submit">Submit</button>
</form>


</body>
</html>
