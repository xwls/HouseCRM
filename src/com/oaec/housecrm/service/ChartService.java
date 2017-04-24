package com.oaec.housecrm.service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/4/24.
 */
public interface ChartService {
    List<Map<String,Object>> querySexCount();
    List<Map<String, Object>> queryIsUsed();
    List<Map<String, Object>> queryType();
    List<Map<String, Object>> queryCondition();
    List<Map<String, Object>> querySource();
}
