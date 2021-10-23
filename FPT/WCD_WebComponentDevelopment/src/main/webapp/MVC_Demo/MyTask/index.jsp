<%@ page import="com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.MyTask" %>
<%@ page import="java.util.List" %>

<jsp:useBean id="myTasks" scope="request" type="java.util.List<com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.MyTask>"/>

<%--
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
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }

        td:last-child, th:last-child {
            /*width: 400px;*/
            /*text-align: center;*/
        }
    </style>
</head>
<body>

<jsp:include page="../../components/menu.jsp"/>

<h2>Task list</h2>
<p>
    <a style="background-color: aquamarine; padding: 10px; border-radius: 10%" href="task/create">Add new</a>
</p>

<c:if test="${ myTasks.size() != 0 }">
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Content</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <c:forEach var="myTask" items="${myTasks}">
            <tr>
                <td>${ myTask.id }</td>
                <td>${ myTask.title }</td>
                <td>${ myTask.content }</td>
                <td>${ myTask.status }</td>
                <td>
                    <a href="task/show/?id=${ myTask.id }">Detail</a> |
                    <a href="task/edit/?id=${ myTask.id }">Edit</a> |
                    <a href="task/delete/?id=${ myTask.id }" onclick="return confirm('Are you sure delete this item?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${ myTasks.size() == 0 }">
    <p><b>List empty.</b></p>
</c:if>

</body>
</html>
