package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.CustomerService;
import com.oaec.housecrm.service.LinkRecordService;
import com.oaec.housecrm.util.ParameterUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/18.
 */
@Controller
public class LinkRecordController extends CommonController implements RequestAware{

    @Autowired
    private LinkRecordService linkRecordService;

    @Autowired
    private CustomerService customerService;

    private Map<String,Object> requestMap;

    public String queryAll(){
        List<Map<String, Object>> linkRecords = linkRecordService.getWhoLink(null, null);
        requestMap.put("linkRecords",linkRecords);
        return SUCCESS;
    }

    public String linkRecordDialog(){
        ActionContext context = ServletActionContext.getContext();
        Map<String,Object> userInfo = (Map<String, Object>) context.getSession().get("userInfo");
        List<Map<String, Object>> customers = customerService.query(userInfo);
        requestMap.put("customers",customers);
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        if (parameters.containsKey("record_id")){
            String record_id = parameters.get("record_id").toString();
            Map<String, Object> record = linkRecordService.getLinkRecord(record_id);
            System.out.println(record);
            requestMap.put("record",record);
        }
        return SUCCESS;
    }

    public void add(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        parameters.put("link_time",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        Map<String,Object> userInfo = (Map<String, Object>) ServletActionContext.getContext().getSession().get("userInfo");
        Object care_people = userInfo.get("user_name");
        parameters.put("who_link",care_people);
        System.out.println(parameters);
        int result = 0;
        if ("".equals(parameters.get("record_id").toString().trim())){
            result = linkRecordService.add(parameters);
        }else {
            result = linkRecordService.update(parameters);
        }
        write(result > 0);
    }

    public void delete(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String record_id = request.getParameter("record_id");
        int delete = linkRecordService.delete(record_id);
        write(delete > 0);
    }

    public void export(){
        List<Map<String, Object>> linkRecords = linkRecordService.getWhoLink(null, null);
        export("联系记录",linkRecords);
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.requestMap = map;
    }
}
