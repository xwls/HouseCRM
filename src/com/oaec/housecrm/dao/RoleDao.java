package com.oaec.housecrm.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/5/2.
 */
public interface RoleDao {
    List<Map<String,Object>> queryAll();

    int add(Map<String,Object> role);

    int update(Map<String,Object> role);

    int delete(String role_id);

}
