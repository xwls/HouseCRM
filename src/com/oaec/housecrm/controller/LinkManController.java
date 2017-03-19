package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.LinkManService;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/19.
 */
@Controller
public class LinkManController extends CommonController implements RequestAware{

    @Autowired
    private LinkManService linkManService;

    private Map<String,Object> requestMap;
    public String queryAll(){
        List<Map<String, Object>> linkMans = linkManService.queryAll("", "");
        requestMap.put("linkMans",linkMans);
        return SUCCESS;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
