<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <base href="<c:url value="/"/>">
    <title>user Tracker App</title>

    <link type="text/css" rel="stylesheet" href="assets/thidk/css/style.css">
    <link type="text/css" rel="stylesheet" href="assets/thidk/css/add-style.css">

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

<jsp:include page="../../../components/menu.jsp"/>

<div id="wrapper">
    <div id="header">
        <h2>User MVC-CRUD</h2>
    </div>
</div>

<div id="container">

    <div id="content">

        <!-- put new button: Add user -->

        <input type="button" value="Add user"
               onclick="window.location.href='MVC_Demo/User/DemoCRUD/create.jsp'; return false;"
               class="add-button"
        />

        <table>
            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Firstname, Lastname</th>
                <th>Email</th>
                <th>Action</th>
            </tr>

            <c:forEach var="user" items="${users}">

                <!-- set up a link for each user -->
                <c:url var="editLink" value="user/demo-crud">
                    <c:param name="command" value="LOAD"/>
                    <c:param name="id" value="${user.id}"/>
                </c:url>

                <!-- set up a link to delete a user -->
                <c:url var="deleteLink" value="user/demo-crud">
                    <c:param name="command" value="DELETE"/>
                    <c:param name="id" value="${user.id}"/>
                </c:url>

                <tr>
                    <td> ${user.id} </td>
                    <td> ${user.username} </td>
                    <td> ${user.firstname}, ${user.lastname} </td>
                    <td> ${user.email} </td>
                    <td>
                        <a href="${editLink}">Edit</a>
                        |
                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete this user?'))) return false">
                            Delete</a>
                    </td>
                </tr>

            </c:forEach>

        </table>

    </div>

</div>
</body>


</html>

