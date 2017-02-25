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
    public List<Map<String, Object>> queryAllUsed(boolean isAllocation) {
        return customerDao.queryAllUsed(isAllocation);
    }

    @Override
    public List<Map<String, Object>> queryAllNotAllocation() {
        return null;
    }

    @Override
    public List<Map<String,Object>> queryTypes() {
        List<Map<String,Object>> types = customerDao.queryTypes();
        return types;
    }

    @Override
    public Map<String, Object> queryById(int id) {
        Map<String, Object> customer = customerDao.queryById(id);
        return customer;
    }

    @Override
    public List<Map<String,Object>> queryConditions() {
        List<Map<String,Object>> conditions = customerDao.queryConditions();
        return conditions;
    }

    @Override
    public List<Map<String,Object>> querySources() {
        List<Map<String,Object>> sources = customerDao.querySources();
        return sources;
    }

    @Override
    public int add(Map<String, Object> map) {
        return customerDao.add(map);
    }

    @Override
    public int update(Map<String, Object> map) {
        return customerDao.update(map);
    }
}
