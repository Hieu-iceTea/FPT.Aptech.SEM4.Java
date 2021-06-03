<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<base href="<c:url value="/"/>">

<c:if test="${sessionScope.isLoggedIn}">
    <div>
        <span>Welcome, <b style="background-color: greenyellow; padding: 5px; border-radius: 10%">${sessionScope.user.username}</b></span>

        <form style="display: inline" action="logout" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>
</c:if>

<c:if test="${!sessionScope.isLoggedIn}">
    <div>
        <a style="background-color: greenyellow; padding: 5px; border-radius: 10%" href="login">Login</a>
    </div>
</c:if>

<hr>

<br>

Default:
<a href="index.jsp">Home</a> |
<a href="hello-servlet">Hello Servlet</a>
<br>

Start:
<a href="hello/expression.jsp">Expression</a> |
<a href="hello/scriptlet.jsp">Scriptlet</a>
<br>

15/05:
<a href="05.15/userAgent.jsp">User agent</a> |
<a href="05.15/form-student.jsp">Form student</a> |
<a href="05.15/form-student_dropdown.jsp">Form student dropdown</a> |
<a href="05.15/form-student_checkbox.jsp">Form student checkbox</a> |
<a href="05.15/session-form-task_list.jsp">Session form task_list</a>
<br>

20/05:
<a href="05.20/cookie.jsp">Cookie</a> |
<br>

22/05:
<a href="05_22/Hello-Servlet-Date">Hello-Servlet-Date</a> |
<a href="05_22/form-student-servlet.jsp">Servlet-Form-Student</a> |
<a href="05_22/JSTL_c_forEach.jsp">JSTL_c_forEach</a>
<br>

22/05:
<a href="05_25/JSTL_Customer.jsp">JSTL_Customer</a>
<br>

MVC_First_Demo:
<a href="task">Task</a>
<br>

First_TestConnectionDatabase:
<a href="test-connection-database">TestConnectionDatabase</a>
<br>

JDBC_MySQL:
<a href="05_25_JDBC_MySQL/test.jsp">test.jsp</a> |
<a href="JDBC_MySQL/test-servlet">test-servlet</a> |
<a href="JDBC_MySQL/test-servlet-use-model">test-servlet-use-model</a> |
<a href="JDBC_MySQL/test-servlet-use-model-use-utility">test-servlet-use-model-use-utility</a>
<br>

MVC_Demo:
<a href="user">User</a> |
<a href="user/demo-crud">User/demo-crud</a>
<br>

Assignment:
<a href="product-menu">Product Menu</a>
<br>

Assignment:
<a href="english-vocabulary">English Vocabulary</a>

<hr/>
<br>