/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.service;

import com.cyss.manage.dao.CompanyDao;
import com.cyss.manage.dao.CompanyDescDao;
import com.cyss.manage.dao.EmploymentDao;
import com.cyss.manage.dao.RoleDao;
import com.cyss.manage.util.DateUtil;
import com.cyss.manage.util.StringUtil;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * 
 *
 * @author Administrator
 */
@Service
public class EmploymentService {

    @Resource
    public CompanyDao companyDao;
    @Resource
    public CompanyDescDao companyDescDao;
    @Resource
    public EmploymentDao employmentDao;
    @Resource
    public RoleDao roleDao;

    public List<Map<String, Object>> getEmploymentListInUse() {
        return employmentDao.getAllEmploymentInUse();
    }

    public List<Map<String, Object>> getCompanyPickerList() {
        return companyDao.getAllCompany();
    }

    public List<Map<String, Object>> getHandlePickerList(String type) {
//        List<Map<String, Object>> list = companyDescDao.getListByType(type);
//        for(Map<String, Object> map : list){
//            String id = map.get("id").toString();
//            map.remove("id");
//            map.put("id", StringUtil.fillStrBefore(id, 3, '0'));
//        }
        if ("04".equals(type)) {
            return roleDao.getAllRolePick();
        }
        return companyDescDao.getListByType(type);
    }

    public Map<String, Object> getEmployMentById(String Eid) {
        Map<String, Object> employ = employmentDao.getAEmploymentByEId(Eid);
        employ.put("company_name", companyDao.getCompanyByType(employ.get("company").toString()).get("name"));
        employ.put("department_name", companyDescDao.getCompanyDescById(employ.get("department").toString()).get("name"));
        employ.put("group_name", companyDescDao.getCompanyDescById(employ.get("egroup").toString()).get("name"));
        employ.put("job1_name", companyDescDao.getCompanyDescById(employ.get("job1").toString()).get("name"));
        employ.put("role_name", roleDao.getRoleById(employ.get("role_id").toString()).get("role_name"));
        return employ;
    }

    public void deleteEmployMentById(String Eid) {
        employmentDao.deleteEmployment(Eid);
    }

    public String addEmployment(Map employment) {
        String tip = "";
        String name = employment.get("employment_name").toString();
        String sfzh = employment.get("id_number").toString();
        String card = employment.get("card_number").toString();
        String bz = employment.get("bz").toString();
        String company = employment.get("orgLookup.company_type").toString();
        String item01 = StringUtil.fillStrBefore(employment.get("orgLookup.item_id01").toString(), 3, '0');
        String item02 = StringUtil.fillStrBefore(employment.get("orgLookup.item_id02").toString(), 3, '0');
        String item03 = StringUtil.fillStrBefore(employment.get("orgLookup.item_id03").toString(), 3, '0');
        String item04 = StringUtil.fillStrBefore(employment.get("orgLookup.item_id04").toString(), 3, '0');
        String id = company + item01 + item02 + item03 + DateUtil.getDateSequence();
        employmentDao.insertEmployment(id, name, card, sfzh, company, Integer.parseInt(item01), Integer.parseInt(item02), Integer.parseInt(item03), Integer.parseInt(item04), bz);
        return tip;
    }

    public String modifyEmployment(Map employment) {
        String tip = "";
        String name = employment.get("employment_name").toString();
        String sfzh = employment.get("id_number").toString();
        String card = employment.get("card_number").toString();
        String bz = employment.get("bz").toString();
        String company = employment.get("orgLookup.company_type").toString();
        String item01 = StringUtil.fillStrBefore(employment.get("orgLookup.item_id01").toString(), 3, '0');
        String item02 = StringUtil.fillStrBefore(employment.get("orgLookup.item_id02").toString(), 3, '0');
        String item03 = StringUtil.fillStrBefore(employment.get("orgLookup.item_id03").toString(), 3, '0');
        String item04 = StringUtil.fillStrBefore(employment.get("orgLookup.item_id04").toString(), 3, '0');
        String id = employment.get("employment_id").toString();
        employmentDao.updateEmploymentJob1(id, name, card, sfzh, company, Integer.parseInt(item01), Integer.parseInt(item02), Integer.parseInt(item03), Integer.parseInt(item04), bz);
        return tip;
    }
}
