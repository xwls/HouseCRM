package com.oaec.housecrm.service.impl;

import com.oaec.housecrm.dao.CustomerDao;
import com.oaec.housecrm.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/16.
 */
@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    public List<Map<String, Object>> queryAllUsed(boolean isAllocation) {
        return customerDao.queryAllUsed(isAllocation);
    }

    @Override
    public List<Map<String, Object>> queryAllNotAllocation() {
        return null;
    }

    @Override
    public int allocate(String customer_id, String user_id) {
        return customerDao.update(customer_id,user_id);
    }


    @Override
    public Map<String, Object> queryById(int id) {
        Map<String, Object> customer = customerDao.queryById(id);
        return customer;
    }


    @Override
    public int add(Map<String, Object> map) {
        return customerDao.add(map);
    }

    @Override
    public int update(Map<String, Object> map) {
        return customerDao.update(map);
    }

    @Override
    public int delete(String customer_id) {
        return customerDao.delete(customer_id);
    }

    @Override
    public List<Map<String, Object>> query(Map<String, Object> map) {
        return customerDao.query(map);
    }

    @Override
    public List<Map<String, Object>> queryNameById(String[] ids) {
        return customerDao.queryNameById(ids);
    }

    @Override
    public List<Map<String, Object>> getBirthday(String days) {
        return customerDao.getBirthday(days);
    }
}
