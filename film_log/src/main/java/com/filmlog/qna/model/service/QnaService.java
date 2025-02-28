package com.filmlog.qna.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.qna.model.dao.QnaDao;
import com.filmlog.qna.model.vo.Qna;
import com.filmlog.qna.model.vo.QnaResponse;

public class QnaService {
	
	public int selectQnaCount() {
		SqlSession session = getSqlSession();
		int result = new QnaDao().selectQnaCount(session);
		return result;
	}
	
	public List<Qna> selectQnaAll(Qna option) {
		SqlSession session = getSqlSession();
		List<Qna> qnaList = new QnaDao().selectQnaAll(session, option);
		return qnaList;
	}
	
	public int insertResponse(Map<String, Object> map) {
		SqlSession session = getSqlSession();
		int result = new QnaDao().insertResponse(session, map);
		return result;
	}
	
	public int deleteResponse(int responseNo) {
		SqlSession session = getSqlSession();
		int result = new QnaDao().deleteResponse(session, responseNo);
		return result;
	}
	
	public int updateResponse(QnaResponse qnaResponse) {
		SqlSession session = getSqlSession();
		int result = new QnaDao().updateResponse(session, qnaResponse);
		return result;
	}
	
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
