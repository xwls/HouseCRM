package com.oaec.housecrm.daoimpl;

import com.oaec.housecrm.dao.LinkRecordDao;
import org.apache.commons.lang3.StringUtils;
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
        StringBuilder sql = new StringBuilder("select a.record_id,a.customer_id,from_unixtime(unix_timestamp(a.link_time),'%Y-%m-%d') as link_time,a.who_link,a.link_type,a.link_theme,from_unixtime(unix_timestamp(a.link_nexttime),'%Y-%m-%d') as link_nexttime,a.link_remark,a.is_used,b.customer_name from customer_linkreord a ,customer_info b where  a.customer_id = b.customer_id ");
        if (StringUtils.isNotBlank(whoLinkInput)){
            if ("1".equals(queryType)){
                sql.append(" and  b.customer_name  like ? ");
            }else if ("2".equals(queryType)){
                sql.append(" and  link_theme  like ?　");
            }else if ("3".equals(queryType)){
                sql.append(" and  link_type  like ?　");
            }
            List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql.toString(), whoLinkInput);
            return maps;
        }
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql.toString());
        return maps;
    }

    @Override
    public int add(Map<String, Object> linkRecordInfo) {
        String sql = "insert into customer_linkreord (customer_id,link_time,who_link,link_type,link_theme,link_nexttime,link_remark) values(?,?,?,?,?,?,?)";
        int update = jdbcTemplate.update(sql, linkRecordInfo.get("customer_id"), linkRecordInfo.get("link_time"), linkRecordInfo.get("who_link")
                , linkRecordInfo.get("link_type"), linkRecordInfo.get("link_theme"), linkRecordInfo.get("link_nexttime"), linkRecordInfo.get("link_remark"));
        return update;
    }

    @Override
    public int delete(String record_id) {
        String sql = "update customer_linkrecord SET  is_used = '0' WHERE record_id = ?";
        int update = jdbcTemplate.update(sql, record_id);
        return update;
    }
}
