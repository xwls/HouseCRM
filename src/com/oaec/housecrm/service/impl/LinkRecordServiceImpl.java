package com.oaec.housecrm.service.impl;

import com.oaec.housecrm.dao.LinkRecordDao;
import com.oaec.housecrm.service.LinkRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/18.
 */
@Service("linkRecordService")
public class LinkRecordServiceImpl implements LinkRecordService {

    @Autowired
    private LinkRecordDao linkRecordDao;

    @Override
    public List<Map<String, Object>> getWhoLink(String whoLinkInput, String queryType) {
        return linkRecordDao.getWhoLink(whoLinkInput, queryType);
    }

    @Override
    public int add(Map<String, Object> linkRecordInfo) {
        return linkRecordDao.add(linkRecordInfo);
    }

    @Override
    public int delete(String record_id) {
        return linkRecordDao.delete(record_id);
    }

    @Override
    public List<Map<String, Object>> getLinkRecord(String days) {
        return linkRecordDao.getLinkRecord(days);
    }
}
