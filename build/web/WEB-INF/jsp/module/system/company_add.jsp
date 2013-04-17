<%-- 
    Document   : employment_add
    Created on : 2013-4-12, 15:10:33
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<div class="pageContent">
    <form method="post" action="<c:url value="/module/system/company_insert.do" />" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
        <div class="pageFormContent" layoutH="56">
            <p>
                <label>公 司 名：</label>
                <input name="name" class="required" type="text" size="30" alt="公司名"/>
            </p>
            <p>
                <label>选择拥有部门：</label>
                <input id="department_id" type="hidden" name="orgLookup.department_id" value=""/>
                <input id="department_name" type="text" size="30" class="required" name="orgLookup.department_name" value="" suggestFields="department_id,department_name" lookupGroup="orgLookup" />
                <a id="department_cback" class="btnLook" href="<c:url value="/module/system/para_pick.do?type=01" />" lookupGroup="orgLookup">查找带回</a>	
            </p>
            <p>
                <label>组 配 置：</label>
                <input id="group_value" type="hidden" name="orgLookup.group_value" value=""/>
                <select id="department">
                </select>
                <a id="department_back" class="btnLook" href="" lookupGroup="orgLookup">查找带回</a>	
            </p>
            <p>

            </p>
            <p>
                <label>备注：</label>
                <textarea name="bz" cols="120" rows="4"></textarea>
            </p>
        </div>

        <div class="formBar">
            <ul>
                <!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
                <li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
                <li>
                    <div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
                </li>
            </ul>
        </div>
    </form>
</div>
<script type="text/javascript">
    $('#department').focus(function(){
        var dep = $('#department_name').val();
        var ids = $('#department_id').val();
        var arr1 = dep.split(",");
        var arr2 = ids.split(",");
        var json = {};
        $(this).html("");
        for(var i=0;i<arr1.length;i++){
            $('#department').append('<option value="'+arr2[i]+'">'+arr1[i]+'</option>');
            json[arr2[i]] = "";
        }
        if($("#group_value").val() == undefined || $("#group_value").val()==""){
            $("#group_value").val(JSON.stringify(json));
        } else {
            var t_json = $("#group_value").val();
            var t_obj = eval(t_json);
            for(var key in json){
                if(t_obj[key] != undefined)
                    json[key] = t_obj[key];
            }
            $("#group_value").val(JSON.stringify(json));
        }
    }).change(function(){
        $("#department_back").attr("href", "/manage/module/system/group_config.do?type=02&json="+$("#group_value").val()+"&id="+$(this).val());
    });
    
    $("#department_back").click(function(){
        if($("#department").val() == undefined || $("#department").val()==""){
            $("#department_back").attr("href", "/manage/module/system/tip.do?msg=请选择一个部门");
            return false;
        } else {
            $("#department_back").attr("href", "/manage/module/system/group_config.do?type=02&json="+$("#group_value").val()+"&id="+$("#department").val());
        }
    });
    
    $("#department_cback").click(function(){
        $(this).attr("href", "/manage/module/system/para_pick.do?type=01&data="+$("#department_id").val());
    });
</script>