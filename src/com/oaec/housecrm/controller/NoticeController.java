package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.NoticeService;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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

	@Override
	public void setRequest(Map<String, Object> map) {
		this.requestMap = map;
	}
}
