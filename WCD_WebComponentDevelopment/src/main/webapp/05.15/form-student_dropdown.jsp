<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP</title>
</head>
<body>
<h1>
    Form student dropdown
</h1>
<br/>

<jsp:include page="../components/menu.jsp"/>


<form action="form-student-response.jsp">
    <label>First name:</label>
    <input type="text" name="firstname">
    <br>
    <br>
    <label>Last name:</label>
    <input type="text" name="lastname">
    <br>
    <br>
    <label>Country:</label>
    <select name="country" id="country">
        <option value="">-- Select country --</option>
        <option>Viet Nam</option>
        <option>Japan</option>
        <option>Korea</option>
    </select>
    <br>
    <br>
    <button type="submit">Submit</button>
</form>

</body>
</html>