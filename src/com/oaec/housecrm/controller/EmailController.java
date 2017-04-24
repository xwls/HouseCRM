package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.CustomerService;
import com.oaec.housecrm.service.EmailService;
import com.oaec.housecrm.service.SpringMailSender;
import com.oaec.housecrm.util.ParameterUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/4/24.
 */
@Controller
public class EmailController extends CommonController implements RequestAware{

    @Autowired
    private EmailService emailService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private SpringMailSender springMailSender;

    private Map<String, Object> requestMap;

    public String add(){
        ActionContext context = ServletActionContext.getContext();
        Map<String,Object> userInfo = (Map<String, Object>) context.getSession().get("userInfo");
        List<Map<String, Object>> customers = customerService.query(userInfo);
        Map<String, Object> parameters = ServletActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        if (parameters.containsKey("email_id")){
            Map<String, Object> email = emailService.queryById(parameters.get("email_id").toString());
            requestMap.put("email",email);
        }
        requestMap.put("customers",customers);
        return SUCCESS;
    }

    public void save(){
        ActionContext context = ServletActionContext.getContext();
        Map<String, Object> parameterMap = context.getParameters();
        ParameterUtil.convert(parameterMap);
        Map<String,Object> userInfo = (Map<String, Object>) context.getSession().get("userInfo");
        Object user_id = userInfo.get("user_id");
        parameterMap.put("user_id",user_id);
        parameterMap.put("email_state",1);
        parameterMap.put("email_time",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        int result = -1;
        if (parameterMap.containsKey("email_id")){
            result = emailService.update(parameterMap);
        }else {
            result = emailService.add(parameterMap);
        }
        write(result > 0);
    }

    public String queryEmails(){
        ActionContext context = ServletActionContext.getContext();
        Map<String,Object> userInfo = (Map<String, Object>) context.getSession().get("userInfo");
        String user_id = userInfo.get("user_id").toString();
        Map<String, Object> parameters = context.getParameters();
        ParameterUtil.convert(parameters);
        System.out.println(parameters);
        boolean isSend = Boolean.parseBoolean(parameters.get("isSend").toString());
        List<Map<String, Object>> emails = emailService.queryEmail(user_id, isSend);
        requestMap.put("emails",emails);
        return SUCCESS;
    }

    public void send(){
        ActionContext context = ServletActionContext.getContext();
        Map<String, Object> parameterMap = context.getParameters();
        ParameterUtil.convert(parameterMap);
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("crm@oaec.xin");
        int customer_id = Integer.parseInt(parameterMap.get("customer_id").toString());
        Map<String, Object> customer = customerService.queryById(customer_id);
        message.setTo(customer.get("customer_email").toString());
        message.setSubject(parameterMap.get("email_theme").toString());
        message.setText(parameterMap.get("email_content").toString());
        springMailSender.sendMail(message);
        Map<String,Object> userInfo = (Map<String, Object>) context.getSession().get("userInfo");
        Object user_id = userInfo.get("user_id");
        parameterMap.put("user_id",user_id);
        parameterMap.put("email_state",0);
        parameterMap.put("email_time",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        int add = emailService.add(parameterMap);
        write(add > 0);
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
