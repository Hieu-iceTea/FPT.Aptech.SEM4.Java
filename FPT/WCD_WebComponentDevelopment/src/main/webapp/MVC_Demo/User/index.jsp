<%@ page import="com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.User" %>
<%@ page import="java.util.List" %>

<jsp:useBean id="users" scope="request" type="java.util.List<com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.User>"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>User list</title>
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

<h2>User list</h2>
<p>
    <a style="background-color: aquamarine; padding: 10px; border-radius: 10%" href="user/#create">Add new</a>
</p>

<c:if test="${ users.size() != 0 }">
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Username</th>
            <th>Firstname, Lastname</th>
            <th>Email</th>
            <th>Action</th>
        </tr>

        <c:forEach var="user" items="${users}">
            <tr>
                <td>${ user.id }</td>
                <td>${ user.username }</td>
                <td>${ user.firstname }, ${ user.lastname }</td>
                <td>${ user.email }</td>
                <td>
                    <a href="user/#show/?id=${ user.id }">Detail</a> |
                    <a href="user/#edit/?id=${ user.id }">Edit</a> |
                    <a href="user/#delete/?id=${ user.id }" onclick="return confirm('Are you sure delete this item?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${ users.size() == 0 }">
    <p><b>List empty.</b></p>
</c:if>

</body>
</html>
