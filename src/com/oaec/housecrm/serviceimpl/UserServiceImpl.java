package com.oaec.housecrm.serviceimpl;

import com.oaec.housecrm.dao.UserDao;
import com.oaec.housecrm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by Kevin on 2017/2/21.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public Map<String, Object> login(String userName, String password) {
        return userDao.queryByNumAndPw(userName, password);
    }

}
