package com.oaec.housecrm.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/4/24.
 */
public interface ChartDao {
    List<Map<String,Object>> querySexCount();
    List<Map<String,Object>> queryIsUsed();
    List<Map<String,Object>> queryType();
    List<Map<String,Object>> queryCondition();
    List<Map<String,Object>> querySource();
    List<Map<String,Object>> queryUsers();
    List<Map<String,Object>> queryDiploma();
}
