package com.oaec.housecrm.daoimpl;

import com.oaec.housecrm.dao.CustomerSourceDao;
import com.oaec.housecrm.dao.CustomerTypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/12.
 */
@Repository("customerSourceDao")
public class CustomerSourceDaoImpl implements CustomerSourceDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> queryAll() {
//        String sql = "SELECT DISTINCT customer_type.type_id,customer_type.type_name FROM customer_info RIGHT JOIN customer_type ON customer_info.type_id = customer_type.type_id;";
        String sql = "select *  from customer_source  where is_used=1";
        List<Map<String, Object>> types = jdbcTemplate.queryForList(sql);
        return types;
    }

    @Override
    public int update(Map<String,Object> parameters) {
//        System.out.println(parameters);
        String sql = "update customer_source set  source_name=?  where source_id =?";
        int update = jdbcTemplate.update(sql, parameters.get("source_name"), parameters.get("source_id"));
        return update;
    }

    @Override
    public int delete(String source_id) {
        String sql = "update customer_source set  is_used = '0' where source_id =?";
        int update = jdbcTemplate.update(sql, source_id);
        return update;
    }

    @Override
    public int add(String source_name) {
        String sql = "insert into customer_source (source_name)  values(?)";
        int update = jdbcTemplate.update(sql, source_name);
        return update;
    }
}
