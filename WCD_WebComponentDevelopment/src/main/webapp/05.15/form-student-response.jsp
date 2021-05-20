<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP</title>
</head>
<body>
<h1>
    Form student response
</h1>
<br/>

<jsp:include page="../components/menu.jsp"/>

<p>
    The student is: ${param.firstname} ${param.lastname}
</p>

<p>
    The country is: ${param.country}
</p>

<p>
    Favorite Programming Languages:
    <ul>
        <%
            String[] programming_languages = request.getParameterValues("programming_languages[]");

            for (String programming_language : programming_languages) {
                out.print("<li>" + programming_language + "</li>");
            }
        %>
    </ul>
</p>

</body>
</html>