<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - userAgent</title>
</head>
<body>
<h1>
    <%= "userAgent" %>
</h1>
<br/>

<jsp:include page="../components/menu.jsp"/>

<%
    String userAgent = request.getHeader("user-agent");
    String ip = request.getRemoteAddr();
    String browser = "unknown";

    if (userAgent != null) {
        if (userAgent.indexOf("MSIE") > -1) {
            browser = "IE";
        } else if (userAgent.contains("Mozilla")) {
            browser = "Firefox or Chrome";
        }
    }
%>

<p>
    User Agent: <%= userAgent %>
</p>

<p>
    IP: <%= ip %>
</p>

<p>
    Browser: <%= browser %>
</p>

</body>
</html>