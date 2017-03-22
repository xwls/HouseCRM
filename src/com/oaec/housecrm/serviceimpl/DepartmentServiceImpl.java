package com.oaec.housecrm.serviceimpl;

import com.oaec.housecrm.dao.DepartmentDao;
import com.oaec.housecrm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/22.
 */
@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentDao departmentDao;

	@Override
	public List<Map<String, Object>> query(String deName) {
		return departmentDao.query(deName);
	}

	@Override
	public int add(Map<String, Object> deInfo) {
		return departmentDao.add(deInfo);
	}

	@Override
	public int delete(String deId) {
		return departmentDao.delete(deId);
	}

	@Override
	public int update(Map<String, Object> deInfo) {
		return departmentDao.update(deInfo);
	}

	@Override
	public Map<String, Object> queryById(String deId) {
		return departmentDao.queryById(deId);
	}
}
