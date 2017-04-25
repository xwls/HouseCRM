package com.oaec.housecrm.dao.impl;

import com.oaec.housecrm.dao.ChartDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/4/24.
 */
@Repository("chartDao")
public class ChartDaoImpl implements ChartDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> querySexCount() {
        String sql = "SELECT count(customer_sex) count,customer_sex FROM customer_info GROUP BY customer_sex";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
        return maps;
    }

    @Override
    public List<Map<String, Object>> queryIsUsed() {
        String sql = "SELECT count(*) count,is_used FROM customer_info GROUP BY is_used";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
        return maps;
    }

    @Override
    public List<Map<String, Object>> queryType() {
        String sql = "SELECT count(type_name) count, customer_type.type_name FROM customer_info LEFT JOIN customer_type ON customer_info.type_id = customer_type.type_id GROUP BY type_name";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
        return maps;
    }

    @Override
    public List<Map<String, Object>> queryCondition() {
        String sql = "SELECT count(condition_name) count, customer_condition.condition_name FROM customer_info LEFT JOIN customer_condition ON customer_info.condition_id = customer_condition.condition_id GROUP BY condition_name";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
        return maps;
    }

    @Override
    public List<Map<String, Object>> querySource() {
        String sql = "SELECT count(customer_source.source_name) count,customer_source.source_name FROM customer_info LEFT JOIN customer_source ON customer_info.source_id = customer_source.source_id GROUP BY customer_source.source_name";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
        return maps;
    }

    @Override
    public List<Map<String, Object>> queryUsers() {
        String sql = "SELECT count(user_info.user_name) count,user_info.user_name FROM customer_info LEFT JOIN user_info ON customer_info.user_id = user_info.user_id GROUP BY user_info.user_name";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
        return maps;
    }

    @Override
    public List<Map<String, Object>> queryDiploma() {
        String sql = "SELECT count(user_diploma) count, user_diploma FROM user_info GROUP BY user_diploma";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
        return maps;
    }
}
