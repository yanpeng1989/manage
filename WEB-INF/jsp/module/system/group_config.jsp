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
    <table class="table" layoutH="168" targetType="dialog" width="100%">
        <thead>
            <tr>
                <th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
                <th>组 名 称</th>
                <th>组 编 号</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="g" items="${group}">
                <tr>
                    <td><input class="t_cb" name="ids" value1="${g.id}" value2="${g.name}" type="checkbox" /></td>
                    <td>${g.name}</td>
                    <td>${g.id}</td>
                </tr>
            </c:forEach>

        </tbody>
    </table>

    <div class="panelBar">
        <div class="pages">
            <span>共${fn:length(group)}条</span>
        </div>
        <div class="pagination" targetType="dialog" totalCount="${fn:length(group)}" numPerPage="0" pageNumShown="1" currentPage="1"></div>
    </div>
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
    var json = eval('(${json})');
    var id = "${id}";
    var group = json[id];
    
    if(group != ""){
        var arr = group.split(",");
        $(".t_cb").each(function(i){
             var val1 = $(this).attr("value1");
             for(var i=0;i<group.length;i++){
                 if(val1 == group[i]){
                     $(this).attr("checked", "checked");
                 }
             }
        });
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
        json[id] = ids;
        $(this).attr("href","javascript:$.bringBack({group_value:'"+JSON.stringify(json)+"'})");
        alertMsg.info("设置成功");
    });
</script>