package com.oaec.housecrm.serviceimpl;

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
    public List<Map<String, Object>> queryAllUsed() {
        System.out.println("CustomerServiceImpl.query");
        return customerDao.queryAllUsed();
    }

    @Override
    public List<String> queryTypes() {
        List<String> types = customerDao.queryTypes();
        return types;
    }

    @Override
    public Map<String, Object> queryById(int id) {
        Map<String, Object> customer = customerDao.queryById(id);
        return customer;
    }

    @Override
    public List<String> queryConditions() {
        List<String> conditions = customerDao.queryConditions();
        return conditions;
    }

    @Override
    public List<String> querySources() {
        List<String> sources = customerDao.querySources();
        return sources;
    }
}