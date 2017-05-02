package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.RoleService;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/5/2.
 */
@Controller
public class RoleController extends CommonController implements RequestAware{

    @Autowired
    private RoleService roleService;

    private Map<String,Object> requestMap;

    public String queryAll(){
        List<Map<String, Object>> maps = roleService.queryAll();
        requestMap.put("roles",maps);
        return SUCCESS;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
