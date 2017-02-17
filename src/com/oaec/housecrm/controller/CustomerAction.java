package com.oaec.housecrm.controller;

import com.alibaba.fastjson.JSON;
import com.oaec.housecrm.service.CustomerService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/16.
 */
@Controller
public class CustomerAction extends ActionSupport{

    @Autowired
    private CustomerService customerService;

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String queryAllUsed(){
        System.out.println("CustomerAction.queryAllUsed");
        List<Map<String, Object>> customers = customerService.queryAllUsed();
        List<String> types = customerService.queryTypes();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("customers",customers);
        request.setAttribute("types",types);
        return "success";
    }

    public void detail(){
        Map<String, Object> customer = customerService.queryById(id);
        String json = JSON.toJSONString(customer);
        try {
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setCharacterEncoding("utf-8");
            PrintWriter writer = response.getWriter();
            writer.print(json);
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(customer);
    }

}
