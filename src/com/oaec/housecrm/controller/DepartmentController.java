package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.DepartmentService;
import com.oaec.housecrm.util.ParameterUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
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

	public String dialog(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        if (parameters.containsKey("department_id")){
            String department_id = parameters.get("department_id").toString();
            Map<String, Object> dept = departmentService.queryById(department_id);
            System.out.println(dept);
            requestMap.put("dept",dept);
        }
	    return SUCCESS;
    }

	public void add(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        int result = 0;
        if ("".equals(parameters.get("department_id").toString().trim())){
            result = departmentService.add(parameters);
        }else {
            result = departmentService.update(parameters);
        }
        write(result > 0);
	}

	public void delete(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String department_id = request.getParameter("department_id");
        int delete = departmentService.delete(department_id);
        write(delete > 0);
    }

	@Override
	public void setRequest(Map<String, Object> map) {
		this.requestMap = map;
	}
}
