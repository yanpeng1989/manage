<%-- 
    Document   : employment_add
    Created on : 2013-4-12, 15:10:33
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<div class="pageContent">
    <form method="post" action="<c:url value="/module/employ/employment_modify.do" />" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
        <div class="pageFormContent" layoutH="56">
            <p>
                <label>员工编号：</label>
                <input name="employment_id" class="required" type="text" readonly="readonly" size="30" value="${employ.employment_id}"/>
            </p>
            <p>
                <label>员工姓名：</label>
                <input name="employment_name" class="required" type="text" size="30" value="${employ.employment_name}"/>
            </p>
            <p>
                <label>身份证号：</label>
                <input name="id_number" class="required" type="text" size="30" value="${employ.id_number}" alt="请输入身份证号码"/>
            </p>
            <p>
                <label>银行卡号：</label>
                <input name="card_number" class="required" type="text" size="30" value="${employ.card_number}" alt="请输入银行卡号"/>
            </p>
            <p>
                <label>公司名称：</label>
                <input type="hidden" name="orgLookup.company_id" value=""/>
                <input type="hidden" name="orgLookup.company_type" value="${employ.company}"/>
                <input type="text" class="required" name="orgLookup.company_name" value="${employ.company_name}" suggestFields="company_id,company_name,company_type" lookupGroup="orgLookup" />
                <a class="btnLook" href="<c:url value="/module/employ/company_pick.do" />" lookupGroup="orgLookup">查找带回</a>		
            </p>
            <p>
                <label>部门名称：</label>
                <input type="hidden" name="orgLookup.item_id01" value="${employ.department}"/>
                <input type="text" class="required" name="orgLookup.item_name01" value="${employ.department_name}" suggestFields="item_name,item_id" lookupGroup="orgLookup" />
                <a class="btnLook" href="<c:url value="/module/employ/handle_pick.do?type=01" />" lookupGroup="orgLookup">查找带回</a>		
            </p>
            
            <p>
                <label>组 名 称：</label>
                <input type="hidden" name="orgLookup.item_id02" value="${employ.egroup}"/>
                <input type="text" class="required" name="orgLookup.item_name02" value="${employ.group_name}" suggestFields="item_name,item_id" lookupGroup="orgLookup" />
                <a class="btnLook" href="<c:url value="/module/employ/handle_pick.do?type=02" />" lookupGroup="orgLookup">查找带回</a>		
            </p>
            
            <p>
                <label>职务名称：</label>
                <input type="hidden" name="orgLookup.item_id03" value="${employ.job1}"/>
                <input type="text" class="required" name="orgLookup.item_name03" value="${employ.job1_name}" suggestFields="item_name,item_id" lookupGroup="orgLookup" />
                <a class="btnLook" href="<c:url value="/module/employ/handle_pick.do?type=03" />" lookupGroup="orgLookup">查找带回</a>		
            </p>
            <p>
                <label>分配角色：</label>
                <input type="hidden" name="orgLookup.item_id04" value="${employ.role_id}"/>
                <input type="text" class="required" name="orgLookup.item_name04" value="${employ.role_name}" suggestFields="item_name,item_id" lookupGroup="orgLookup" />
                <a class="btnLook" href="<c:url value="/module/employ/handle_pick.do?type=04" />" lookupGroup="orgLookup">查找带回</a>	
            </p>
            <p>
                	
            </p>
            <p>
                <label>备注：</label>
                <textarea name="bz" cols="120" rows="4">${employ.bz}</textarea>	
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
