package com.oaec.housecrm.service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/12.
 */
public interface CustomerConditionService {

    /**
     * 查询所有客户Type
     *
     * @return
     */
    List<Map<String, Object>> queryAll();

    Map<String, Object> queryById(String condition_id);

    /**
     * 修改type名称
     * @param parameters
     * @return
     */
    int update(Map<String, Object> parameters);

    /**
     * 删除
     * @param type_id
     * @return
     */
    int delete(String type_id);

    /**
     * 添加
     * @param parameters
     * @return
     */
    int add(Map<String, Object> parameters);
}
