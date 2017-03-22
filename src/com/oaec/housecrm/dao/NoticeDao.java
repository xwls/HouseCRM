package com.oaec.housecrm.dao;

import java.util.List;
import java.util.Map;

public interface NoticeDao {

	/**
	 * 查询公告信息
	 * @param noticeInput
	 * @param queryType
	 * @return
	 */
	List<Map<String,Object>> query(String noticeInput, String queryType);
	
	/**
	 * 添加公告信息
	 * @param noticeInfo
	 * @return
	 */
	int add(Map<String,Object> noticeInfo);
	
	/**
	 * 删除公告信息
	 * @param noticeId
	 * @return
	 */
	int delete(String noticeId);

	/**
	 * 修改公告信息
	 * @param noticeInfo
	 * @return
	 */
	int update(Map<String,Object> noticeInfo);
}
