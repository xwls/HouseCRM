package com.oaec.housecrm.controller;

import com.opensymphony.xwork2.ActionContext;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by Kevin on 2017/4/26.
 */
@Controller
public class ExportController extends CommonController{

    public void export() throws IOException {
        String path = ServletActionContext.getRequest().getServletContext().getRealPath("/static/tempFile");
        File temp= new File(path+"/"+"customerExpTemp.xls");
        HSSFWorkbook workbook = null;
        try {
            workbook = new HSSFWorkbook();
            HSSFSheet sheet0 = workbook.createSheet("SHEET0");
            HSSFRow row = sheet0.createRow(0);
            HSSFCell cell = row.createCell(0);
            cell.setCellValue("HellWorld");
            workbook.write(new FileOutputStream(temp));
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setCharacterEncoding("UTF-8");
            response.setHeader("content-disposition", "attachment;filename=" +new String("客户信息.xls".getBytes("UTF-8"),"ISO8859-1"));
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
