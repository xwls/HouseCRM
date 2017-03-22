package com.oaec.housecrm.daoimpl;

import com.oaec.housecrm.dao.DepartmentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/22.
 */
@Repository("departmentDao")
public class DepartmentDaoImpl implements DepartmentDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Map<String, Object>> query(String deName) {
		String sql = "select * from department_info where is_used='1' and department_name like ?";
		deName = deName == null ? "%%" : "%"+deName+"%";
		List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql, deName);
		return maps;
	}

	@Override
	public int add(Map<String, Object> deInfo) {
		String sql = "insert into department_info (department_name,department_desc,is_used) values(?,?,'1')";
		int update = jdbcTemplate.update(sql, deInfo.get("department_name"), deInfo.get("department_desc"));
		return update;
	}

	@Override
	public int delete(String deId) {
		String sql = "update department_info set is_used=0 where department_id=?";
		int update = jdbcTemplate.update(sql, deId);
		return update;
	}

	@Override
	public int update(Map<String, Object> deInfo) {
		String sql = "update department_info  set department_name=?,department_desc=? where department_id=?";
		int update = jdbcTemplate.update(sql, deInfo.get("department_name"), deInfo.get("department_desc"), deInfo.get("department_id"));
		return update;
	}

	@Override
	public Map<String, Object> queryById(String deId) {
		String sql = "select * from department_info where department_id=? and is_used=1";
		Map<String, Object> map = jdbcTemplate.queryForMap(sql, deId);
		return map;
	}
}
