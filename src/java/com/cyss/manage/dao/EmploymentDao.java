/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cyss.manage.dao;

import java.sql.Types;
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
public class EmploymentDao {

    @Resource
    JdbcTemplate jdbcTemplate;

    public Map<String, Object> getAEmploymentByEId(String EId) {
        return jdbcTemplate.queryForMap("select * from employment where employment_id = ?", EId);
    }

    public Map<String, Object> getAEmploymentByUsername(String username) {
        try {
            return jdbcTemplate.queryForMap("select * from employment where username = ?", username);
        } catch (Exception ex) {
            return null;
        }
    }

    public List<Map<String, Object>> getAllEmployment() {
        return jdbcTemplate.queryForList("select * from employment");
    }

    public List<Map<String, Object>> getAllEmploymentInUse() {
        return jdbcTemplate.queryForList("select * from employment where flag=1");
    }

    //flag 0:删除 1:可用
    public void deleteEmployment(String Eid) {
        jdbcTemplate.update("update employment set flag='0' where employment_id=?", Eid);
    }

    public void deleteTrueEmployment(String Eid) {
        jdbcTemplate.update("delete from employment where employment_id=?", Eid);
    }

    public void insertEmployment(String Eid, String Ename, String Ecard, String Esfzh, String company, int department, int group, int job, int roleId, String bz) {
        jdbcTemplate.update("insert into employment (employment_id,employment_name,card_number,id_number,company,role_id,department,egroup,job1,job1_begin,bz) values (?,?,?,?,?,?,?,?,?,now(),?)", new Object[]{Eid, Ename, Ecard, Esfzh, company, roleId, department, group, job, bz}, new int[]{Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.DECIMAL, Types.BIGINT, Types.BIGINT, Types.BIGINT, Types.VARCHAR});
    }

    public void updateEmploymentJob1(String Eid, String Ename, String Ecard, String Esfzh, String company, int department, int group, int job, int roleId, String bz) {
        jdbcTemplate.update("update employment set employment_name=?,card_number=?,id_number=?,company=?,department=?,egroup=?,role_id=?,job1=?,job1_begin=now(),bz=? where employment_id=?", Ename, Ecard, Esfzh, company, department, group, roleId, job, bz, Eid);
    }
}
