<%@ page import="java.util.List" %>
<%@ page import="com.example.WCD_WebComponentDevelopment.Date_05_25.Customer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP</title>
</head>
<body>
<h1>
    JSTL_Customer
</h1>
<br/>

<jsp:include page="../components/menu.jsp"/>

<%
    List<Customer> customers = Arrays.asList(
            new Customer("John", "Doe", false),
            new Customer("Maxwell", "Johnson", false),
            new Customer("Mary", "Public", true)
    );

    /*List<Customer> customers = new ArrayList<>();
    customers.add(new Customer("Maxwell", "Johnson", false));*/

    request.setAttribute("customers", customers);
    //pageContext.setAttribute("customers", customers);
%>

<table border="1">
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Gold Customer</th>
    </tr>
    <c:forEach var="customer" items="${customers}">
        <tr>
            <td>${customer.firstname}</td>
            <td>${customer.lastname}</td>
            <td>
                <c:if test="${customer.goldCustomer}">
                    Special Discount
                </c:if>
                <c:if test="${!customer.goldCustomer}">
                    no soup for you!
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>