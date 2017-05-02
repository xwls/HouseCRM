package com.oaec.housecrm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.oaec.housecrm.service.CustomerConditionService;
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
@Controller("customerConditionController")
public class CustomerConditionController extends CommonController {

    @Autowired
    private CustomerConditionService customerConditionService;

    public String queryAll(){
        List<Map<String, Object>> types = customerConditionService.queryAll();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("conditions",types);
        return SUCCESS;
    }

    public void update() throws IOException {
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        int update = customerConditionService.update(parameters);
        write(update > 0);

    }

    public void delete() throws IOException {
        String condition_id = ServletActionContext.getRequest().getParameter("condition_id");
        int delete = customerConditionService.delete(condition_id);
        write(delete > 0);
    }

    public void add() throws IOException {
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        int add = customerConditionService.add(parameters);
        write(add > 0);
    }

    public void getById(){
        String condition_id = ServletActionContext.getRequest().getParameter("condition_id");
        Map<String, Object> stringObjectMap = customerConditionService.queryById(condition_id);
        String jsonString = JSON.toJSONString(stringObjectMap);
        write(jsonString);
    }
}
