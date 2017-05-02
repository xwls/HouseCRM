package com.oaec.housecrm.dao.impl;

import com.oaec.housecrm.dao.HouseTypeDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/21.
 */
@Repository("houseTypeDao")
public class HouseTypeDaoImpl implements HouseTypeDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> query(String houseTypeName) {
        StringBuilder sql = new StringBuilder("select *  from house_type  where is_used=1 and type_name like ?");
        houseTypeName = houseTypeName == null ? "%%" : "%"+houseTypeName+"%";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql.toString(), houseTypeName);
        return maps;
    }

    @Override
    public int add(String houseTypeName) {
        String sql = "insert into house_type (type_name)  values(?)";
        int update = jdbcTemplate.update(sql, houseTypeName);
        return update;
    }

    @Override
    public int delete(String houseId) {
        String sql = "update house_type set  is_used = '0' where type_id =?";
        int update = jdbcTemplate.update(sql, houseId);
        return update;
    }

    @Override
    public int update(Map<String, Object> houseTypeInfo) {
        String sql = "update house_type set  type_name=?  where type_id =?";
        int update = jdbcTemplate.update(sql, houseTypeInfo.get("type_name"), houseTypeInfo.get("type_id"));
        return update;
    }
}
