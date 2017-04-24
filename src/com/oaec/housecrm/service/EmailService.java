package com.oaec.housecrm.service;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/4/24.
 */
public interface EmailService {
    int add(Map<String, Object> map);
    List<Map<String, Object>> queryEmail(String user_id, boolean isSend);
    Map<String, Object> queryById(String email_id);
    int update(Map<String,Object> map);
}
