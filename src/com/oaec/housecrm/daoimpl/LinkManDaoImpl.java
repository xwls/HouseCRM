package com.oaec.housecrm.daoimpl;

import com.oaec.housecrm.dao.LinkManDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/19.
 */
@Repository("linkManDao")
public class LinkManDaoImpl implements LinkManDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int add(Map<String, Object> linkMan) {
        String sql = "insert into customer_linkman(customer_id,linkman_name,linkman_age,linkman_sex,linkman_job,linkman_mobile,linkman_relation) values(?,?,?,?,?,?,?)";
        int update = jdbcTemplate.update(sql, linkMan.get("customer_id"), linkMan.get("linkman_name"), linkMan.get("linkman_age")
                , linkMan.get("linkman_sex"), linkMan.get("linkman_job"), linkMan.get("linkman_mobile"), linkMan.get("linkman_relation"));
        return update;
    }

    @Override
    public int update(Map<String, Object> linkMan) {
        String sql = "update  customer_linkman  set customer_id=?,  linkman_name=?,linkman_sex=?,linkman_job=? ,linkman_mobile=?, linkman_age=?,linkman_relation=?  where linkman_id=? ";
        int update = jdbcTemplate.update(sql, linkMan.get("customer_id"), linkMan.get("linkman_name"), linkMan.get("linkman_sex"), linkMan.get("linkman_job"), linkMan.get("linkman_mobile"), linkMan.get("linkman_age"), linkMan.get("linkman_relation"), linkMan.get("linkman_id"));
        return update;
    }

    @Override
    public int delete(String linkMan_id) {
        String sql = "update customer_linkman set  is_used = '0' where linkman_id =?";
        int update = jdbcTemplate.update(sql, linkMan_id);
        return update;
    }

    @Override
    public List<Map<String, Object>> queryAll(String linkManInput, String queryType) {
        StringBuilder sql = new StringBuilder("select a.*,b.customer_name from customer_linkman a,customer_info b where a.customer_id = b.customer_id and a.is_used =1");
        if (StringUtils.isNotBlank(linkManInput) && StringUtils.isNotBlank(queryType)){
            if ("1".equals(queryType)){
                sql.append(" and  linkman_name  like ? ");
            }else if ("2".equals(queryType)){
                sql.append(" and  b.customer_name  like ? ");
            }
            List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql.toString(), linkManInput);
            return maps;
        }
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql.toString());
        return maps;
    }

    @Override
    public Map<String, Object> queryById(String linkMan_id) {
        String sql = "select a.*,b.customer_name from customer_linkman a,customer_info b where a.customer_id = b.customer_id and a.is_used =1 and  a.linkman_id =?";
        Map<String, Object> linkMan = jdbcTemplate.queryForMap(sql, linkMan_id);
        return linkMan;
    }
}
