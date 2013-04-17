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
public class RoleDao {

    @Resource
    JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> getRolesByName(String roleName) {
        return jdbcTemplate.queryForList("select * from role where role_name like ?", new Object[]{"%" + roleName + "%"}, new int[]{Types.VARCHAR});
    }

    public List<Map<String, Object>> getAllRole() {
        return jdbcTemplate.queryForList("select * from role");
    }
    
    public List<Map<String, Object>> getAllRolePick() {
        return jdbcTemplate.queryForList("select role_id as id,role_name as name from role");
    }

    public Map<String, Object> getRoleById(String roleId) {
        return jdbcTemplate.queryForMap("select * from role where role_id=?", new Object[]{roleId}, new int[]{Types.DECIMAL});
    }

    public Map<String, Object> getRoleByName(String roleName) {
        Map<String, Object> temp = null;
        try {
            temp = jdbcTemplate.queryForMap("select * from role where role_name=?", new Object[]{roleName}, new int[]{Types.VARCHAR});
        } catch (Exception ex) {
        }
        return temp;
    }

    public void insertRole(String roleName, String power, String bz) {
        jdbcTemplate.update("insert into role (role_name, power, bz) values (?,?,?)", new Object[]{roleName, power, bz}, new int[]{Types.VARCHAR, Types.VARCHAR, Types.VARCHAR});
    }

    public void updateRole(String roleId, String roleName, String power, String bz) {
        jdbcTemplate.update("update role set role_name=?, power=?, bz=? where role_id=?", new Object[]{roleName, power, bz, roleId}, new int[]{Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.BIGINT});
    }

    public void deleteRole(String roleId) {
        jdbcTemplate.update("delete from role where role_id=?", new Object[]{roleId}, new int[]{Types.BIGINT});
    }
}
