/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.service;

import com.cyss.manage.dao.MenuDao;
import com.cyss.manage.dao.RoleDao;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class MainPageService extends BaseService {
    @Resource(name="menuDao") 
    private MenuDao menuDao;
    
    @Resource
    private RoleDao roleDao;

    public List<Map<String, Object>> getAllMenuByLimit(String roleId) {
        List<Map<String, Object>> menu = menuDao.getMenuByIds(roleDao.getRoleById(roleId).get("power").toString());
        return menu;
    }
    
    public List<Map<String, Object>> getAllMenu() {
        List<Map<String, Object>> menu = menuDao.getAllMenu();
        return menu;
    }

    /**
     * @return the menuDao
     */
    public MenuDao getMenuDao() {
        return menuDao;
    }

    /**
     * @param menuDao the menuDao to set
     */
    public void setMenuDao(MenuDao menuDao) {
        this.menuDao = menuDao;
    }
}
