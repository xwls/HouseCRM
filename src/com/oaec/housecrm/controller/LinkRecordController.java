package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.LinkRecordService;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/18.
 */
@Controller
public class LinkRecordController extends CommonController implements RequestAware{

    @Autowired
    private LinkRecordService linkRecordService;

    private Map<String,Object> request;

    public String queryAll(){
        List<Map<String, Object>> linkRecords = linkRecordService.getWhoLink(null, null);
        request.put("linkRecords",linkRecords);
        return SUCCESS;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.request = map;
    }
}
