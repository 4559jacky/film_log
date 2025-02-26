package com.filmlog.qna.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.qna.model.vo.Qna;

public class QnaDao {
	
	public Qna selectOneQna(SqlSession session, int qnaBoardNo) {
		return session.selectOne("qnaMapper.selectOneQna", qnaBoardNo);
	}

	public int insertQna(SqlSession session, Qna qna) {
		return session.insert("qnaMapper.insertQna", qna);
	}
}
