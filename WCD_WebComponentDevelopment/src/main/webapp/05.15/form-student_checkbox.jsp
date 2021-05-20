<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP</title>
</head>
<body>
<h1>
    Form student checkbox
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

    <label>Programming Languages:</label>

    <input type="checkbox" name="programming_languages[]" id="Java" value="Java">
    <label for="Java">Java</label> |
    <input type="checkbox" name="programming_languages[]" id="C_Sharp" value="C_Sharp">
    <label for="C_Sharp">C_Sharp</label> |
    <input type="checkbox" name="programming_languages[]" id="PHP" value="PHP">
    <label for="PHP">PHP</label> |
    <input type="checkbox" name="programming_languages[]" id="Ruby" value="Ruby">
    <label for="Ruby">Ruby</label> |

    <br>
    <br>
    <button type="submit">Submit</button>
</form>

</body>
</html>