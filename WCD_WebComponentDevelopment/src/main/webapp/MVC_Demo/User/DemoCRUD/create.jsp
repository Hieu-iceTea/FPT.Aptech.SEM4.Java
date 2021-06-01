<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <base href="<c:url value="/"/>">
    <title>Add User</title>

    <link type="text/css" rel="stylesheet" href="assets/thidk/css/style.css">
    <link type="text/css" rel="stylesheet" href="assets/thidk/css/add-style.css">
</head>

<body>

<jsp:include page="../../../components/menu.jsp"/>

<div id="wrapper">
    <div id="header">
        <h2>User MVC-CRUD</h2>
    </div>
</div>

<div id="container">
    <p>
        <a href="user/demo-crud">Back to List</a>
    </p>

    <h3>Add User</h3>

    <form action="user/demo-crud" method="GET">

        <input type="hidden" name="command" value="ADD"/>

        <table>
            <tbody>

            <tr>
                <td><label>username:</label></td>
                <td>
                    <input required type="text" name="username"/>
                </td>
            </tr>

            <tr>
                <td><label>password:</label></td>
                <td>
                    <input required type="text" name="password"/>
                </td>
            </tr>

            <tr>
                <td><label>firstname:</label></td>
                <td>
                    <input required type="text" name="firstname"/>
                </td>
            </tr>

            <tr>
                <td><label>lastname:</label></td>
                <td>
                    <input required type="text" name="lastname"/>
                </td>
            </tr>

            <tr>
                <td><label>gender:</label></td>
                <td>
                    <label style="display: inline">
                        <input style="width: auto" type="radio" name="gender" value="1" checked/>
                        Male
                    </label>
                    <label style="display: inline">
                        <input style="width: auto" type="radio" name="gender" value="2"/>
                        Female
                    </label>
                </td>
            </tr>

            <tr>
                <td><label>email:</label></td>
                <td>
                    <input required type="email" name="email"/>
                </td>
            </tr>

            <tr>
                <td><label>phone:</label></td>
                <td>
                    <input required type="tel" name="phone"/>
                </td>
            </tr>

            <tr>
                <td><label>address:</label></td>
                <td>
                    <textarea required name="address"></textarea>
                </td>
            </tr>

            <tr>
                <td><label>level:</label></td>
                <td>
                    <input required type="number" name="level"/>
                </td>
            </tr>

            <tr>
                <td><label>image:</label></td>
                <td>
                    <input required type="text" name="image"/>
                </td>
            </tr>

            <tr>
                <td><label>active:</label></td>
                <td>
                    <input type="checkbox" name="active" value="true"/>
                </td>
            </tr>

            <tr>
                <td><label></label></td>
                <td><input required type="submit" value="Save" class="save"/></td>
            </tr>

            </tbody>
        </table>
    </form>

    <div style="clear: both;"></div>

    <p>
        <a href="user/demo-crud">Back to List</a>
    </p>
</div>
</body>

</html>











