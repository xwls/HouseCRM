package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.DepartmentService;
import com.oaec.housecrm.service.RoleService;
import com.oaec.housecrm.service.UserService;
import com.oaec.housecrm.util.ParameterUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/21.
 */
@Controller
public class UserController extends CommonController implements RequestAware{

    @Autowired
    private UserService userService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private RoleService roleService;

    private SimpleDateFormat dateFormat;

    private String userName;
    private String password;

    public UserController() {
        dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    }

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

    public String dialog(){
        List<Map<String, Object>> depts = departmentService.query(null);
        requestMap.put("depts",depts);
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        if (parameters.containsKey("user_id")){
            String user_id = parameters.get("user_id").toString();
            Map<String, Object> user = userService.queryById(user_id);
            System.out.println(user);
            requestMap.put("user",user);
        }
        return SUCCESS;
    }

    public void add(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        int result = 0;
        if ("".equals(parameters.get("user_id").toString().trim())){
            parameters.put("user_addtime", dateFormat.format(new Date()));
            parameters.put("user_changetime", dateFormat.format(new Date()));
            result = userService.add(parameters);
        }else {
            parameters.put("user_changetime", dateFormat.format(new Date()));
            result = userService.update(parameters);
        }
        write(result > 0);
    }

    public void delete(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String user_id = request.getParameter("user_id");
        int delete = userService.delete(user_id);
        write(delete > 0);
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}