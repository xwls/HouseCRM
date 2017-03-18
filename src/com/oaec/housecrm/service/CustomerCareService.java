package com.oaec.housecrm.service;

import java.util.List;
import java.util.Map;

public interface CustomerCareService {
	/**
	 * 根据条件查询关怀信息
	 * @param 
	 * @return
	 */
	List<Map<String,Object>> getList(String customerInput, String queryType);
	
	/**
	 * 根据员工id查询关怀信息
	 * @param care_id
	 * @return
	 */
	Map<String,Object> getCare(String care_id);
	
	/**
	 * 添加关怀信息
	 * @param 
	 * @return
	 */
	int add(Map<String,Object> careInfo);

	/**
	 * 假删除关怀信息
	 * @param 
	 * @return
	 */
	int delete(String care_id);
	
	/**
	 * 修改关怀信息
	 * @param 
	 * @return 
	 */
	int update(Map<String,Object> careInfo);
}
