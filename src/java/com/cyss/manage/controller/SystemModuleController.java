/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.controller;

import com.cyss.manage.service.SystemParameterService;
import com.cyss.manage.util.StringUtil;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Administrator
 */
@Controller
public class SystemModuleController {

    @Resource
    public SystemParameterService systemParameterService;

    @RequestMapping(value = "/module/system/{rootPath}", method = RequestMethod.GET)
    public String get(HttpServletRequest request, Map map, @PathVariable("rootPath") String rootPath) {
        return "/module/system/" + rootPath;
    }

    @RequestMapping(value = "/module/system/company_list", method = {RequestMethod.GET, RequestMethod.POST})
    public void companyList(HttpServletRequest request, Map map) {
        String name = request.getParameter("name");
        List<Map<String, Object>> company = null;
        if (StringUtil.stringIsNullOrEmpty(name)) {
            company = systemParameterService.getAllCompany();
        } else {
            company = systemParameterService.getAllCompanyByName(name);
            request.setAttribute("name", name);
        }

        request.setAttribute("company", company);
    }

    @RequestMapping(value = "/module/system/tip", method = {RequestMethod.GET, RequestMethod.POST})
    public void tip(HttpServletRequest request, Map map) {
        String msg = request.getParameter("msg");
        request.setAttribute("msg", msg);
    }

    @RequestMapping(value = "/module/system/para_pick", method = {RequestMethod.GET, RequestMethod.POST})
    public void paraPick(HttpServletRequest request, Map map) {
        String type = request.getParameter("type");
        String data = request.getParameter("data");
        List<Map<String, Object>> para = systemParameterService.getAllParameter(type);
        request.setAttribute("departments", para);
        request.setAttribute("type", type);
        request.setAttribute("data", data);
    }

    @RequestMapping(value = "/module/system/group_config", method = {RequestMethod.GET, RequestMethod.POST})
    public void groupConif(HttpServletRequest request, Map map) {
        String type = request.getParameter("type");
        String json = request.getParameter("json");
        String id = request.getParameter("id");
        List<Map<String, Object>> para = systemParameterService.getAllParameter(type);
        request.setAttribute("group", para);
        request.setAttribute("type", type);
        request.setAttribute("json", json);
        request.setAttribute("id", id);
    }

    @RequestMapping(value = "/module/system/company_insert", method = {RequestMethod.GET, RequestMethod.POST})
    public void companyInsert(HttpServletRequest request, PrintWriter out) {
        String departmentIds = request.getParameter("orgLookup.department_id");
        String bz = request.getParameter("bz");
        String name = request.getParameter("name");
        String groupValue = request.getParameter("orgLookup.group_value");
        systemParameterService.insertIntoCompany(name, departmentIds, groupValue, bz);
        out.write(StringUtil.getDoneJson("200", "公司参数管理", "公司参数管理", "/manage/module/system/company_list.do", "操作成功"));
    }

    @RequestMapping(value = "/module/system/company_update", method = {RequestMethod.GET, RequestMethod.POST})
    public void companyUpdate(HttpServletRequest request, Map map) {
        String uid = request.getParameter("uid");
        Map<String, Object> com = systemParameterService.getCompany(uid);
        request.setAttribute("company", com);
    }

    @RequestMapping(value = "/module/system/company_modify", method = {RequestMethod.GET, RequestMethod.POST})
    public void companyModify(HttpServletRequest request, PrintWriter out) {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        String departmentIds = request.getParameter("orgLookup.department_id");
        String bz = request.getParameter("bz");
        String name = request.getParameter("name");
        String groupValue = request.getParameter("orgLookup.group_value");
        systemParameterService.updateCompany(id, type, name, departmentIds, groupValue, bz);
        out.write(StringUtil.getDoneJson("200", "公司参数管理", "公司参数管理", "/manage/module/system/company_list.do", "操作成功"));
    }
    
    @RequestMapping(value = "/module/system/company_delete", method = {RequestMethod.GET, RequestMethod.POST})
    public void companyDelete(HttpServletRequest request, PrintWriter out) {
        String uid = request.getParameter("uid");
        systemParameterService.deleteCompany(uid);
        out.write(StringUtil.getDoneJson("200", "公司参数管理", "公司参数管理", "/manage/module/system/company_list.do", "操作成功"));
    }
}
