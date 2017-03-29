package com.oaec.housecrm.service.impl;

import com.oaec.housecrm.dao.HouseDao;
import com.oaec.housecrm.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/21.
 */
@Service("houseService")
public class HouseServiceImpl implements HouseService {

    @Autowired
    private HouseDao houseDao;

    @Override
    public int add(Map<String, Object> houseMap) {
        return houseDao.add(houseMap);
    }

    @Override
    public int delete(String house_id) {
        return houseDao.delete(house_id);
    }

    @Override
    public int update(Map<String, Object> houseMap) {
        return houseDao.update(houseMap);
    }

    @Override
    public Map<String, Object> queryById(String house_id) {
        return houseDao.queryById(house_id);
    }

    @Override
    public List<Map<String, Object>> query(String houseInput, String queryType, String userId) {
        return houseDao.query(houseInput, queryType, userId);
    }
}
