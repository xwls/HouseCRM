package com.oaec.housecrm.test;

import com.oaec.housecrm.service.CustomerService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/16.
 */
public class JDBCTest {
    @Test
    public void test1(){
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        CustomerService customerService = ctx.getBean("customerService", CustomerService.class);
        List<Map<String, Object>> query = customerService.query();
        for (Iterator<Map<String, Object>> iterator = query.iterator(); iterator.hasNext(); ) {
            Map<String, Object> next = iterator.next();
            System.out.println(next);
        }
    }
}
