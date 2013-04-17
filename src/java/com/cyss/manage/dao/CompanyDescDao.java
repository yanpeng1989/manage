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
public class CompanyDescDao {

    @Resource
    JdbcTemplate jdbcTemplate;

    /**
     * 
     * @param type 01: 部 02：组 03：职务
     * @return 
     */
    public List<Map<String, Object>> getListByType(String type) {
        return jdbcTemplate.queryForList("select * from company_desc where type = ?", type);
    }
    
    public Map<String, Object> getCompanyDescById(String id) {
        return jdbcTemplate.queryForMap("select * from company_desc where id = ?", id);
    }
}
