/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.service;

import com.cyss.manage.dao.CompanyDao;
import com.cyss.manage.dao.CompanyDescDao;
import com.cyss.manage.util.StringUtil;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class SystemParameterService {

    @Resource
    public CompanyDao companyDao;
    @Resource
    public CompanyDescDao companyDescDao;

    public List<Map<String, Object>> getAllCompany() {
        return companyDao.getAllCompany();
    }
    
    public List<Map<String, Object>> getAllCompanyByName(String name) {
        return companyDao.getAllCompanyByName(name);
    }

    public List<Map<String, Object>> getAllParameter(String type) {
        return companyDescDao.getListByType(type);
    }

    public Map<String, Object> getCompany(String id) {
        Map<String, Object> com = companyDao.getCompanyById(id);
        String department = com.get("department").toString();
        String[] arr = department.split(",");
        String departmentName = "";
        for (String s : arr) {
            departmentName += companyDescDao.getCompanyDescById(s).get("name") + ",";
        }
        departmentName = departmentName.substring(0, departmentName.length() - 1);
        com.put("department_name", departmentName);
        return com;
    }

    private String resetJsonObj(String json, String departIds) {
        JSONObject obj = null;
        List<String> temp = new ArrayList<String>();
        try {
            obj = new JSONObject(json);
            Iterator<String> it = obj.keys();
            while (it.hasNext()) {
                String key = it.next().toString();
                if (departIds.indexOf(key) == -1) {
                    temp.add(key);
                }
            }
            for (String t : temp) {
                obj.remove(t);
            }
        } catch (JSONException ex) {
            ex.printStackTrace();
        }
        return obj.toString();
    }

    public void insertIntoCompany(String name, String departIds, String json, String bz) {
        Map<String, Object> com = companyDao.getMaxTypeCompany();
        int tid = Integer.parseInt(com.get("id").toString()) + 1;
        String type = StringUtil.fillStrBefore(tid + "", 2, '0');
        companyDao.addCompany(type, name, departIds, resetJsonObj(json, departIds), bz);
    }

    public void updateCompany(String id, String type, String name, String departIds, String json, String bz) {
        companyDao.updateCompany(id, name, departIds, resetJsonObj(json, departIds), bz);
    }
    
    public void deleteCompany(String id) {
        companyDao.deleteCompany(id);
    }
}
