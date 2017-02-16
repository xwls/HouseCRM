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
    public List<Map<String, Object>> query() {
        System.out.println("CustomerServiceImpl.query");
        return customerDao.query();
    }
}
