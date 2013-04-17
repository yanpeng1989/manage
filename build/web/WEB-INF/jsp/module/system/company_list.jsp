<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<form id="pagerForm" method="post" action="<c:url value="/module/main.do" />">
    <input type="hidden" name="status" value="${param.status}">
    <input type="hidden" name="keywords" value="${param.keywords}" />
    <input type="hidden" name="pageNum" value="1" />
    <input type="hidden" name="numPerPage" value="${model.numPerPage}" />
    <input type="hidden" name="orderField" value="${param.orderField}" />
</form>
<div class="pageHeader">
    <form onsubmit="return navTabSearch(this);" action="<c:url value="/module/system/company_list.do" />" method="post">
        <div class="searchBar">
            <!--            <ul class="searchContent">
			<li>
				<label>我的客户：</label>
				<input type="text"/>
			</li>
			<li>
			<select class="combox" name="province">
				<option value="">所有省市</option>
				<option value="北京">北京</option>
				<option value="上海">上海</option>
				<option value="天津">天津</option>
				<option value="重庆">重庆</option>
				<option value="广东">广东</option>
			</select>
			</li>
		</ul>
		-->
            <table class="searchContent">
                <tr>
                    <td>
					公司名：<input type="text" name="name" value="${name}" />
                    </td>
                </tr>
            </table>
            <div class="subBar">
                <ul>
                    <li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
                </ul>
            </div>
        </div>
    </form>
</div>
<div class="pageContent">
    <div class="panelBar">
        <ul class="toolBar">
            <li><a class="add" href="<c:url value="/module/system/company_add.do" />" target="navTab" rel="添加公司"><span>添加公司</span></a></li>
            <li><a class="delete" href="<c:url value="/module/system/company_delete.do?uid={sid_user}" />" target="ajaxTodo" title="确定要删除吗?" rel="删除公司"><span>删除公司</span></a></li>
            <li><a class="edit" href="<c:url value="/module/system/company_update.do?uid={sid_user}" />" target="navTab" rel="修改公司"><span>修改公司</span></a></li>
            <li class="line">line</li>
            <li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
        </ul>
    </div>
    <table class="table" width="100%" layoutH="138">
        <thead>
            <tr>
                <th width="80" orderField="employment_id">公司编号</th>
                <th width="120" orderField="employment_name">公 司 名</th>
                <th width="150">备注</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${company}">
                <tr target="sid_user" rel="${c.id}">
                    <td>${c.type}</td>
                    <td>${c.name}</td>
                    <td>${c.bz}</td>
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
            <span>条，共<c:out value="${fn:length(company)}"></c:out>条</span>
            </div>
            <div class="pagination" targetType="navTab" totalCount="<c:out value="${fn:length(company)}"></c:out>" numPerPage="1" pageNumShown="10" currentPage="1"></div>
    </div>
</div>

