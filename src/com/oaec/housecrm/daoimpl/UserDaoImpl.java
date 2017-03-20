package com.oaec.housecrm.daoimpl;

import com.oaec.housecrm.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/2/20.
 */
@Repository("userDao")
public class UserDaoImpl implements UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Map<String, Object> queryByNumAndPw(String num, String pw) {
        System.out.println("num = [" + num + "], pw = [" + pw + "]");
        String sql = "SELECT user_info.user_id, department_info.department_name,user_role.role_id, user_role.role_name, user_info.user_name, user_info.user_sex, user_info.user_mobile, user_info.user_age, user_info.user_address, user_info.user_num, user_info.user_pw, user_info.user_tel, user_info.user_idnum, user_info.user_email, user_info.user_addtime, user_info.user_addman, user_info.user_changetime, user_info.user_changeman, user_info.user_intest, user_info.user_diploma, user_info.user_bankcard, user_info.user_nation, user_info.is_married FROM user_info LEFT JOIN department_info ON department_info.department_id = user_info.department_id LEFT JOIN user_role ON user_info.role_id = user_role.role_id WHERE user_num = ? AND user_pw = ?";
        Map<String, Object> map = null;
        try {
            map = jdbcTemplate.queryForMap(sql, num, pw);
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        System.out.println("UserDaoImpl.queryByNumAndPw : "+map);
        return map;
    }

    @Override
    public List<Map<String, Object>> queryAllUsed() {
        String sql = "select  a.*,b.department_name,c.role_name from user_info  a, department_info b,user_role c where  a.department_id = b.department_id and a.role_id=c.role_id and a.is_used=1";
        List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
        return maps;
    }
}
