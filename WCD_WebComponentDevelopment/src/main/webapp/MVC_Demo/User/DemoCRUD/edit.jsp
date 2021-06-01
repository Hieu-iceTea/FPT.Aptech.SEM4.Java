<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <base href="<c:url value="/"/>">
    <title>Update User</title>

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
    <h3>Update User</h3>

    <form action="user/demo-crud" method="GET">

        <input type="hidden" name="command" value="UPDATE"/>

        <input type="hidden" name="id" value="${user.id}"/>
        <input type="hidden" name="version" value="${user.version}"/>

        <table>
            <tbody>

            <tr>
                <td><label>username:</label></td>
                <td>
                    <input required type="text" name="username" value="${user.username}"/>
                </td>
            </tr>

            <tr>
                <td><label>password:</label></td>
                <td>
                    <input required type="text" name="password" value="${user.password}"/>
                </td>
            </tr>

            <tr>
                <td><label>firstname:</label></td>
                <td>
                    <input required type="text" name="firstname" value="${user.firstname}"/>
                </td>
            </tr>

            <tr>
                <td><label>lastname:</label></td>
                <td>
                    <input required type="text" name="lastname" value="${user.lastname}"/>
                </td>
            </tr>

            <tr>
                <td><label>gender:</label></td>
                <td>
                    <label style="display: inline">
                        <input style="width: auto" type="radio" name="gender" value="1" ${user.gender == 1 ? 'checked' : ''}/>
                        Male
                    </label>
                    <label style="display: inline">
                        <input style="width: auto" type="radio" name="gender" value="2" ${user.gender == 2 ? 'checked' : ''}/>
                        Female
                    </label>
                </td>
            </tr>

            <tr>
                <td><label>email:</label></td>
                <td>
                    <input required type="email" name="email" value="${user.email}"/>
                </td>
            </tr>

            <tr>
                <td><label>phone:</label></td>
                <td>
                    <input required type="tel" name="phone" value="${user.phone}"/>
                </td>
            </tr>

            <tr>
                <td><label>address:</label></td>
                <td>
                    <textarea required name="address">${user.address}</textarea>
                </td>
            </tr>

            <tr>
                <td><label>level:</label></td>
                <td>
                    <input required type="number" name="level" value="${user.level}"/>
                </td>
            </tr>

            <tr>
                <td><label>image:</label></td>
                <td>
                    <input required type="text" name="image" value="${user.image}"/>
                </td>
            </tr>

            <tr>
                <td><label>active:</label></td>
                <td>
                    <input type="checkbox" name="active" value="true" ${user.active == true ? 'checked' : ''}/>
                </td>
            </tr>

            <tr>
                <td><label>created_at:</label></td>
                <td>
                    ${user.createdAt}
                </td>
            </tr>

            <tr>
                <td><label>created_by:</label></td>
                <td>
                    ${user.createdBy}
                </td>
            </tr>

            <tr>
                <td><label>updated_at:</label></td>
                <td>
                    ${user.updatedAt}
                </td>
            </tr>

            <tr>
                <td><label>updated_by:</label></td>
                <td>
                    ${user.updatedBy}
                </td>
            </tr>

            <tr>
                <td><label>version:</label></td>
                <td>
                    ${user.version}
                </td>
            </tr>

            <tr>
                <td><label>deleted:</label></td>
                <td>
                    ${user.deleted}
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











