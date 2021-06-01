<%--
  Created by IntelliJ IDEA.
  User: Hieu_iceTea
  Date: 01/06/2021
  Time: 09:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.User" %>
<%@ page import="java.util.List" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Product>"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Product list</title>
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

<h2>Product list</h2>
<p>
    <a style="background-color: aquamarine; padding: 10px; border-radius: 10%" href="product-menu/#create">Add new</a>
</p>

<c:if test="${ products.size() != 0 }">
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Ingredients</th>
            <th>Price</th>
            <th style="min-width: 150px">Action</th>
        </tr>

        <c:forEach var="product" items="${products}">
            <tr>
                <td>${ product.id }</td>
                <td>${ product.name }</td>
                <td>${ product.ingredients }</td>
                <td>${ product.price }</td>
                <td>
                    <a href="product-menu/show/?id=${ product.id }">Detail</a> |
                    <a href="product-menu/#edit/?id=${ product.id }">Edit</a> |
                    <a href="product-menu/#delete/?id=${ product.id }" onclick="return confirm('Are you sure delete this item?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${ products.size() == 0 }">
    <p><b>List empty.</b></p>
</c:if>

</body>
</html>
