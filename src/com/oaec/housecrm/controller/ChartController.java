package com.oaec.housecrm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.oaec.housecrm.service.ChartService;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/4/24.
 */
@Controller
public class ChartController extends CommonController{

    @Autowired
    private ChartService chartService;

    public void sexCount(){
        List<Map<String, Object>> sexs = chartService.querySexCount();
        write(JSON.toJSONString(sexs));
    }

    public void isUsed(){
        List<Map<String, Object>> maps = chartService.queryIsUsed();
        write(JSON.toJSONString(maps));
    }

    public void type(){
        List<Map<String, Object>> maps = chartService.queryType();
        write(JSON.toJSONString(maps));
    }

    public void condition(){
        List<Map<String, Object>> maps = chartService.queryCondition();
        write(JSON.toJSONString(maps));
    }

    public void source(){
        List<Map<String, Object>> maps = chartService.querySource();
        write(JSON.toJSONString(maps));
    }

    public void user(){
        List<Map<String, Object>> maps = chartService.queryUsers();
        write(JSON.toJSONString(maps));
    }

    public void diploma(){
        List<Map<String, Object>> maps = chartService.queryDiploma();
        write(JSON.toJSONString(maps));
    }


}
