package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/21.
 */
@Controller
public class UserController extends CommonController implements RequestAware{

    @Autowired
    private UserService userService;

    private String userName;
    private String password;

    private Map<String,Object> requestMap;

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String login(){
        Map<String, Object> userInfo = userService.login(userName, password);
        System.out.println(userInfo);
        if (userInfo != null) {
            HttpSession session = ServletActionContext.getRequest().getSession();
            session.setAttribute("userInfo",userInfo);
            return SUCCESS;
        }else {
            return ERROR;
        }
    }

    public String logout(){
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.invalidate();
        return SUCCESS;
    }

    public String queryAll(){
        List<Map<String, Object>> users = userService.queryAllUsed();
        requestMap.put("users",users);
        return SUCCESS;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}