package com.oaec.housecrm.dao.impl;

import com.oaec.housecrm.dao.NoticeDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/22.
 */
@Repository("noticeDao")
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Map<String, Object>> query(String noticeInput, String queryType) {
		StringBuilder sql = new StringBuilder("select a.* ,b.user_name from notice_info a ,user_info b where a.user_id = b.user_id and  a.is_used=1 ");
		List<Map<String, Object>> maps;
		if (StringUtils.isNotBlank(noticeInput)){
			if ("1".equals(queryType)){
				sql.append(" and  notice_item  like ?");
			}else if ("2".equals(queryType)){
				sql.append(" and  notice_content  like ?");
			}
			maps = jdbcTemplate.queryForList(sql.toString(), noticeInput);
			return maps;
		}else {
			maps = jdbcTemplate.queryForList(sql.toString());
			return maps;
		}
	}

	@Override
	public int add(Map<String, Object> noticeInfo) {
		String sql = "insert into notice_info (user_id,notice_item,notice_content,notice_time,notice_endtime)  values(?,?,?,?,?)";
		int update = jdbcTemplate.update(sql, noticeInfo.get("user_id"), noticeInfo.get("notice_item"), noticeInfo.get("notice_content"), noticeInfo.get("notice_time"), noticeInfo.get("notice_endtime"));
		return update;
	}

	@Override
	public int delete(String noticeId) {
		String sql = "update notice_info set  is_used = '0' where notice_id =?";
		int update = jdbcTemplate.update(sql, noticeId);
		return update;
	}

	@Override
	public int update(Map<String, Object> noticeInfo) {
		String sql = "update notice_info set  user_id=?,notice_item=? ,notice_content=?,notice_time=?,notice_endtime=? where notice_id =?";
		int update = jdbcTemplate.update(sql, noticeInfo.get("user_id"), noticeInfo.get("notice_item"), noticeInfo.get("notice_content"), noticeInfo.get("notice_time"), noticeInfo.get("notice_endtime"), noticeInfo.get("notice_id"));
		return update;
	}

	@Override
	public List<Map<String, Object>> getNotice() {
		String sql = "select a.*,b.user_name from notice_info  a,user_info  b where a.user_id=b.user_id and  a.is_used='1'  and  TO_DAYS(a.notice_endtime) - TO_DAYS(now())>0 ";
		List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);
		return maps;
	}
}
