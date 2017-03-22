package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.DepartmentService;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/22.
 */
@Controller
public class DepartmentController extends CommonController implements RequestAware {

	@Autowired
	private DepartmentService departmentService;

	private Map<String, Object> requestMap;

	public String queryAll(){
		List<Map<String, Object>> departments = departmentService.query(null);
		requestMap.put("departments",departments);
		return SUCCESS;
	}

	@Override
	public void setRequest(Map<String, Object> map) {
		this.requestMap = map;
	}
}
