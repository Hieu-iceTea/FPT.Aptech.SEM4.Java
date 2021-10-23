<%--
  Created by IntelliJ IDEA.
  User: Hieu_iceTea
  Date: 28/05/2021
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.notification != null}">
    <p>
        <span style="color: midnightblue"><b>Hieu_iceTea said:</b></span>
        <span style="color: green">${sessionScope.notification}</span>
    </p>
</c:if>

<c:remove var="notification" scope="session"/>
