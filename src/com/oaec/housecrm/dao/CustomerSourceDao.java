package com.oaec.housecrm.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/12.
 */
public interface CustomerSourceDao {

    /**
     * 查询当前所有的Source
     * @return
     */
    List<Map<String,Object>> queryAll();

    /**
     * 修改Source名称
     * @param parameters
     * @return
     */
    int update(Map<String, Object> parameters);

    /**
     * 删除
     * @param source_id
     * @return
     */
    int delete(String source_id);

    /**
     * 添加
     * @param source_name
     * @return
     */
    int add(String source_name);
}
