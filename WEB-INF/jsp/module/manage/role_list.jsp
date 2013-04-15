<%-- 
    Document   : role
    Created on : 2013-4-8, 15:59:31
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<form id="pagerForm" method="post" action="<c:url value="/module/manage/role_list.do" />">
    <input type="hidden" name="status" value="${param.status}">
    <input type="hidden" name="keywords" value="${param.keywords}" />
    <input type="hidden" name="pageNum" value="1" />
    <input type="hidden" name="numPerPage" value="${model.numPerPage}" />
    <input type="hidden" name="orderField" value="${param.orderField}" />
</form>

<div class="pageHeader">
    <form onsubmit="return navTabSearch(this);" action="<c:url value="/module/manage/role_list.do" />" method="post">
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td>
					角色名：<input type="text" name="role_name" value="${role_name}" />
                    </td>
                </tr>
            </table>
            <div class="subBar">
                <ul>
                    <li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
<!--                    <li><a class="button" href="demo_page6.html" target="dialog" mask="true" title="查询框"><span>高级检索</span></a></li>-->
                </ul>
            </div>
        </div>
    </form>
</div>
<div class="pageContent">
    <div class="panelBar">
        <ul class="toolBar">
            <li><a class="add" href="<c:url value="/module/manage/role_modify.do?type=insert" />" target="navTab" rel="添加角色"><span>添加角色</span></a></li>
            <li><a class="delete" href="<c:url value="/module/manage/role_delete.do?role_id={role_id}" />" target="ajaxTodo" title="确定要删除吗?"><span>删除角色</span></a></li>
            <li><a class="edit" href="<c:url value="/module/manage/role_modify.do?type=update&role_id={role_id}" />" target="navTab" rel="修改角色"><span>修改角色</span></a></li>
            <li class="line">line</li>
        </ul>
    </div>
    <table class="table" width="100%" layoutH="138">
        <thead>
            <tr>
                <th width="80" orderField="role_id">角色编号</th>
                <th width="120" orderField="role_name">角色名称</th>
                <th width="100">角色权限</th>
                <th width="100">备注</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="role" items="${roles}">
                <tr target="role_id" rel="${role.role_id}">
                    <td>${role.role_id}</td>
                    <td>${role.role_name}</td>
                    <td>${role.menu_names}</td>
                    <td>${role.bz}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="panelBar">
        <div class="pages">
            <span>显示</span>
            <select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
                <option value="20">20</option>
                <option value="50">50</option>
                <option value="100">100</option>
                <option value="200">200</option>
            </select>
            <span>条，共<c:out value="${fn:length(roles)}"></c:out>条</span>
        </div>
        <div class="pagination" targetType="navTab" totalCount="" numPerPage="1" pageNumShown="10" currentPage="1"></div>

    </div>
</div>

