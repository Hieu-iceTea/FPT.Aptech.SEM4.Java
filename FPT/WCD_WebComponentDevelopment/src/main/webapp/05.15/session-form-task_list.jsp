<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP</title>
</head>
<body>
<h1>
    Session form task_list
</h1>
<br/>

<jsp:include page="../components/menu.jsp"/>


<form method="post">
    <label>Task name:</label>
    <input type="text" name="task">
    <button type="submit">Add</button>
</form>

<%--Add session--%>
<%
    List<String> taskList = (List<String>) session.getAttribute("taskList");
    if (taskList == null) {
        taskList = new ArrayList<>();
        session.setAttribute("taskList", taskList);
    }

    String task = request.getParameter("task");
    if (task != null && !task.equals("")) {
        taskList.add(task);
    }

    //session.setAttribute("taskList", taskList);
%>

<%--Get session--%>
<p>
    Task list:
<ul>
    <%
        for (String item : taskList) {
            out.print("<li>" + item + "</li>");
        }
    %>
</ul>
</p>


</body>
</html>