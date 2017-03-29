package com.oaec.housecrm.service.impl;

import com.oaec.housecrm.dao.LinkManDao;
import com.oaec.housecrm.service.LinkManService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/19.
 */

@Service("linkManService")
public class LinkManServiceImpl implements LinkManService {

    @Autowired
    private LinkManDao linkManDao;

    @Override
    public int add(Map<String, Object> linkMan) {
        return linkManDao.add(linkMan);
    }

    @Override
    public int update(Map<String, Object> linkMan) {
        return linkManDao.update(linkMan);
    }

    @Override
    public int delete(String linkMan_id) {
        return linkManDao.delete(linkMan_id);
    }

    @Override
    public List<Map<String, Object>> queryAll(String linkManInput, String queryType) {
        return linkManDao.queryAll(linkManInput, queryType);
    }

    @Override
    public Map<String, Object> queryById(String linkMan_id) {
        return linkManDao.queryById(linkMan_id);
    }
}
