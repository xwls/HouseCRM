package com.oaec.housecrm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("springMailSender")
public class SpringMailSender {
    @Autowired
    private JavaMailSender javaMailSender;

    public void sendMail(SimpleMailMessage message){
        javaMailSender.send(message);
        System.out.println("发送成功!");
    }
}
