package com.oaec.housecrm.service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/16.
 */
public interface CustomerService {
    /**
     * 查询所有有效客户
     *
     * @return
     */
    List<Map<String, Object>> queryAllUsed();

    /**
     * 查询所有客户Type
     *
     * @return
     */
    List<Map<String, Object>> queryTypes();

    /**
     * 根据ID查询客户详细信息
     * @param id
     * @return
     */
    Map<String, Object> queryById(int id);

    /**
     * 查询所有的客户Condition
     * @return
     */
    List<Map<String, Object>> queryConditions();

    /**
     * 查询所有的客户Source
     * @return
     */
    List<Map<String, Object>> querySources();

    /**
     * 添加新客户
     * @param map
     * @return
     */
    int add(Map<String, Object> map);

    /**
     * 修改客户信息
     * @param map
     * @return
     */
    int update(Map<String, Object> map);
}
