package com.oaec.housecrm.daoimpl;

import com.oaec.housecrm.dao.CustomerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.*;

/**
 * Created by Kevin on 2017/2/16.
 */
@SuppressWarnings("ALL")
@Repository("customerDao")
public class CustomerDaoImpl implements CustomerDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Map<String, Object>> queryAllUsed(boolean isAllocation) {
        String str = isAllocation ? "IS NOT NULL" : "IS NULL";
        String sql = "SELECT customer_info.customer_id, customer_info.customer_name, customer_info.customer_sex, " +
                "customer_condition.condition_name, customer_source.source_name, user_info.user_name, " +
                "customer_type.type_name,customer_info.customer_addtime, customer_info.customer_mobile, customer_info.customer_email FROM " +
                "customer_info LEFT JOIN customer_condition ON (customer_info.condition_id = " +
                "customer_condition.condition_id) LEFT JOIN customer_source ON customer_info.source_id = " +
                "customer_source.source_id LEFT JOIN user_info ON customer_info.user_id = user_info.user_id LEFT JOIN " +
                "customer_type ON customer_info.type_id = customer_type.type_id WHERE customer_info.is_used != 0 AND  " +
                "user_info.user_name "+str+" ORDER BY customer_info.customer_id";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
        return maps;
    }

    @Override
    public List<Map<String, Object>> queryTypes() {
//        String sql = "SELECT DISTINCT customer_type.type_id,customer_type.type_name FROM customer_info RIGHT JOIN customer_type ON customer_info.type_id = customer_type.type_id;";
        String sql = "select *  from customer_type  where is_used=1";
        List<Map<String, Object>> types = jdbcTemplate.queryForList(sql);
        return types;
    }

    @Override
    public List<Map<String, Object>> queryConditions() {
//        String sql = "SELECT DISTINCT customer_condition.condition_id,customer_condition.condition_name FROM customer_info RIGHT JOIN customer_condition ON customer_condition.condition_id = customer_info.condition_id";
        String sql = "select *  from customer_condition  where is_used=1";
        List<Map<String, Object>> conditions = jdbcTemplate.queryForList(sql);
        return conditions;
    }

    @Override
    public List<Map<String, Object>> querySources() {
//        String sql = "SELECT DISTINCT customer_source.source_id,customer_source.source_name FROM customer_info RIGHT JOIN customer_source ON customer_info.source_id = customer_source.source_id";
        String sql = "select *  from customer_source  where is_used=1";
        List<Map<String, Object>> sources = jdbcTemplate.queryForList(sql);
        return sources;
    }

    @Override
    public Map<String, Object> queryById(int id) {
        String sql = "SELECT customer_info.customer_id, customer_info.customer_name, customer_info.customer_sex, customer_condition.condition_id, customer_source.source_id, user_info.user_name, customer_type.type_id, customer_info.customer_mobile, customer_info.customer_email, customer_info.customer_qq, customer_info.customer_address, customer_info.customer_remark, customer_info.customer_job, customer_info.customer_blog, customer_info.customer_tel, customer_info.customer_msn, customer_info.birth_day, customer_info.customer_addtime, customer_info.customer_addman, customer_info.customer_changtime, customer_info.change_man, customer_info.customer_company FROM customer_info LEFT JOIN customer_condition ON (customer_info.condition_id = customer_condition.condition_id) LEFT JOIN customer_source ON customer_info.source_id = customer_source.source_id LEFT JOIN user_info ON customer_info.user_id = user_info.user_id LEFT JOIN customer_type ON customer_info.type_id = customer_type.type_id WHERE customer_info.customer_id = ?";
        Map<String, Object> customer = jdbcTemplate.queryForMap(sql, id);
        return customer;
    }

    @Override
    public int add(Map<String, Object> map) {
        String sql = "INSERT INTO customer_info (" +
                "condition_id, source_id, user_id, type_id, customer_name, customer_sex," +
                " customer_mobile, customer_qq, customer_address, customer_email, customer_remark, customer_job, " +
                "customer_blog, customer_tel, customer_msn, birth_day, customer_addtime, customer_addman, " +
                "customer_changtime, change_man, customer_company, is_used) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
        int update = jdbcTemplate.update(sql,
                map.get("condition_id"), map.get("source_id"), null, map.get("type_id"),
                map.get("customer_name"), map.get("customer_sex"), map.get("customer_mobile"), map.get("customer_qq"),
                map.get("customer_address"), map.get("customer_email")
                , map.get("customer_remark"), map.get("customer_job"), map.get("customer_blog"), map.get("customer_tel"),
                map.get("customer_msn")
                , map.get("birth_day"), new Date(), map.get("customer_addman"), null, null, map.get("customer_company"));
        return update;
    }

    @Override
    public int update(Map<String, Object> map) {
        String sql = "UPDATE customer_info SET condition_id = ?, source_id = ?, type_id = ?, customer_name = ?, customer_sex = ?, customer_mobile = ?, customer_qq = ?, customer_address = ?, customer_email = ?, customer_remark = ?, customer_job = ?, customer_blog = ?, customer_tel = ?, customer_msn = ?, birth_day = ?, customer_changtime = ?, change_man=?, customer_company = ? WHERE customer_id = ?";
        int update = jdbcTemplate.update(sql,map.get("condition_id"),map.get("source_id"),map.get("type_id"),map.get("customer_name"),map.get("customer_sex"),map.get("customer_mobile"),map.get("customer_qq"),map.get("customer_address"),map.get("customer_email"),map.get("customer_remark"),map.get("customer_job"),map.get("customer_blog"),map.get("customer_tel"),map.get("customer_msn"),map.get("birth_day"),new Date(),map.get("change_man"),map.get("customer_company"),map.get("customer_id"));
        return update;
    }

    @Override
    public List<Map<String, Object>> query(Map<String, Object> map) {
        StringBuilder sb = new StringBuilder("SELECT customer_info.customer_id, customer_info.customer_name, customer_info.customer_sex, customer_condition.condition_name, customer_source.source_name, user_info.user_name, customer_type.type_name,customer_info.customer_addtime, customer_info.customer_mobile, customer_info.customer_email FROM customer_info LEFT JOIN customer_condition ON (customer_info.condition_id = customer_condition.condition_id) LEFT JOIN customer_source ON customer_info.source_id = customer_source.source_id LEFT JOIN user_info ON customer_info.user_id = user_info.user_id LEFT JOIN customer_type ON customer_info.type_id = customer_type.type_id WHERE customer_info.is_used != 0 AND user_info.user_name IS NOT NULL");
        Set<String> keySet = map.keySet();
        List<String> params = new ArrayList<String>();
        for (String s : keySet) {
            String value = map.get(s).toString();
            if(value != null && !"".equals(value)){
//                String str = "";
//                if (s.equals("customer_name")){
//                    str = " LIKE ";
//                    value = "%"+value+"%";
//                }else {
//                    str = " = ";
//                }
                sb.append(" AND "+s+" LIKE ? ");
                value = "%"+value+"%";
                params.add(value);
            }
        }
        sb.append(" ORDER BY customer_info.customer_id");
        System.out.println(sb.toString());
        System.out.println(params.toArray());
        List<Map<String, Object>> customers = jdbcTemplate.queryForList(sb.toString(), params.toArray());
        return customers;
    }

    @Override
    public List<Map<String, Object>> queryNameById(String[] ids) {
        StringBuilder sb = new StringBuilder("SELECT customer_id,customer_name FROM customer_info WHERE customer_id IN (");
        for (String id : ids) {
            sb.append("?,");
        }
        String sql = sb.substring(0,sb.length()-1);
        sql += ")";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql, ids);
        return maps;
    }
}
