package com.oaec.housecrm.dao.impl;

import com.oaec.housecrm.dao.CustomerConditionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/12.
 */
@Repository("customerConditionDao")
public class CustomerConditionDaoImpl implements CustomerConditionDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> queryAll() {
        String sql = "select *  from customer_condition  where is_used=1";
        List<Map<String, Object>> types = jdbcTemplate.queryForList(sql);
        return types;
    }

    @Override
    public Map<String, Object> queryById(String condition_id) {
        String sql = "select * from customer_condition where condition_id = ?";
        Map<String, Object> customer_condition = jdbcTemplate.queryForMap(sql, condition_id);
        System.out.println(customer_condition);
        return customer_condition;
    }

    @Override
    public int update(Map<String,Object> parameters) {
        String sql = "update customer_condition set  condition_name=?,condition_explain=?  where condition_id =?";
        int update = jdbcTemplate.update(sql, parameters.get("condition_name"), parameters.get("condition_explain"),parameters.get("condition_id"));
        return update;
    }

    @Override
    public int delete(String type_id) {
        String sql = "update customer_condition set  is_used = '0' where condition_id =?";
        int update = jdbcTemplate.update(sql, type_id);
        return update;
    }

    @Override
    public int add(Map<String,Object> parameters) {
        String sql = "insert into customer_condition (condition_name,condition_explain)  values(?,?)";
        int update = jdbcTemplate.update(sql, parameters.get("condition_name"),parameters.get("condition_explain"));
        return update;
    }
}
