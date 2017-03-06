package com.oaec.housecrm.dao;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by Kevin on 2017/2/16.
 */
public interface CustomerDao {
    /**
     * 查询所有已分配的客户
     * @return
     */
    List<Map<String,Object>> queryAllUsed(boolean isAllocation);

    /**
     * 查询当前所有的Type
     * @return
     */
    List<Map<String,Object>> queryTypes();

    /**
     * 查询所有客户的Condition
     * @return
     */
    List<Map<String,Object>> queryConditions();

    /**
     * 查询所有客户的Source
     * @return
     */
    List<Map<String,Object>> querySources();

    /**
     * 根据客户ID查询客户信息
     * @param id
     * @return
     */
    Map<String,Object> queryById(int id);

    /**
     * 添加新客户
     * @param map
     * @return
     */
    int add(Map<String,Object> map);

    /**
     * 修改客户信息
     * @param map
     * @return
     */
    int update(Map<String,Object> map);

    List<Map<String,Object>> query(Map<String,Object> map);

    List<Map<String,Object>> queryNameById(String[] ids);
}
