package com.oaec.housecrm.dao.impl;

import com.oaec.housecrm.dao.EmailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
        return 0;
    }
}
