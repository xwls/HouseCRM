package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.CustomerService;
import com.oaec.housecrm.service.LinkManService;
import com.oaec.housecrm.util.ParameterUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/19.
 */
@Controller
public class LinkManController extends CommonController implements RequestAware{

    @Autowired
    private LinkManService linkManService;

    @Autowired
    private CustomerService customerService;

    private Map<String,Object> requestMap;
    public String queryAll(){
        List<Map<String, Object>> linkMans = linkManService.queryAll("", "");
        requestMap.put("linkMans",linkMans);
        return SUCCESS;
    }

    public String linkManDialog(){
        ActionContext context = ServletActionContext.getContext();
        Map<String,Object> userInfo = (Map<String, Object>) context.getSession().get("userInfo");
        List<Map<String, Object>> customers = customerService.query(userInfo);
        requestMap.put("customers",customers);
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        if (parameters.containsKey("linkman_id")){
            String linkman_id = parameters.get("linkman_id").toString();
            Map<String, Object> linkman = linkManService.queryById(linkman_id);
            System.out.println(linkman);
            requestMap.put("linkman",linkman);
        }
        return SUCCESS;
    }

    public void add(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        int result = 0;
        if ("".equals(parameters.get("linkman_id").toString().trim())){
            result = linkManService.add(parameters);
        }else {
            result = linkManService.update(parameters);
        }
        write(result > 0);
    }

    public void delete(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String linkman_id = request.getParameter("linkman_id");
        int delete = linkManService.delete(linkman_id);
        write(delete > 0);
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
