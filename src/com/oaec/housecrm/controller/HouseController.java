package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.HouseService;
import com.oaec.housecrm.service.HouseTypeService;
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
 * Created by Kevin on 2017/3/21.
 */
@Controller()
public class HouseController extends CommonController implements RequestAware {

    @Autowired
    private HouseService houseService;

    @Autowired
    private HouseTypeService houseTypeService;

    private Map<String, Object> requestMap;

    public String queryAll(){
//        String user_id = ServletActionContext.getRequest().getParameter("user_id");
        List<Map<String, Object>> houses = houseService.query("", ""/*, user_id*/);
        requestMap.put("houses",houses);
        return SUCCESS;
    }

    public void export(){
        List<Map<String, Object>> houses = houseService.query("", "");
        export("房屋信息",houses);
    }

    public String dialog(){
        List<Map<String, Object>> types = houseTypeService.query(null);
        requestMap.put("types",types);
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        if (parameters.containsKey("house_id")){
            String house_id = parameters.get("house_id").toString();
            Map<String, Object> house = houseService.queryById(house_id);
            System.out.println(house);
            requestMap.put("house",house);
        }
        return SUCCESS;
    }

    public void add(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        int result = 0;
        Map<String,Object>  userInfo = (Map<String, Object>) ActionContext.getContext().getSession().get("userInfo");
        Object user_id = userInfo.get("user_id");
        parameters.put("user_id",user_id);
        if ("".equals(parameters.get("house_id").toString().trim())){
            result = houseService.add(parameters);
        }else {
            result = houseService.update(parameters);
        }
        write(result > 0);
    }

    public void delete(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String house_id = request.getParameter("house_id");
        int delete = houseService.delete(house_id);
        write(delete > 0);
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
