package com.oaec.housecrm.dao.impl;

import com.oaec.housecrm.dao.CustomerTypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/12.
 */
@Repository("customerTypeDao")
public class CustomerTypeDaoImpl implements CustomerTypeDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> queryAll() {
//        String sql = "SELECT DISTINCT customer_type.type_id,customer_type.type_name FROM customer_info RIGHT JOIN customer_type ON customer_info.type_id = customer_type.type_id;";
        String sql = "select *  from customer_type  where is_used=1";
        List<Map<String, Object>> types = jdbcTemplate.queryForList(sql);
        return types;
    }

    @Override
    public int update(Map<String,Object> parameters) {
//        System.out.println(parameters);
        String sql = "update customer_type set  type_name=?  where type_id =?";
        int update = jdbcTemplate.update(sql, parameters.get("type_name"), parameters.get("type_id"));
        return update;
    }

    @Override
    public int delete(String type_id) {
        String sql = "update customer_type set  is_used = '0' where type_id =?";
        int update = jdbcTemplate.update(sql, type_id);
        return update;
    }

    @Override
    public int add(String type_name) {
        String sql = "insert into customer_type (type_name)  values(?)";
        int update = jdbcTemplate.update(sql, type_name);
        return update;
    }
}
