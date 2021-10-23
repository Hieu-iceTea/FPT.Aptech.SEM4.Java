<%@ page import="java.util.Date" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Scriptlet</title>
</head>
<body>
<h1><%= "Scriptlet" %>
</h1>
<br/>

<jsp:include page="../components/menu.jsp"/>

<p>
    <%
        for (int i = 0; i < 5; i++) {
            out.println("<br/>Love " + (i + 1));
        }
    %>
</p>

</body>
</html>