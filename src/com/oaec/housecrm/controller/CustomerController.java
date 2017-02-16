package com.oaec.housecrm.controller;

import com.oaec.housecrm.service.CustomerService;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/16.
 */
@WebServlet(urlPatterns = "/customer-list")
public class CustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(req.getServletContext());
        CustomerService customerService = webApplicationContext.getBean("customerService", CustomerService.class);
        List<Map<String, Object>> customers = customerService.query();
        req.setAttribute("customers",customers);
        req.getRequestDispatcher("/WEB-INF/pages/customer-list.jsp").forward(req,resp);
    }
}
