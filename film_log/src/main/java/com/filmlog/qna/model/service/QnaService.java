package com.filmlog.qna.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.qna.model.dao.QnaDao;
import com.filmlog.qna.model.vo.Qna;

public class QnaService {
	
	public int deleteQna(int qnaBoardNo) {
		SqlSession session = getSqlSession();
		int result = new QnaDao().deleteQna(session, qnaBoardNo);
		return result;
	}
	
	public int updateQna(Qna qna) {
		SqlSession session = getSqlSession();
		int result = new QnaDao().updateQna(session, qna);
		return result;
	}
	
	public Qna selectOneQna(int qnaBoardNo) {
		SqlSession session = getSqlSession();
		Qna qna = new QnaDao().selectOneQna(session, qnaBoardNo);
		return qna;
	}

	public int insertQna(Qna qna) {
		SqlSession session = getSqlSession();
		int result = new QnaDao().insertQna(session, qna);
		return result;
	}
}
