package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.HouseService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/21.
 */
@Controller()
public class HouseController extends CommonController implements RequestAware {

    @Autowired
    private HouseService houseService;

    private Map<String, Object> requestMap;

    public String queryAll(){
        String user_id = ServletActionContext.getRequest().getParameter("user_id");
        List<Map<String, Object>> houses = houseService.query("", "", user_id);
        requestMap.put("houses",houses);
        return SUCCESS;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
