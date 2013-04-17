/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.service;

import com.cyss.manage.dao.MenuDao;
import com.cyss.manage.dao.RoleDao;
import com.cyss.manage.util.StringUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class PowerService {

    @Resource
    private MenuDao menuDao;
    @Resource
    private RoleDao roleDao;

    public Map<String, Object> getRoleById(String roleId) {
        return roleDao.getRoleById(roleId);
    }

    public List<Map<String, Object>> getRoleList(String roleName) {
        List<Map<String, Object>> roles = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> allRole = null;
        if (StringUtil.stringIsNullOrEmpty(roleName)) {
            allRole = roleDao.getAllRole();
        } else {
            allRole = roleDao.getRolesByName(roleName);
        }
        for (Map<String, Object> role : allRole) {
            List<Map<String, Object>> menus = menuDao.getMenuByIds(role.get("power").toString());
            String menuStr = "";
            int count = 0;
            for (Map<String, Object> menu : menus) {
                menuStr += menu.get("menu_name") + ",";
                if (count > 4) {
                    break;
                }
                count++;
            }
            menuStr = menuStr.substring(0, menuStr.length());
            if (count > 4) {
                menuStr += "...";
            }
            Map<String, Object> nrole = new HashMap<String, Object>(role);
            nrole.put("menu_names", menuStr);
            roles.add(nrole);
        }
        return roles;
    }

    public String getPowerByRoleId(String roleId) {
        return roleDao.getRoleById(roleId).get("power").toString();
    }

    public String addRole(String roleName, String power, String bz) {
        String tip = "";
        Map<String, Object> role = roleDao.getRoleByName(roleName);
        if (role == null) {
            roleDao.insertRole(roleName, power, bz);
        } else {
            tip = "该角色名已存在";
        }
        return tip;
    }

    public String updateRole(String roleId, String roleName, String power, String bz) {
        String tip = "";
        roleDao.updateRole(roleId, roleName, power, bz);
        return tip;
    }

    public String deleteRole(String roleId) {
        String tip = "";
        roleDao.deleteRole(roleId);
        return tip;
    }
}
