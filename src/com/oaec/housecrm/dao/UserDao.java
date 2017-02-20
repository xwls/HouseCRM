package com.oaec.housecrm.dao;

import java.util.Map;

/**
 * Created by Kevin on 2017/2/20.
 */
public interface UserDao {
    Map<String,Object> queryByNumAndPw(String num, String pw);
}
