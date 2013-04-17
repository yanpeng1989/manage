/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.controller;

import com.cyss.manage.service.EmploymentService;
import com.cyss.manage.service.MainPageService;
import com.cyss.manage.service.UserStateService;
import com.cyss.manage.util.StringUtil;
import com.cyss.manage.util.SystemUtil;
import java.io.PrintWriter;
import java.util.HashMap;
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
public class EmployModuleController {

    @Resource
    public MainPageService mainPageService;
    @Resource
    public UserStateService userStateService;
    @Resource
    public EmploymentService employmentService;

    @RequestMapping(value = "/module/employ/{rootPath}", method = RequestMethod.GET)
    public String get(HttpServletRequest request, Map map, @PathVariable("rootPath") String rootPath) {
//        for (String key : request.getParameterMap().keySet()) {
//            String[] values = request.getParameterMap().get(key);
//            String value = StringUtil.arrayConnectByChar(values, ',');
//            request.setAttribute(key, value.substring(0, value.length() - 1));
//        }
        return "/module/employ/" + rootPath;
    }

    @RequestMapping(value = "/module/employ/employment_list", method = {RequestMethod.GET, RequestMethod.POST})
    public void employmentList(HttpServletRequest request, Map map) {
        request.setAttribute("users", employmentService.getEmploymentListInUse());
    }

    @RequestMapping(value = "/module/employ/company_pick", method = {RequestMethod.GET, RequestMethod.POST})
    public void companyPick(HttpServletRequest request, Map map) {
        request.setAttribute("companys", employmentService.getCompanyPickerList());
    }

    @RequestMapping(value = "/module/employ/handle_pick", method = {RequestMethod.GET, RequestMethod.POST})
    public void handlePick(HttpServletRequest request, Map map) {
        String type = request.getParameter("type");
        request.setAttribute("items", employmentService.getHandlePickerList(type));
        request.setAttribute("type", type);
    }

    @RequestMapping(value = "/module/employ/employment_insert", method = {RequestMethod.GET, RequestMethod.POST})
    public void employmentInsert(HttpServletRequest request, PrintWriter out) {
        Map<String, Object> map = SystemUtil.fillRequest(request);
        employmentService.addEmployment(map);
        out.write(StringUtil.getDoneJson("200", "人员基本信息管理", "人员基本信息管理", "/manage/module/employ/employment_list.do", "操作成功"));
    }

    @RequestMapping(value = "/module/employ/employment_update", method = {RequestMethod.GET, RequestMethod.POST})
    public void employmentUpdate(HttpServletRequest request, Map map) {
        String Eid = request.getParameter("uid");
        request.setAttribute("employ", employmentService.getEmployMentById(Eid));
    }
    
    @RequestMapping(value = "/module/employ/employment_modify", method = {RequestMethod.GET, RequestMethod.POST})
    public void employmentModify(HttpServletRequest request, PrintWriter out) {
        Map<String, Object> map = SystemUtil.fillRequest(request);
        employmentService.modifyEmployment(map);
        out.write(StringUtil.getDoneJson("200", "人员基本信息管理", "人员基本信息管理", "/manage/module/employ/employment_list.do", "操作成功"));
    }

    @RequestMapping(value = "/module/employ/employment_delete", method = {RequestMethod.GET, RequestMethod.POST})
    public void employmentDelete(HttpServletRequest request, PrintWriter out) {
        String Eid = request.getParameter("uid");
        employmentService.deleteEmployMentById(Eid);
        out.write(StringUtil.getDoneJson("200", "人员基本信息管理", "人员基本信息管理", "/manage/module/employ/employment_list.do", "操作成功"));
    }
}
