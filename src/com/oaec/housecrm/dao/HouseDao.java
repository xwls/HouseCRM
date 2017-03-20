package com.oaec.housecrm.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/20.
 */
public interface HouseDao {
    /**
     * 添加
     * @param houseMap
     * @return
     */
    int add(Map<String,Object> houseMap);

    /**
     * 删除
     * @param house_id
     * @return
     */
    int delete(String house_id);

    /**
     * 修改
     * @param houseMap
     * @return
     */
    int update(Map<String,Object> houseMap);

    /**
     * 根据ID查询
     * @param house_id
     * @return
     */
    Map<String,Object> queryById(String house_id);

    /**
     * 查询所有
     * @return
     */
    List<Map<String,Object>> queryAll();
}
