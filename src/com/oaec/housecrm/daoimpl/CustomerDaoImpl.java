package com.oaec.housecrm.daoimpl;

import com.oaec.housecrm.dao.CustomerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/16.
 */
@Repository("customerDao")
public class CustomerDaoImpl implements CustomerDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> queryAllUsed() {
        String sql = "SELECT customer_info.customer_id, customer_info.customer_name, customer_info.customer_sex, customer_condition.condition_name, customer_source.source_name, user_info.user_name, customer_type.type_name, customer_info.customer_mobile, customer_info.customer_email FROM customer_info LEFT JOIN customer_condition ON (customer_info.condition_id = customer_condition.condition_id) LEFT JOIN customer_source ON customer_info.source_id = customer_source.source_id LEFT JOIN user_info ON customer_info.user_id = user_info.user_id LEFT JOIN customer_type ON customer_info.type_id = customer_type.type_id WHERE customer_info.is_used != 0 ORDER BY customer_info.customer_id";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
        return maps;
    }

    @Override
    public List<Map<String,Object>> queryTypes() {
        String sql = "SELECT DISTINCT customer_type.type_id,customer_type.type_name FROM customer_info RIGHT JOIN customer_type ON customer_info.type_id = customer_type.type_id;";
        List<Map<String,Object>> types = jdbcTemplate.queryForList(sql);
        return types;
    }

    @Override
    public List<Map<String,Object>> queryConditions() {
        String sql = "SELECT DISTINCT customer_condition.condition_id,customer_condition.condition_name FROM customer_info RIGHT JOIN customer_condition ON customer_condition.condition_id = customer_info.condition_id";
        List<Map<String,Object>> conditions = jdbcTemplate.queryForList(sql);
        return conditions;
    }

    @Override
    public List<Map<String,Object>> querySources() {
        String sql = "SELECT DISTINCT customer_source.source_id,customer_source.source_name FROM customer_info RIGHT JOIN customer_source ON customer_info.source_id = customer_source.source_id";
        List<Map<String,Object>> sources = jdbcTemplate.queryForList(sql);
        return sources;
    }

    @Override
    public Map<String, Object> queryById(int id) {
        String sql = "SELECT customer_info.customer_id, customer_info.customer_name, customer_info.customer_sex, customer_condition.condition_id, customer_source.source_id, user_info.user_name, customer_type.type_id, customer_info.customer_mobile, customer_info.customer_email, customer_info.customer_qq, customer_info.customer_address, customer_info.customer_remark, customer_info.customer_job, customer_info.customer_blog, customer_info.customer_tel, customer_info.customer_msn, customer_info.birth_day, customer_info.customer_addtime, customer_info.customer_addman, customer_info.customer_changtime, customer_info.change_man, customer_info.customer_company FROM customer_info LEFT JOIN customer_condition ON (customer_info.condition_id = customer_condition.condition_id) LEFT JOIN customer_source ON customer_info.source_id = customer_source.source_id LEFT JOIN user_info ON customer_info.user_id = user_info.user_id LEFT JOIN customer_type ON customer_info.type_id = customer_type.type_id WHERE customer_info.customer_id = ?";
        Map<String, Object> customer = jdbcTemplate.queryForMap(sql, id);
        return customer;
    }
}
