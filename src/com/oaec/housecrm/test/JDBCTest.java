package com.oaec.housecrm.test;

import com.oaec.housecrm.dao.CustomerDao;
import com.oaec.housecrm.daoimpl.CustomerDaoImpl;
import com.oaec.housecrm.service.CustomerService;
import com.alibaba.druid.util.StringUtils;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

/**
 * Created by Kevin on 2017/2/16.
 */
public class JDBCTest {
    @Test
    public void test1(){
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update("123456".getBytes());
            byte[] digest = md5.digest();
            String s = new BigInteger(1, md5.digest()).toString(16);
            System.out.println(s);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void test2(){

    }


}
