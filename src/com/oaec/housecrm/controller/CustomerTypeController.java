package com.oaec.housecrm.controller;

import com.alibaba.fastjson.JSONObject;
import com.oaec.housecrm.service.CustomerTypeService;
import com.oaec.housecrm.util.ParameterUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/12.
 */
@Controller("customerTypeController")
public class CustomerTypeController extends CommonController {

    @Autowired
    private CustomerTypeService customerTypeService;

    public String queryAll(){
        List<Map<String, Object>> types = customerTypeService.queryAll();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("types",types);
        return SUCCESS;
    }

    public void update() throws IOException {
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        int update = customerTypeService.update(parameters);
        write(update > 0);
    }

    public void delete() throws IOException {
        String type_id = ServletActionContext.getRequest().getParameter("type_id");
        int delete = customerTypeService.delete(type_id);
        write(delete > 0);
    }

    public void add() throws IOException {
        String type_name = ServletActionContext.getRequest().getParameter("type_name");
        int add = customerTypeService.add(type_name);
        write(add > 0);
    }
}
