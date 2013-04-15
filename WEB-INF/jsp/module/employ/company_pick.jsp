<%-- 
    Document   : company_pick
    Created on : 2013-4-12, 15:27:01
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<div class="pageHeader">

</div>
<div class="pageContent">
    <table class="table" layoutH="138" targetType="dialog" width="100%">
        <thead>
            <tr>
                <th>公司名称</th>
                <th>公司编号</th>
                <th width="80">查找带回</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="company" items="${companys}">
                <tr>
                    <td>${company.name}</td>
                    <td>${company.type}</td>
                    <td>
                        <a class="btnSelect" href="javascript:$.bringBack({company_id:'${company.id}', company_name:'${company.name}', company_type:'${company.type}'})" title="查找带回">选择</a>
                    </td>
                </tr>
            </c:forEach>
            
        </tbody>
    </table>

    <div class="panelBar">
        <div class="pages">
            <span>共${fn:length(company)}条</span>
        </div>
        <div class="pagination" targetType="dialog" totalCount="${fn:length(company)}" numPerPage="0" pageNumShown="1" currentPage="1"></div>
    </div>
</div>
