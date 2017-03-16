package com.oaec.housecrm.service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/16.
 */
public interface CustomerService {
    /**
     * 查询所有已分配的客户
     *
     * @return
     */
    List<Map<String, Object>> queryAllUsed(boolean isAllocation);

    /**
     * 查询所有未分配的客户
     * @return
     */
    List<Map<String, Object>> queryAllNotAllocation();


    /**
     * 分配客户
     * @param customer_id
     * @param user_id
     * @return
     */
    int allocate(String customer_id, String user_id);
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
//    List<Map<String, Object>> queryConditions();

    /**
     * 查询所有的客户Source
     * @return
     */
//    List<Map<String, Object>> querySources();

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

    List<Map<String,Object>> query(Map<String,Object> map);

    List<Map<String,Object>> queryNameById(String[] ids);
}
