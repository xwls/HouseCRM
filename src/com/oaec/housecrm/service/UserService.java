package com.oaec.housecrm.service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/21.
 */
public interface UserService {
    Map<String,Object> login(String userName,String password);
    List<Map<String, Object>> queryAllUsed();
    int add(Map<String, Object> user);
    int update(Map<String, Object> user);
    int delete(String user_id);
    Map<String, Object> queryById(String user_id);
}
