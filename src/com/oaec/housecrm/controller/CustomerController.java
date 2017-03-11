package com.oaec.housecrm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.oaec.housecrm.service.CustomerService;
import com.oaec.housecrm.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by Kevin on 2017/2/16.
 */
@Controller
public class CustomerController extends ActionSupport{

    @Autowired
    private CustomerService customerService;

    @Autowired
    private UserService userService;

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    /**
     * 查询所有的有效客户
     * @return
     */
    public String queryAllUsed(){
        List<Map<String, Object>> customers = customerService.queryAllUsed(true);
        List<Map<String,Object>> types = customerService.queryTypes();
        List<Map<String,Object>> conditions = customerService.queryConditions();
        List<Map<String,Object>> sources = customerService.querySources();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("customers",customers);
        request.setAttribute("types",types);
        request.setAttribute("conditions",conditions);
        request.setAttribute("sources",sources);
        return "success";
    }

    /**
     * 所有未分配的
     * @return
     */
    public String queryAllNotAllocation(){
        List<Map<String, Object>> customers = customerService.queryAllUsed(false);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("customers",customers);
        return SUCCESS;
    }

    /**
     * Ajax查询客户详细信息
     * 返回JSON
     */
    public void detail(){
        Map<String, Object> customer = customerService.queryById(id);
        Set<Map.Entry<String, Object>> entries = customer.entrySet();
        for (Map.Entry<String,Object> entry : entries){
            if (entry.getValue() == null){
                entry.setValue("");
            }
            entry.setValue(entry.getValue().toString().trim());
            String key = entry.getKey();
            if(key.equals("birth_day")){
                String value = entry.getValue().toString().substring(0, 10);
                entry.setValue(value);
            }
            if(key.equals("customer_addtime") || key.equals("customer_changtime")){
                String value = entry.getValue().toString();
                if(value != null && !"".equals(value)){
                    entry.setValue(value.substring(0, 19));
                }
            }
        }
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
//        System.out.println(json);
    }

    /**
     * 添加修改客户信息
     * @return
     */
    public void update(){
        HttpServletResponse response = ServletActionContext.getResponse();
        ActionContext actionContext = ActionContext.getContext();
        Map<String, Object> parameters = actionContext.getParameters();
        System.out.println(parameters);
        //由于获取到的参数都是String数组类型，需要将数组取出第0个，才是我们需要的参数
        convert(parameters);
        //获取session中用户的信息
        Map<String, Object> session = actionContext.getSession();
        Object o = session.get("userInfo");
        if (o instanceof Map){
            Map<String,Object> userInfo = (Map<String, Object>) o;
            parameters.put("user_id",userInfo.get("user_id"));
            parameters.put("customer_addman",userInfo.get("user_name"));
        }
        System.out.println(parameters);
        int result = -1;
        Object customer_id = parameters.get("customer_id");
        if(customer_id != null && !"".equals(customer_id)){
            result = customerService.update(parameters);
        }else{
            result = customerService.add(parameters);
        }
//        int add = 1;
        response.setCharacterEncoding("utf-8");
        JSONObject json = new JSONObject();
        if(result > 0){
            json.put("success",true);
        }else{
            json.put("success",false);
        }
        try {
            PrintWriter writer = response.getWriter();
            writer.write(json.toJSONString());
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String allocation(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        Object obj = parameters.get("ids");
        if (obj instanceof String[]){
            String[] ids = (String[]) obj;
            System.out.println(Arrays.toString(ids));
            List<Map<String, Object>> maps = customerService.queryNameById(ids);
            System.out.println(maps);
            List<Map<String, Object>> users = userService.queryAllUsed();
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("customers",maps);
            request.setAttribute("users",users);
        }
        return SUCCESS;
    }

    public String search(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        convert(parameters);
        System.out.println(parameters);
        List<Map<String, Object>> customers = customerService.query(parameters);
        List<Map<String,Object>> types = customerService.queryTypes();
        List<Map<String,Object>> conditions = customerService.queryConditions();
        List<Map<String,Object>> sources = customerService.querySources();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("customers",customers);
        request.setAttribute("types",types);
        request.setAttribute("conditions",conditions);
        request.setAttribute("sources",sources);
        return SUCCESS;
    }

    private void convert(Map<String,Object> parameters){
        Set<String> keySet = parameters.keySet();
        for (String s : keySet) {
            Object o = parameters.get(s);
            if (o instanceof String []){
                String[] strs = (String[]) o;
                String value = strs[0];
                System.out.println(value);
//                try {
//                    value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
//                } catch (UnsupportedEncodingException e) {
//                    e.printStackTrace();
//                }
                parameters.put(s,value);
            }
        }
    }

    public String type(){
        List<Map<String, Object>> types = customerService.queryTypes();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("types",types);
        return SUCCESS;
    }

    public String source(){
        List<Map<String, Object>> sources = customerService.querySources();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("sources",sources);
        return SUCCESS;
    }

    public String condition(){
        List<Map<String, Object>> conditions = customerService.queryConditions();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("conditions",conditions);
        return SUCCESS;
    }




}
