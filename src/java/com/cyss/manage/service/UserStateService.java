/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.service;

import com.cyss.manage.dao.EmploymentDao;
import com.cyss.manage.util.StringUtil;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class UserStateService {

    @Resource
    private EmploymentDao employmentDao;

    /**
     * 
     * @param username
     * @param password
     * @return 1: 是否成功 true|false 2：用户实例 map 3：提示
     */
    public List<Object> checkLogin(String username, String password) {
        List<Object> list = new LinkedList<Object>();
        String tip = "";
        if (StringUtil.stringIsNullOrEmpty(username)) {
            tip = "用户名不可为空";
        }
        if (StringUtil.stringIsNullOrEmpty(password)) {
            tip = "密码不可为空";
        }
        if (!StringUtil.stringIsNullOrEmpty((tip))) {
            list.add(false);
            list.add(null);
            list.add(tip);
            return list;
        }
        Map<String, Object> em = employmentDao.getAEmploymentByUsername(username);
        if (em != null) {
            String t_password = em.get("password").toString();
            if (!password.equals(t_password)) {
                tip = "密码不正确";
            }
        } else {
            tip = "该用户不存在";
        }
        list.add(StringUtil.stringIsNullOrEmpty(tip));
        list.add(em);
        list.add(tip);
        return list;
    }
    
    public List<Map<String, Object>> getAllEmployment(){
        return employmentDao.getAllEmployment();
    }

    /**
     * @return the employmentDao
     */
    public EmploymentDao getEmploymentDao() {
        return employmentDao;
    }

    /**
     * @param employmentDao the employmentDao to set
     */
    public void setEmploymentDao(EmploymentDao employmentDao) {
        this.employmentDao = employmentDao;
    }
}
