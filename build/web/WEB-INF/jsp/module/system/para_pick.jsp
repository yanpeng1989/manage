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

<table class="table" layoutH="138" targetType="dialog" width="100%">
    <thead>
        <tr>
            <th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
            <th>${title}名称</th>
            <th>${title}编号</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="department" items="${departments}">
            <tr>
                <td><input class="t_cb" name="ids" value1="${department.id}" value2="${department.name}" type="checkbox" /></td>
                <td>${department.name}</td>
                <td>${department.id}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="panelBar">
    <div class="pages">
        <span>共${fn:length(departments)}条</span>
    </div>
    <div class="pagination" targetType="dialog" totalCount="${fn:length(departments)}" numPerPage="0" pageNumShown="1" currentPage="1"></div>
</div>
<div class="formBar">
    <ul>
        <li><a class="buttonActive" href=""><span>保存</span></a></li>
        <li>
            <div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
        </li>
    </ul>
</div>
<script type="text/javascript">
    var data = "${data}";
    
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
    
    $('.buttonActive').click(function(){
        var name = "";
        var ids = "";
        $(".t_cb").each(function(i){
            if($(this).attr("checked")){
                var val1 = $(this).attr("value1");
                var val2 = $(this).attr("value2");
                ids += val1 + ",";
                name += val2 + ",";
            }
        });
        ids = ids.substr(0, ids.length-1);
        name = name.substr(0, name.length-1);
        $(this).attr("href","javascript:$.bringBack({department_name:'"+name+"', department_id:'"+ids+"'})");
    });
    
    $(".t_cb").each(function(i){
        if(data.indexOf($(this).attr("value1")) != -1){
            $(this).attr("checked", "checked");
        }
    });
</script>