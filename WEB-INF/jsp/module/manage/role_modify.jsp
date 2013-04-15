<%-- 
    Document   : role_modify
    Created on : 2013-4-8, 17:20:40
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<div class="page">
    <div class="pageContent">
        <form method="post" action="<c:url value="/module/manage/role_${type}.do" />" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
            <div class="pageFormContent" layoutH="56">
                <p>
                    <label>角色名称：</label>
                    <input name="role_name" class="required" type="text" size="30" value="${role.role_name}" />
                    
                </p>
                <p>
                    <input id="tpower" type="hidden" name="tpower" />
                    <input id="role_id" type="hidden" name="role_id" value="${role.role_id}" />
                </p>
                <p>
                    <label>备注：</label>
                    <textarea name="bz" cols="80" rows="2">${role.bz}</textarea>
                </p>
                <br /><br /><br /><br /><br /><br /><br /><br /><br />
                <label>分配权限：</label>
                <ul class="tree treeFolder treeCheck expand" oncheck="powerClick">
                    <c:forEach var="menu_item" items="${menu}">
                        <c:if test="${menu_item.pm_id == 0}">
                            <li><a tname="power" tvalue="${menu_item.menu_id}">${menu_item.menu_name}</a>
                                <ul>
                                    <c:forEach items="${menu}" var="menu_item1">
                                        <c:if test="${menu_item1.pm_id == menu_item.menu_id}">
                                            <li><a tname="power" tvalue="${menu_item1.menu_id}" <c:if test="${fn:indexOf(power, menu_item1.menu_id) != -1}">checked="true"</c:if>>${menu_item1.menu_name}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>

            </div>
            <div class="formBar">
                <ul>
                    <li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
                    <li>
                        <div class="button"><div class="buttonContent"><button type="Button" onclick="navTab.closeCurrentTab()">取消</button></div></div>
                    </li>
                </ul>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    function powerClick(){
        var res = "";
        $("div[class='ckbox checked']").each(function(){
            res += $(this).find("input").attr("value") + ",";
        });
        
        $("div[class='ckbox indeterminate']").each(function(){
            res += $(this).find("input").attr("value") + ",";
        });
        res = res.substr(0, res.length - 1);
        $("#tpower").val(res);
    }
    $("#tpower").val("${power}");
</script>