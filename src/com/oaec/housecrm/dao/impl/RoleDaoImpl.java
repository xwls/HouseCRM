package com.oaec.housecrm.dao.impl;

import com.oaec.housecrm.dao.RoleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/5/2.
 */
@Repository("roleDao")
public class RoleDaoImpl implements RoleDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> queryAll() {
        String sql = "select * from user_role where is_used = '1'";
        List<Map<String, Object>> roles = jdbcTemplate.queryForList(sql);
        return roles;
    }

    @Override
    public int add(Map<String, Object> role) {
        String sql = "INSERT INTO user_role (role_name, role_power) VALUES (?,?,'1')";
        int update = jdbcTemplate.update(sql, role.get("role_name"), role.get("role_power"));
        return update;
    }

    @Override
    public int update(Map<String, Object> role) {
        String sql = "UPDATE user_role SET role_name = ?,role_power = ? WHERE role_power = ?";
        int update = jdbcTemplate.update(sql, role.get("role_name"), role.get("role_power"), role.get("role_power"));
        return update;
    }

    @Override
    public int delete(String role_id) {
        String sql = "UPDATE user_role SET is_used = '0' WHERE role_id = ?";
        int update = jdbcTemplate.update(sql, role_id);
        return update;
    }
}
