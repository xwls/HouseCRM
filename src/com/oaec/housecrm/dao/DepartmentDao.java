package com.oaec.housecrm.dao;

import java.util.List;
import java.util.Map;

public interface DepartmentDao {

	/**
	 * 根据条件查询部门信息
	 *
	 * @param deName
	 * @return
	 */
	List<Map<String, Object>> query(String deName);

	/**
	 * 添加部门信息
	 *
	 * @param deInfo
	 * @return
	 */
	int add(Map<String, Object> deInfo);

	/**
	 * 删除部门信息
	 *
	 * @param deId
	 * @return
	 */
	int delete(String deId);

	/**
	 * 更改部门信息
	 *
	 * @param deInfo
	 * @return
	 */
	int update(Map<String, Object> deInfo);

	/**
	 * 根据部门id查询
	 *
	 * @param deId
	 * @return
	 */
	Map<String, Object> queryById(String deId);
}	
