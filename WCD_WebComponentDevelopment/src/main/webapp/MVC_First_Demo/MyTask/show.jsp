<%--
  Created by IntelliJ IDEA.
  User: Hieu_iceTea
  Date: 26/05/2021
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task list</title>
</head>
<body>

<jsp:include page="../../components/menu.jsp"/>

<jsp:useBean id="myTask" scope="request" type="com.example.WCD_WebComponentDevelopment.MVC_First_Demo.Model.MyTask"/>

<h2>Task list | Show</h2>
<p>
    <a style="background-color: greenyellow; padding: 5px; border-radius: 10%"
       href="task/edit/?id=${ myTask.id }">Edit</a> |
    <a style="background-color: coral; padding: 5px; border-radius: 10%" href="task/delete/?id=${ myTask.id }"
       onclick="return confirm('Are you sure delete this item?')">Delete</a>
</p>

<p>
    Id:
    <b>${ myTask.id }</b>
</p>

<p>
    Title:
    <b>${ myTask.title }</b>
</p>

<p>
    Content:
    <br>
    <b>${ myTask.content }</b>
</p>

<p>
    Assign (username):
    <b>${ myTask.assign.username }</b>
</p>

<p>
    StartDate:
    <b>${ myTask.startDate }</b>
</p>

<p>
    EndDate:
    <b>${ myTask.endDate }</b>
</p>

<p>
    Status:
    <b>${ myTask.status }</b>
</p>

<p>
    Note:
    <b>${ myTask.note }</b>
</p>

<p>
    CreatedAt:
    <b>${ myTask.createdAt }</b>
</p>

<p>
    CreatedBy:
    <b>${ myTask.createdBy }</b>
</p>

<p>
    UpdatedAt:
    <b>${ myTask.updatedAt }</b>
</p>

<p>
    UpdatedBy:
    <b>${ myTask.updatedBy }</b>
</p>

<p>
    Version:
    <b>${ myTask.version }</b>
</p>

<p>
    Deleted:
    <b>${ myTask.deleted }</b>
</p>


</body>
</html>
