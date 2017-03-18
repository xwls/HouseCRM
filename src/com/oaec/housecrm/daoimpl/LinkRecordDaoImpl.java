package com.oaec.housecrm.daoimpl;

import com.oaec.housecrm.dao.LinkRecordDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/18.
 */
@Repository("linkRecordDao")
public class LinkRecordDaoImpl implements LinkRecordDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> getWhoLink(String whoLinkInput, String queryType) {
        String sql = "";
        return null;
    }

    @Override
    public int add(Map<String, Object> linkRecordInfo) {
        return 0;
    }

    @Override
    public int delete(String record_id) {
        return 0;
    }
}
