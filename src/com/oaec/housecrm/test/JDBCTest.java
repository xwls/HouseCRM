package com.oaec.housecrm.test;

import com.oaec.housecrm.dao.CustomerDao;
import com.oaec.housecrm.daoimpl.CustomerDaoImpl;
import com.oaec.housecrm.service.CustomerService;
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
Scanner input = new Scanner(System.in);
System.out.println("1.查询");
System.out.println("2.取款");
System.out.println("3.转账");
System.out.println("--------");
System.out.println("选择你的操作");
int choose = input.nextInt();
switch(choose){
    case 1:
        System.out.println("你选择的是查询");
        break;
    case 2:
        System.out.println("你选择的是取款");
        break;
    case 3:
        System.out.println("你选择的是转账");
        break;
    default:
        System.out.println("输入有误");
    break;
}
    }


}
