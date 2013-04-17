/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.controller;

import com.cyss.manage.service.MainPageService;
import com.cyss.manage.service.PowerService;
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
public class ManageModuleController {

    @Resource
    public PowerService powerService;
    @Resource
    public MainPageService mainPageService;

    @RequestMapping(value = "/module/manage/power", method = {RequestMethod.POST, RequestMethod.GET})
    public void power(HttpServletRequest request, Map map) {
    }

    @RequestMapping(value = "/module/manage/role_{subPath}", method = {RequestMethod.POST, RequestMethod.GET})
    public String role(HttpServletRequest request, Map map, @PathVariable("subPath") String subPath) {
        if ("list".equals(subPath)) {
            String roleName = request.getParameter("role_name");
            List<Map<String, Object>> roles = powerService.getRoleList(roleName);
            request.setAttribute("roles", roles);
            request.setAttribute("role_name", roleName);
        } else if ("modify".equals(subPath)) {
            String roleId = request.getParameter("role_id");
            String type = request.getParameter("type");
            request.setAttribute("menu", mainPageService.getAllMenu());
            request.setAttribute("type", type);
            if (!StringUtil.stringIsNullOrEmpty(roleId)) {
                request.setAttribute("role", powerService.getRoleById(roleId));
                request.setAttribute("power", powerService.getPowerByRoleId(roleId));
            }
        }
        return "/module/manage/role_" + subPath;
    }

    @RequestMapping(value = "/module/manage/role_insert", method = {RequestMethod.POST, RequestMethod.GET})
    public void roleInsert(HttpServletRequest request, PrintWriter out) {
        String roleName = request.getParameter("role_name");
        String power = request.getParameter("tpower");
        String bz = request.getParameter("bz");
        if(StringUtil.stringIsNullOrEmpty(power)){
            out.write(StringUtil.getDoneJson("300", "", "", "", "需分配至少一个权限"));
            return;
        }
        String tip = powerService.addRole(roleName, power, bz);
        if (StringUtil.stringIsNullOrEmpty(tip)) {
            out.write(StringUtil.getDoneJson("200", "角色管理", "角色管理", "/manage/module/manage/role_list.do", "操作成功"));
        } else {
            out.write(StringUtil.getDoneJson("300", "", "", "", tip));
        }
    }

    @RequestMapping(value = "/module/manage/role_update", method = {RequestMethod.POST, RequestMethod.GET})
    public void roleUpdate(HttpServletRequest request, PrintWriter out) {
        String roleId = request.getParameter("role_id");
        String roleName = request.getParameter("role_name");
        String power = request.getParameter("tpower");
        String bz = request.getParameter("bz");
        powerService.updateRole(roleId, roleName, power, bz);
        out.write(StringUtil.getDoneJson("200", "角色管理", "角色管理", "/manage/module/manage/role_list.do", "操作成功"));
    }

    @RequestMapping(value = "/module/manage/role_delete", method = {RequestMethod.POST, RequestMethod.GET})
    public void roleDelete(HttpServletRequest request, PrintWriter out) {
        String roleId = request.getParameter("role_id");
        if("1".equals(roleId)){
            out.write(StringUtil.getDoneJson("300", "", "", "", "不可删除超级管理员"));
            return;
        }
        powerService.deleteRole(roleId);
        out.write(StringUtil.getDoneJson("200", "角色管理", "角色管理", "/manage/module/manage/role_list.do", "操作成功"));
    }
}
