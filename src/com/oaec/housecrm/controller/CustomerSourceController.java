package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.CustomerSourceService;
import com.oaec.housecrm.util.ParameterUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/12.
 */
@Controller("customerSourceController")
public class CustomerSourceController extends CommonController {

    @Autowired
    private CustomerSourceService customerSourceService;

    public String queryAll(){
        List<Map<String, Object>> sources = customerSourceService.queryAll();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("sources",sources);
        return SUCCESS;
    }

    public void update() throws IOException {
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        int update = customerSourceService.update(parameters);
        write(update > 0);
    }

    public void delete() throws IOException {
        String source_id = ServletActionContext.getRequest().getParameter("source_id");
        int delete = customerSourceService.delete(source_id);
        write(delete > 0);
    }

    public void add() throws IOException {
        String source_name = ServletActionContext.getRequest().getParameter("source_name");
        int add = customerSourceService.add(source_name);
        write(add > 0);
    }
}
