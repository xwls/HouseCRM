package com.oaec.housecrm.serviceimpl;

import com.oaec.housecrm.dao.NoticeDao;
import com.oaec.housecrm.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Kevin on 2017/3/22.
 */
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public List<Map<String, Object>> query(String noticeInput, String queryType) {
		return noticeDao.query(noticeInput, queryType);
	}

	@Override
	public int add(Map<String, Object> noticeInfo) {
		return noticeDao.add(noticeInfo);
	}

	@Override
	public int delete(String noticeId) {
		return noticeDao.delete(noticeId);
	}

	@Override
	public int update(Map<String, Object> noticeInfo) {
		return noticeDao.update(noticeInfo);
	}
}
