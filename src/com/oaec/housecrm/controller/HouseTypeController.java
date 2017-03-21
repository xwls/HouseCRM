package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.HouseTypeService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/21.
 */
@Controller
public class HouseTypeController extends CommonController implements RequestAware {

    Map<String, Object> requestMap;

    @Autowired
    private HouseTypeService houseTypeService;

    public String query(){
        String type_name = ServletActionContext.getRequest().getParameter("type_name");
        List<Map<String, Object>> houseTypes = houseTypeService.query(type_name);
        requestMap.put("houseTypes",houseTypes);
        return SUCCESS;
    }


    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
