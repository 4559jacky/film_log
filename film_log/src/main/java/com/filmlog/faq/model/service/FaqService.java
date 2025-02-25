package com.filmlog.faq.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.faq.model.dao.FaqDao;
import com.filmlog.faq.model.vo.Faq;

public class FaqService {
	private FaqDao faqDao = new FaqDao();

	public List<Faq> selectFaqAll() {
		SqlSession session = getSqlSession();
		List<Faq> resultList = faqDao.selectMemberAll(session);
		session.close();
		return resultList;
	}
}
