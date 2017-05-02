package com.oaec.housecrm.service.impl;

import com.oaec.housecrm.dao.HouseTypeDao;
import com.oaec.housecrm.service.HouseTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/21.
 */
@Service("houseTypeService")
public class HouseTypeServiceImpl implements HouseTypeService {

    @Autowired
    private HouseTypeDao houseTypeDao;

    @Override
    public List<Map<String, Object>> query(String houseTypeName) {
        return houseTypeDao.query(houseTypeName);
    }

    @Override
    public int add(String houseTypeName) {
        return houseTypeDao.add(houseTypeName);
    }

    @Override
    public int delete(String houseId) {
        return houseTypeDao.delete(houseId);
    }

    @Override
    public int update(Map<String, Object> houseTypeInfo) {
        return houseTypeDao.update(houseTypeInfo);
    }
}
