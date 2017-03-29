package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.NoticeService;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/28.
 */
@Controller
public class WelcomeController extends CommonController implements RequestAware{

    @Autowired
    private NoticeService noticeService;

    private Map<String,Object> requestMap;

    @Override
    public String execute() throws Exception {
        List<Map<String, Object>> notices = noticeService.getNotice();
        requestMap.put("notices",notices);
        return SUCCESS;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
