package com.oaec.housecrm.daoimpl;

import com.oaec.housecrm.dao.HouseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
        return 0;
    }

    @Override
    public int update(Map<String, Object> houseMap) {
        return 0;
    }

    @Override
    public Map<String, Object> queryById(String house_id) {
        return null;
    }

    @Override
    public List<Map<String, Object>> queryAll() {
        return null;
    }
}
