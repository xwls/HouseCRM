package com.oaec.housecrm.service.impl;

import com.oaec.housecrm.dao.UserDao;
import com.oaec.housecrm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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

    @Override
    public List<Map<String, Object>> queryAllUsed() {
        return userDao.queryAllUsed();
    }

    @Override
    public int add(Map<String, Object> user) {
        return userDao.add(user);
    }

    @Override
    public int update(Map<String, Object> user) {
        return userDao.update(user);
    }

    @Override
    public int delete(String user_id) {
        return userDao.delete(user_id);
    }

    @Override
    public Map<String, Object> queryById(String user_id) {
        return userDao.queryById(user_id);
    }

}
