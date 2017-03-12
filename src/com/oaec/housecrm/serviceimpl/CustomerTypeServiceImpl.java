package com.oaec.housecrm.serviceimpl;

import com.oaec.housecrm.dao.CustomerTypeDao;
import com.oaec.housecrm.service.CustomerTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/12.
 */
@Service("customerTypeService")
public class CustomerTypeServiceImpl implements CustomerTypeService {

    @Autowired
    private CustomerTypeDao customerTypeDao;

    @Override
    public List<Map<String,Object>> queryAll() {
        List<Map<String,Object>> types = customerTypeDao.queryAll();
        return types;
    }

    @Override
    public int update(Map<String, Object> parameters) {
        return customerTypeDao.update(parameters);
    }

    @Override
    public int delete(String type_id) {
        return customerTypeDao.delete(type_id);
    }

    @Override
    public int add(String type_name) {
        return customerTypeDao.add(type_name);
    }
}
