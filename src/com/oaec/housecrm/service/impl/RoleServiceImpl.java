package com.oaec.housecrm.service.impl;

import com.oaec.housecrm.dao.RoleDao;
import com.oaec.housecrm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/5/2.
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public List<Map<String, Object>> queryAll() {
        return roleDao.queryAll();
    }

    @Override
    public int add(Map<String, Object> role) {
        return roleDao.add(role);
    }

    @Override
    public int update(Map<String, Object> role) {
        return roleDao.update(role);
    }

    @Override
    public int delete(String role_id) {
        return roleDao.delete(role_id);
    }
}
