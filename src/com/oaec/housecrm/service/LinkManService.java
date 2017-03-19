package com.oaec.housecrm.service;

import java.util.List;
import java.util.Map;

/**
 * 联系人的接口
 */
public interface LinkManService {

    /**
     * 增加联系人
     *
     * @param linkMan
     * @return
     */
    int add(Map<String, Object> linkMan);

    /**
     * 修改联系人
     *
     * @param linkMan
     * @return
     */
    int update(Map<String, Object> linkMan);

    /**
     * 删除联系人
     *
     * @param linkMan_id
     * @return
     */
    int delete(String linkMan_id);

    /**
     * 查询联系人
     *
     * @param linkManInput
     * @param queryType
     * @return
     */
    List<Map<String, Object>> queryAll(String linkManInput, String queryType);

    /**
     * 查询一条联系人
     *
     * @param linkMan_id
     * @return
     */
    Map<String, Object> queryById(String linkMan_id);

}
