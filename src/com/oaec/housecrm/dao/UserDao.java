package com.oaec.housecrm.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/20.
 */
public interface UserDao {
    Map<String,Object> queryByNumAndPw(String num, String pw);
    List<Map<String, Object>> queryAllUsed();
    int add(Map<String, Object> user);
    int update(Map<String, Object> user);
    int delete(String user_id);
    Map<String,Object> queryById(String user_id);
}
