package com.oaec.housecrm.service.impl;

import com.oaec.housecrm.dao.ChartDao;
import com.oaec.housecrm.service.ChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/4/24.
 */
@Service("ChartService")
public class ChartServiceImpl implements ChartService {

    @Autowired
    private ChartDao chartDao;

    @Override
    public List<Map<String, Object>> querySexCount() {
        return chartDao.querySexCount();
    }

    @Override
    public List<Map<String, Object>> queryIsUsed() {
        return chartDao.queryIsUsed();
    }

    @Override
    public List<Map<String, Object>> queryType() {
        return chartDao.queryType();
    }

    @Override
    public List<Map<String, Object>> queryCondition() {
        return chartDao.queryCondition();
    }

    @Override
    public List<Map<String, Object>> querySource() {
        return chartDao.querySource();
    }

    @Override
    public List<Map<String, Object>> queryUsers() {
        return chartDao.queryUsers();
    }

    @Override
    public List<Map<String, Object>> queryDiploma() {
        return chartDao.queryDiploma();
    }
}
