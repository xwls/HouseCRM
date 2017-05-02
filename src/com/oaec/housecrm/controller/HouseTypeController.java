package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.HouseTypeService;
import com.oaec.housecrm.util.ParameterUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.IOException;
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

    public void update() throws IOException {
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        int update = houseTypeService.update(parameters);
        write(update > 0);
    }

    public void delete() throws IOException {
        String type_id = ServletActionContext.getRequest().getParameter("type_id");
        int delete = houseTypeService.delete(type_id);
        write(delete > 0);
    }

    public void add() throws IOException {
        String type_name = ServletActionContext.getRequest().getParameter("type_name");
        int add = houseTypeService.add(type_name);
        write(add > 0);
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
