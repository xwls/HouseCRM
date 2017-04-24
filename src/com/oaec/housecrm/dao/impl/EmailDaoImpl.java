package com.oaec.housecrm.dao.impl;

import com.oaec.housecrm.dao.EmailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/4/22.
 */
@Repository("emailDao")
public class EmailDaoImpl implements EmailDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int add(Map<String, Object> map) {
        String sql="insert into email_info(customer_id,user_id,email_content,email_time,email_state,email_theme,is_used)   value(?,?,?,?,?,?,1)";
        int update = jdbcTemplate.update(sql, map.get("customer_id"), map.get("user_id"), map.get("email_content"), map.get("email_time"), map.get("email_state"), map.get("email_theme"));
        return update;
    }

    @Override
    public List<Map<String, Object>> queryEmail(String user_id, boolean isSend) {
        String sql = "select a.*,b.customer_name,c.user_name from email_info a,customer_info b ,user_info c where a.user_id=c.user_id and a.customer_id=b.customer_id and a.is_used=1";
        if (!"1".equals(user_id)){
            sql += " and c.user_id = " + user_id;
        }
        if (isSend){
            sql += " and email_state = 0 ";
        }else {
            sql += " and email_state = 1 ";
        }
        List<Map<String, Object>> emails = jdbcTemplate.queryForList(sql);

        return emails;
    }

    @Override
    public Map<String, Object> queryById(String email_id) {
        String sql = "select a.*,b.customer_name,c.user_name from email_info a,customer_info b ,user_info c where a.user_id=c.user_id and a.customer_id=b.customer_id and a.is_used=1 and a.email_id = ?";
        Map<String, Object> email = jdbcTemplate.queryForMap(sql, email_id);
        return email;
    }

    @Override
    public int update(Map<String, Object> map) {
        String sql = "update email_info set customer_id =?, email_content =?,email_time=?,email_state=?,email_theme=?,is_used=1 where email_id =?";
        int update = jdbcTemplate.update(sql, map.get("customer_id"), map.get("email_content"), map.get("email_time"), map.get("email_state"), map.get("email_theme"), map.get("email_id"));
        return update;
    }


}
