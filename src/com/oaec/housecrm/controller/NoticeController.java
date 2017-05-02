package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.NoticeService;
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
 * Created by Kevin on 2017/3/22.
 */
@Controller()
public class NoticeController extends CommonController implements RequestAware {

	@Autowired
	private NoticeService noticeService;

	Map<String, Object> requestMap;

	public String queryAll(){
		List<Map<String, Object>> notices = noticeService.query("", "");
		requestMap.put("notices",notices);
		return SUCCESS;
	}

	public String dialog(){
		return SUCCESS;
	}

    public void add(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        int result = 0;
        if ("".equals(parameters.get("notice_id").toString().trim())){
            Map<String,Object> userInfo = (Map<String, Object>) ServletActionContext.getContext().getSession().get("userInfo");
            Object user_id = userInfo.get("user_id");
            parameters.put("user_id",user_id);
            parameters.put("notice_time",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            result = noticeService.add(parameters);
        }else {
            result = noticeService.update(parameters);
        }
        write(result > 0);
    }

    public void delete(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String notice_id = request.getParameter("notice_id");
        int delete = noticeService.delete(notice_id);
        write(delete > 0);
    }

	@Override
	public void setRequest(Map<String, Object> map) {
		this.requestMap = map;
	}
}
