package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.CustomerCareService;
import com.oaec.housecrm.service.CustomerService;
import com.oaec.housecrm.service.LinkRecordService;
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

    @Autowired
    private CustomerCareService customerCareService;

    @Autowired
    private LinkRecordService linkRecordService;

    @Autowired
    private CustomerService customerService;

    private Map<String,Object> requestMap;

    @Override
    public String execute() throws Exception {
        List<Map<String, Object>> notices = noticeService.getNotice();
        List<Map<String, Object>> customerCares = customerCareService.getCustomerCare("7");
        List<Map<String, Object>> linkRecords = linkRecordService.getLinkRecords("7");
        List<Map<String, Object>> birthdays = customerService.getBirthday("7");
        requestMap.put("notices",notices);
        requestMap.put("customerCares",customerCares);
        requestMap.put("linkRecords",linkRecords);
        requestMap.put("birthdays",birthdays);
        return SUCCESS;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
