package com.oaec.housecrm.dao.impl;

import com.oaec.housecrm.dao.CustomerCareDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/18.
 */
@Repository("customerCareDao")
public class CustomerCareDaoImpl implements CustomerCareDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> getList(String customerInput, String queryType) {
        StringBuilder sql = new StringBuilder("select a.*,b.customer_name from customer_care a,customer_info b where  a.customer_id = b.customer_id  and  a.is_used=1 ");
        if (StringUtils.isNotEmpty(queryType.trim())) {
            if ("1".equals(queryType)){
                sql.append(" and  b.customer_name  like ? ");
            }else if("2".equals(queryType.trim())){
                sql.append(" and  a.care_theme  like ? ");
            }else if("3".equals(queryType.trim())){
                sql.append(" and  a.care_way  like ? ");
            }
            List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql.toString(), "%"+customerInput+"%");
            return maps;
        }
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql.toString());
        return maps;
    }

    @Override
    public Map<String, Object> getCare(String care_id) {
        String sql = "select a.*,b.customer_name from customer_care a,customer_info b where a.customer_id=b.customer_id and care_id=? and a.is_used=1";
        Map<String, Object> map = jdbcTemplate.queryForMap(sql, care_id);
        return map;
    }

    @Override
    public int add(Map<String, Object> map) {
        String sql = "insert into customer_care (care_theme,customer_id,care_time,care_nexttime,care_people,care_way,care_remark,is_used)  values(?,?,?,?,?,?,?,1)";
        int update = jdbcTemplate.update(sql, map.get("care_theme"), map.get("customer_id"), map.get("care_time"), map.get("care_nexttime"), map.get("care_people"), map.get("care_way"), map.get("care_remark"));
        return update;
    }

    @Override
    public int delete(String care_id) {
        String sql = "update customer_care set is_used=0 where care_id=?";
        int update = jdbcTemplate.update(sql, care_id);
        return update;
    }

    @Override
    public int update(Map<String, Object> map) {
        String sql = "update customer_care  set care_theme=?,care_way=?,customer_id=?,care_time=?,care_nexttime=?,care_remark=?, care_people=? where care_id=?";
        int update = jdbcTemplate.update(sql, map.get("care_theme"), map.get("care_way"), map.get("customer_id"),
                map.get("care_time"), map.get("care_nexttime"), map.get("care_remark"), map.get("care_people"), map.get("care_id"));
        return update;
    }

    @Override
    public List<Map<String, Object>> getCustomerCare(String days) {
        String sql = "select a.*,b.customer_name from customer_care  a,customer_info b where a.customer_id=b.customer_id and  a.is_used='1'  and TO_DAYS(a.care_nexttime) - TO_DAYS(now())>0  and  TO_DAYS(a.care_nexttime) - TO_DAYS(now())<= ?";
	    List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql, days);
	    return maps;
    }
}
