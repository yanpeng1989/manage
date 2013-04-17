/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.dao;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Administrator
 */
@Repository
public class CompanyDao {

    @Resource
    JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> getAllCompany() {
        return jdbcTemplate.queryForList("select * from company");
    }

    public List<Map<String, Object>> getAllCompanyByName(String name) {
        return jdbcTemplate.queryForList("select * from company where name like ?", "%" + name + "%");
    }

    public Map<String, Object> getCompanyByType(String type) {
        return jdbcTemplate.queryForMap("select * from company where type=?", type);
    }

    public Map<String, Object> getCompanyById(String id) {
        return jdbcTemplate.queryForMap("select * from company where id=?", Integer.parseInt(id));
    }

    public Map<String, Object> getMaxTypeCompany() {
        return jdbcTemplate.queryForMap("select * from company where id=(select max(id) from company)");
    }

    public void addCompany(String type, String name, String depart, String group, String bz) {
        jdbcTemplate.update("insert into company (type,name,department,egroup,bz) values (?,?,?,?,?)", type, name, depart, group, bz);
    }

    public void updateCompany(String id, String name, String depart, String group, String bz) {
        jdbcTemplate.update("update company set name=?,department=?,egroup=?,bz=? where id=?", name, depart, group, bz, id);
    }

    public void deleteCompany(String id) {
        jdbcTemplate.update("delete from company where id=?", id);
    }
}
