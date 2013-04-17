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
public class MenuDao {

    @Resource
    JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> getAllMenu() {
        return jdbcTemplate.queryForList("select * from menu");
    }

    public List<Map<String, Object>> getMenuByIds(String ids) {
        return jdbcTemplate.queryForList("select * from menu where menu_id in (" + ids + ")");
    }
}
