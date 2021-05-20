<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP</title>
</head>
<body>
<h1>
    Cookie
</h1>
<br/>

<jsp:include page="../components/menu.jsp"/>

<%
    //PrintWriter out = response.getWriter();
    Cookie demoCookie = new Cookie("color", "red");
    demoCookie.setMaxAge(60 * 60 * 24 * 365);
    int setMaxAge = demoCookie.getMaxAge();

    out.println("demoCookie: " + demoCookie.getValue() + "<br>");
    out.println("setMaxAge: " + setMaxAge);
%>

</body>
</html>