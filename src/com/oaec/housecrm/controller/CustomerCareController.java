package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.CustomerCareService;
import com.oaec.housecrm.service.CustomerService;
import com.oaec.housecrm.util.ParameterUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/18.
 */
@Controller("customerCareController")
public class CustomerCareController extends CommonController implements RequestAware{
    @Autowired
    private CustomerCareService customerCareService;
    @Autowired
    private CustomerService customerService;

    private Map<String, Object> requestMap;

    public String queryAll(){
        List<Map<String, Object>> cares = customerCareService.getList("", "");
        ServletActionContext.getRequest().setAttribute("cares",cares);
        return SUCCESS;
    }

    public String careDialog(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        if (parameters.containsKey("care_id")){
            String care_id = parameters.get("care_id").toString();
            Map<String, Object> care = customerCareService.getCare(care_id);
            requestMap.put("care",care);
        }
        ActionContext context = ServletActionContext.getContext();
        Map<String,Object> userInfo = (Map<String, Object>) context.getSession().get("userInfo");
        List<Map<String, Object>> customers = customerService.query(userInfo);
        requestMap.put("customers",customers);
        return SUCCESS;
    }

    public void add(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        parameters.put("care_time",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        Map<String,Object> userInfo = (Map<String, Object>) ServletActionContext.getContext().getSession().get("userInfo");
        Object care_people = userInfo.get("user_name");
        parameters.put("care_people",care_people);
        System.out.println(parameters);
        int result = 0;
        if ("".equals(parameters.get("care_id"))){
            result = customerCareService.add(parameters);
        }else {
            result = customerCareService.update(parameters);
        }
        write(result > 0);
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
