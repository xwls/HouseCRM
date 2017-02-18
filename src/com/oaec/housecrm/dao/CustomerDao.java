package com.oaec.housecrm.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/16.
 */
public interface CustomerDao {
    /**
     * 查询所有已经启用的客户
     * @return
     */
    List<Map<String,Object>> queryAllUsed();

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

    Map<String,Object> queryById(int id);
}
