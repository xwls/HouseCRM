package com.oaec.housecrm.controller;

import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Kevin on 2017/3/13.
 */
public class CommonController extends ActionSupport {

    protected void write(boolean success){
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success",success);
        write(jsonObject.toJSONString());
    }

    protected void write(String json){
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setHeader("Content-type","text/html;charset=UTF-8");
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        writer.write(json);
        writer.flush();
        writer.close();
    }
}
