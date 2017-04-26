package com.oaec.housecrm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.oaec.housecrm.service.*;
import com.oaec.housecrm.util.ParameterUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 * Created by Kevin on 2017/2/16.
 */
@Controller
public class CustomerController extends CommonController{

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustomerTypeService customerTypeService;

    @Autowired
    private CustomerConditionService customerConditionService;

    @Autowired
    private CustomerSourceService customerSourceService;

    @Autowired
    private UserService userService;

    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    /**
     * 查询所有的有效客户
     * @return
     */
    public String queryAllUsed(){
        List<Map<String, Object>> customers = customerService.queryAllUsed(true);
        List<Map<String,Object>> types = customerTypeService.queryAll();
        List<Map<String,Object>> conditions = customerConditionService.queryAll();
        List<Map<String,Object>> sources = customerSourceService.queryAll();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("customers",customers);
        request.setAttribute("types",types);
        request.setAttribute("conditions",conditions);
        request.setAttribute("sources",sources);
        return "success";
    }

    /**
     * 所有未分配的
     * @return
     */
    public String queryAllNotAllocation(){
        List<Map<String, Object>> customers = customerService.queryAllUsed(false);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("customers",customers);
        return SUCCESS;
    }

    /**
     * Ajax查询客户详细信息
     * 返回JSON
     */
    public void detail(){
        Map<String, Object> customer = customerService.queryById(id);
        Set<Map.Entry<String, Object>> entries = customer.entrySet();
        for (Map.Entry<String,Object> entry : entries){
            if (entry.getValue() == null){
                entry.setValue("");
            }
            entry.setValue(entry.getValue().toString().trim());
            String key = entry.getKey();
            if(key.equals("birth_day")){
                String value = entry.getValue().toString().substring(0, 10);
                entry.setValue(value);
            }
            if(key.equals("customer_addtime") || key.equals("customer_changtime")){
                String value = entry.getValue().toString();
                if(value != null && !"".equals(value)){
                    entry.setValue(value.substring(0, 19));
                }
            }
        }
        String json = JSON.toJSONString(customer);
        write(json);
    }

    /**
     * 添加修改客户信息
     * @return
     */
    public void update(){
        HttpServletResponse response = ServletActionContext.getResponse();
        ActionContext actionContext = ActionContext.getContext();
        Map<String, Object> parameters = actionContext.getParameters();
        System.out.println(parameters);
        //由于获取到的参数都是String数组类型，需要将数组取出第0个，才是我们需要的参数
        ParameterUtil.convert(parameters);
        //获取session中用户的信息
        Map<String, Object> session = actionContext.getSession();
        Object o = session.get("userInfo");
        if (o instanceof Map){
            Map<String,Object> userInfo = (Map<String, Object>) o;
            parameters.put("user_id",userInfo.get("user_id"));
            parameters.put("customer_addman",userInfo.get("user_name"));
        }
        System.out.println(parameters);
        int result = -1;
        Object customer_id = parameters.get("customer_id");
        if(customer_id != null && !"".equals(customer_id)){
            result = customerService.update(parameters);
        }else{
            result = customerService.add(parameters);
        }
//        int add = 1;
        response.setCharacterEncoding("utf-8");
        write(result > 0);
    }

    public String allocation(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        Object obj = parameters.get("ids");
        if (obj instanceof String[]){
            String[] ids = (String[]) obj;
            System.out.println(Arrays.toString(ids));
            List<Map<String, Object>> maps = customerService.queryNameById(ids);
            System.out.println(maps);
            List<Map<String, Object>> users = userService.queryAllUsed();
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("customers",maps);
            request.setAttribute("users",users);
        }
        return SUCCESS;
    }

    public String search(){
        Map<String, Object> parameters = ActionContext.getContext().getParameters();
        ParameterUtil.convert(parameters);
        System.out.println(parameters);
        List<Map<String, Object>> customers = customerService.query(parameters);
        List<Map<String,Object>> types = customerTypeService.queryAll();
        List<Map<String,Object>> conditions = customerConditionService.queryAll();
        List<Map<String,Object>> sources = customerSourceService.queryAll();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("customers",customers);
        request.setAttribute("types",types);
        request.setAttribute("conditions",conditions);
        request.setAttribute("sources",sources);
        return SUCCESS;
    }

    public void allocate(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String customer_id = request.getParameter("customer_id");
        String user_id = request.getParameter("user_id");
        System.out.println(customer_id+"---"+user_id);
        int allocate = customerService.allocate(customer_id, user_id);
        write(allocate > 0);
    }

    public void export(){
        String path = ServletActionContext.getRequest().getServletContext().getRealPath("/static/tempFile");
        File temp= new File(path+"/"+"customerExpTemp.xls");
        HSSFWorkbook workbook = null;
        try {
            workbook = new HSSFWorkbook();
            HSSFSheet sheet0 = workbook.createSheet("客户信息");
            //查询客户信息
            Map<String, Object> parameters = ActionContext.getContext().getParameters();
            ParameterUtil.convert(parameters);
            System.out.println(parameters);
            List<Map<String, Object>> customers = customerService.query(parameters);

            HSSFRow row = sheet0.createRow(0);
            Map<String, Object> map = customers.get(0);
            Set<Map.Entry<String, Object>> entries = map.entrySet();
            List<String> headers = new ArrayList<>();
            for (Map.Entry<String, Object> entry : entries) {
                headers.add(entry.getKey());
            }
            for (int i = 0; i < headers.size(); i++){
                HSSFCell cell = row.createCell(i);
                cell.setCellValue(headers.get(i));
            }
            for (int i = 0; i < customers.size(); i++){
                HSSFRow row1 = sheet0.createRow(i+1);
                Map<String, Object> map1 = customers.get(i);
                for (int j = 0; j < headers.size(); j++){
                    HSSFCell cell = row1.createCell(j);
                    cell.setCellValue(map1.get(headers.get(j)).toString());
                }
            }
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
