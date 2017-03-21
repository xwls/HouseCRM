package com.oaec.housecrm.service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/21.
 */
public interface HouseTypeService {
    /**
     * 查询房屋类型的信息
     * @param houseTypeName
     * @return
     */
    List<Map<String,Object>> query(String houseTypeName);

    /**
     * 添加房屋类型的信息
     * @param houseTypeInfo
     * @return
     */
    int add(Map<String, Object> houseTypeInfo);

    /**
     * 删除房屋类型信息
     * @param houseId
     * @return
     */
    int delete(String houseId);

    /**
     * 修改房屋类型信息
     * @param houseTypeInfo
     * @return
     */
    int update(Map<String, Object> houseTypeInfo);
}
