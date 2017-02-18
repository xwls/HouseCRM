package com.oaec.housecrm.service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/16.
 */
public interface CustomerService {
    List<Map<String,Object>> queryAllUsed();
    List<Map<String,Object>> queryTypes();
    Map<String,Object> queryById(int id);
    List<Map<String,Object>> queryConditions();
    List<Map<String,Object>> querySources();
}
