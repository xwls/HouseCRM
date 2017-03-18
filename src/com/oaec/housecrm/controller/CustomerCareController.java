package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.CustomerCareService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/18.
 */
@Controller("customerCareController")
public class CustomerCareController extends CommonController {
    @Autowired
    private CustomerCareService customerCareService;

    public String queryAll(){
        List<Map<String, Object>> cares = customerCareService.getList("", "");
        ServletActionContext.getRequest().setAttribute("cares",cares);
        return SUCCESS;
    }
}
