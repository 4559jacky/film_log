package com.filmlog.qna.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.qna.model.vo.Qna;
import com.filmlog.qna.model.vo.QnaResponse;

public class QnaDao {
	
	public int insertResponse(SqlSession session, Map<String, Object> map) {
		return session.insert("qnaMapper.insertResponse", map);
	}
	
	public int deleteResponse(SqlSession session, int responseNo) {
		return session.delete("qnaMapper.deleteResponse", responseNo);
	}
	
	public int updateResponse(SqlSession session, QnaResponse qnaResponse) {
		return session.update("qnaMapper.updateResponse", qnaResponse);
	}
	
	public int deleteQna(SqlSession session, int qnaBoardNo) {
		return session.delete("qnaMapper.deleteQna", qnaBoardNo);
	}
	
	public int updateQna(SqlSession session, Qna qna) {
		return session.update("qnaMapper.updateQna", qna);
	}
	
	public Qna selectOneQna(SqlSession session, int qnaBoardNo) {
		return session.selectOne("qnaMapper.selectOneQna", qnaBoardNo);
	}

	public int insertQna(SqlSession session, Qna qna) {
		return session.insert("qnaMapper.insertQna", qna);
	}
}
