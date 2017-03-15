package com.oaec.housecrm.serviceimpl;

import com.oaec.housecrm.dao.CustomerSourceDao;
import com.oaec.housecrm.service.CustomerSourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/12.
 */
@Service("customerSourceService")
public class CustomerSourceServiceImpl implements CustomerSourceService {

    @Autowired
    private CustomerSourceDao customerSourceDao;

    @Override
    public List<Map<String,Object>> queryAll() {
        List<Map<String,Object>> sources = customerSourceDao.queryAll();
        return sources;
    }

    @Override
    public int update(Map<String, Object> parameters) {
        return customerSourceDao.update(parameters);
    }

    @Override
    public int delete(String source_id) {
        return customerSourceDao.delete(source_id);
    }

    @Override
    public int add(String source_name) {
        return customerSourceDao.add(source_name);
    }
}
