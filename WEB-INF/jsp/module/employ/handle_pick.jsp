<%-- 
    Document   : company_pick
    Created on : 2013-4-12, 15:27:01
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="title" value="" scope="page"></c:set>
<c:if test="${type eq '01'}"><c:set var="title" value="部门"></c:set></c:if>
<c:if test="${type eq '02'}"><c:set var="title" value="组"></c:set></c:if>
<c:if test="${type eq '03'}"><c:set var="title" value="职务"></c:set></c:if>
<c:if test="${type eq '03'}"><c:set var="title" value="角色"></c:set></c:if>
<div class="pageHeader">

</div>
<div class="pageContent">
    <table class="table" layoutH="138" targetType="dialog" width="100%">
        <thead>
            <tr>
                <th>${title}名称</th>
                <th>${title}编号</th>
                <th width="80">查找带回</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${items}">
                <tr>
                    <td>${item.name}</td>
                    <td class="item_id_t">${item.id}</td>
                    <td>
                        <a class="btnSelect" href="javascript:$.bringBack({item_name${type}:'${item.name}', item_id${type}:'${item.id}'})" title="查找带回">选择</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="panelBar">
        <div class="pages">
            <span>共${fn:length(items)}条</span>
        </div>
        <div class="pagination" targetType="dialog" totalCount="${fn:length(items)}" numPerPage="0" pageNumShown="1" currentPage="1"></div>
    </div>
</div>
<script type="text/javascript">
    function fillStrBefore(str, len, c){
        var temp = "";
        if(str.length < len){
            for(var i=0;i<len-str.length;i++){
                temp += c;
            }
            temp += str;
        } else {
            return str;
        }
        return temp;
    }
    
    $(".item_id_t").each(function(i){
        var temp = $(this).html();
        $(this).html(fillStrBefore(temp, 3, '0'));
    });
</script>