package com.filmlog.faq.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.faq.model.vo.Faq;

public class FaqDao {

	public List<Faq> selectMemberAll(SqlSession session) {
		return session.selectList("faqMapper.faqList");
	}
}
