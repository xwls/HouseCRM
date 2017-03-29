package com.oaec.housecrm.service.impl;

import com.oaec.housecrm.dao.CustomerCareDao;
import com.oaec.housecrm.service.CustomerCareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/18.
 */
@Service("customerCareService")
public class CustomerCareServiceImpl implements CustomerCareService {
    @Autowired
    private CustomerCareDao customerCareDao;
    @Override
    public List<Map<String, Object>> getList(String customerInput, String queryType) {
        return customerCareDao.getList(customerInput,queryType);
    }

    @Override
    public Map<String, Object> getCare(String care_id) {
        return customerCareDao.getCare(care_id);
    }

    @Override
    public int add(Map<String, Object> careInfo) {
        return customerCareDao.add(careInfo);
    }

    @Override
    public int delete(String care_id) {
        return customerCareDao.delete(care_id);
    }

    @Override
    public int update(Map<String, Object> careInfo) {
        return customerCareDao.update(careInfo);
    }

    @Override
    public List<Map<String, Object>> getCustomerCare(String days) {
        return customerCareDao.getCustomerCare(days);
    }
}
