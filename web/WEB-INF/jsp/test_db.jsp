<%-- 
    Document   : test_db
    Created on : 2013-4-15, 16:55:49
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach var="user" items="${users}">
    <tr target="sid_user" rel="${user.employment_id}">
        <td>${user.employment_id}<br /></td>
        <td>${user.employment_name}<br /></td>
        <td>${user.id_number}<br /></td>
        <td>${user.card_number}<br /></td>
        <td>${user.username}<br /></td>
        <td>${user.create_date}<br /></td>
    </tr>
    <br />-------------------------<br />
</c:forEach>