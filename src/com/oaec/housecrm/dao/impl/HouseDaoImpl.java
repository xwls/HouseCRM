package com.oaec.housecrm.dao.impl;

import com.oaec.housecrm.dao.HouseDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/20.
 */
@Repository("houseDao")
public class HouseDaoImpl implements HouseDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int add(Map<String, Object> houseMap) {
        String sql = "insert into house_info (type_id,user_id, house_address,house_price,house_ambient) values(?,?,?,?,?)";
        int update = jdbcTemplate.update(sql, houseMap.get("type_id"), houseMap.get("user_id"), houseMap.get("house_address"), houseMap.get("house_price"), houseMap.get("house_ambient"));
        return update;
    }

    @Override
    public int delete(String house_id) {
        String sql = "update house_info set is_used= '0' where house_id=? ";
        int update = jdbcTemplate.update(sql, house_id);
        return update;
    }

    @Override
    public int update(Map<String, Object> houseMap) {
        String sql = "update  house_info  set type_id=?,user_id=?,house_address=?,house_price=?,house_ambient=? ,is_used='1' where house_id=? ";
        int update = jdbcTemplate.update(sql, houseMap.get("type_id"), houseMap.get("user_id"), houseMap.get("house_address"), houseMap.get("house_price"), houseMap.get("house_ambient"), houseMap.get("house_id"));
        return update;
    }

    @Override
    public Map<String, Object> queryById(String house_id) {
        String sql = "select a.*,b.type_name,c.user_name from house_info a ,house_type b , user_info c  where  a.type_id = b.type_id  and  a.user_id = c.user_id and a.is_used =1 and house_id = ?";
        Map<String, Object> map = jdbcTemplate.queryForMap(sql, house_id);
        return map;
    }

    @Override
    public List<Map<String, Object>> query(String houseInput, String queryType/*, String userId*/) {
        StringBuilder sql = new StringBuilder("select a.*,b.type_name,c.user_name from house_info a ,house_type b , user_info c  where  a.type_id = b.type_id  and  a.user_id = c.user_id and a.is_used =1 ");
        List<Map<String, Object>> maps = null;
        List<String> parameters = new ArrayList<String>();
        /*if (!"1".equals(userId)){
            sql.append(" and a.user_id = ? ");
            parameters.add(userId);
        }*/
        if (StringUtils.isNotBlank(houseInput)){
            if ("1".equals(queryType)){
                sql.append(" and  b.type_name  like ? ");
            }else if ("2".equals(queryType)){
                sql.append(" and  a.house_address  like ? ");
            }
            parameters.add(houseInput);
        }
        maps = jdbcTemplate.queryForList(sql.toString(),parameters.toArray());
        return maps;
    }


}
