package com.oaec.housecrm.service.impl;

import com.oaec.housecrm.dao.CustomerConditionDao;
import com.oaec.housecrm.dao.CustomerTypeDao;
import com.oaec.housecrm.service.CustomerConditionService;
import com.oaec.housecrm.service.CustomerTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/12.
 */
@Service("customerConditionService")
public class CustomerConditionServiceImpl implements CustomerConditionService {

    @Autowired
    private CustomerConditionDao customerConditionDao;

    @Override
    public List<Map<String,Object>> queryAll() {
        List<Map<String,Object>> types = customerConditionDao.queryAll();
        return types;
    }

    @Override
    public Map<String, Object> queryById(String condition_id) {
        return customerConditionDao.queryById(condition_id);
    }

    @Override
    public int update(Map<String, Object> parameters) {
        return customerConditionDao.update(parameters);
    }

    @Override
    public int delete(String type_id) {
        return customerConditionDao.delete(type_id);
    }

    @Override
    public int add(Map<String, Object> parameters) {
        return customerConditionDao.add(parameters);
    }
}
