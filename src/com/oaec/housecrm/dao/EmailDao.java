package com.oaec.housecrm.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/4/22.
 */
public interface EmailDao {
    int add(Map<String,Object> map);
    List<Map<String,Object>> queryEmail(String user_id, boolean isSend);
    Map<String,Object> queryById(String email_id);
    int update(Map<String,Object> map);
}
