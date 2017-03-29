package com.oaec.housecrm.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/18.
 */
public interface CustomerCareDao {
    /**
     * 根据类型查询
     * @param customerInput
     * @param queryType
     * @return
     */
    List<Map<String,Object>> getList(String customerInput, String queryType);

    /**
     * 根据ID查询关怀信息
     * @param care_id
     * @return
     */
    Map<String,Object> getCare(String care_id);

    /**
     * 添加关怀信息
     * @param map
     * @return
     */
    int add(Map<String,Object> map);

    /**
     * 删除关怀信息
     * @param care_id
     * @return
     */
    int delete(String care_id);

    /**
     * 更新关怀信息
     * @param map
     * @return
     */
    int update(Map<String,Object> map);

    /**
     * 提醒关怀
     * @param days 最近几天
     * @return
     */
    List<Map<String,Object>> getCustomerCare(String days);
}
