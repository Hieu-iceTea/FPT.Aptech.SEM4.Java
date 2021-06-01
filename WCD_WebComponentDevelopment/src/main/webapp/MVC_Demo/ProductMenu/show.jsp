<%--
  Created by IntelliJ IDEA.
  User: Hieu_iceTea
  Date: 01/06/2021
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task list</title>
</head>
<body>

<jsp:include page="../../components/menu.jsp"/>

<jsp:useBean id="product"
             scope="request"
             type="com.example.WCD_WebComponentDevelopment.MVC_Demo.Model.Product"
/>

<h2>Task list | Show</h2>
<p>
    <a style="background-color: greenyellow; padding: 5px; border-radius: 10%"
       href="task/#edit/?id=${ product.id }">Edit</a> |
    <a style="background-color: coral; padding: 5px; border-radius: 10%" href="task/#delete/?id=${ product.id }"
       onclick="return confirm('Are you sure delete this item?')">Delete</a>
</p>

<p>
    Id:
    <b>${ product.id }</b>
</p>

<p>
    name:
    <b>${ product.name }</b>
</p>

<p>
    restaurantId:
    <b>${ product.restaurantId }</b>
</p>

<p>
    ingredients:
    <b>${ product.ingredients }</b>
</p>

<p>
    price:
    <b>${ product.price }</b>
</p>

<p>
    image:
    <b>${ product.image }</b>
</p>

<p>
    country:
    <b>${ product.country }</b>
</p>

<p>
    tag:
    <b>${ product.tag }</b>
</p>

<p>
    description:
    <b>${ product.description }</b>
</p>

<p>
    featured:
    <b>${ product.featured }</b>
</p>

<br>

<p>
    CreatedAt:
    <b>${ product.createdAt }</b>
</p>

<p>
    CreatedBy:
    <b>${ product.createdBy }</b>
</p>

<p>
    UpdatedAt:
    <b>${ product.updatedAt }</b>
</p>

<p>
    UpdatedBy:
    <b>${ product.updatedBy }</b>
</p>

<p>
    Version:
    <b>${ product.version }</b>
</p>

<p>
    Deleted:
    <b>${ product.deleted }</b>
</p>


</body>
</html>
