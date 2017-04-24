package com.oaec.housecrm.service.impl;

import com.oaec.housecrm.dao.EmailDao;
import com.oaec.housecrm.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/4/24.
 */
@Service("emailService")
public class EmailServiceImpl implements EmailService {

    @Autowired
    private EmailDao emailDao;

    @Override
    public int add(Map<String, Object> map) {
        return emailDao.add(map);
    }

    @Override
    public List<Map<String, Object>> queryEmail(String user_id, boolean isSend) {
        return emailDao.queryEmail(user_id,isSend);
    }

    @Override
    public Map<String, Object> queryById(String email_id) {
        return emailDao.queryById(email_id);
    }

    @Override
    public int update(Map<String, Object> map) {
        return emailDao.update(map);
    }
}
