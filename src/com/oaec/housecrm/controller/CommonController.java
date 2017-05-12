package com.oaec.housecrm.controller;

import com.alibaba.fastjson.JSONObject;
import com.oaec.housecrm.util.ParameterUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

    protected void export(String fileName,List<Map<String,Object>> data){
        String path = ServletActionContext.getRequest().getServletContext().getRealPath("/static/tempFile");
        File temp= new File(path+"/"+"temp.xls");
        HSSFWorkbook workbook = null;
        try {
            workbook = new HSSFWorkbook();
            HSSFSheet sheet0 = workbook.createSheet(fileName);

            HSSFRow row = sheet0.createRow(0);
            Map<String, Object> map = data.get(0);
            Set<Map.Entry<String, Object>> entries = map.entrySet();
            List<String> headers = new ArrayList<>();
            for (Map.Entry<String, Object> entry : entries) {
                headers.add(entry.getKey());
            }
            for (int i = 0; i < headers.size(); i++){
                HSSFCell cell = row.createCell(i);
                cell.setCellValue(headers.get(i));
            }
            for (int i = 0; i < data.size(); i++){
                HSSFRow row1 = sheet0.createRow(i+1);
                Map<String, Object> map1 = data.get(i);
                for (int j = 0; j < headers.size(); j++){
                    HSSFCell cell = row1.createCell(j);
                    cell.setCellValue(map1.get(headers.get(j)).toString());
                }
            }
            workbook.write(new FileOutputStream(temp));
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setCharacterEncoding("UTF-8");
            response.setHeader("content-disposition", "attachment;filename=" +new String((fileName+".xls").getBytes("UTF-8"),"ISO8859-1"));
            ServletOutputStream os = response.getOutputStream();
            FileInputStream is = new FileInputStream(temp);
            byte[] buf = new byte[512];
            int len = 0;
            while ((len = is.read(buf)) != -1){
                os.write(buf,0,len);
            }
            is.close();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
