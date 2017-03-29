package com.oaec.housecrm.service;

import java.util.List;
import java.util.Map;

/**
 * 联系记录的实体类
 *
 * @author Kevin
 */
public interface LinkRecordService {

    /**
     * 查询联系记录信息
     *
     * @param whoLinkInput
     * @param queryType
     * @return
     */
    List<Map<String, Object>> getWhoLink(String whoLinkInput, String queryType);

    /**
     * 添加联系记录
     *
     * @param linkRecordInfo
     * @return
     */
    int add(Map<String, Object> linkRecordInfo);

    /**
     * 删除联系记录信息
     *
     * @param record_id
     */
    int delete(String record_id);

    List<Map<String, Object>> getLinkRecord(String days);
}
