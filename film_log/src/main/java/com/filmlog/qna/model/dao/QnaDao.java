package com.filmlog.qna.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.model.vo.Member;
import com.filmlog.qna.model.vo.Qna;
import com.filmlog.qna.model.vo.QnaResponse;

public class QnaDao {
	
	public int selectMyQnaCount(SqlSession session, Member member) {
		return session.selectOne("qnaMapper.selectMyQnaCount", member);
	}
	
	public int selectQnaCount(SqlSession session, Qna option) {
		return session.selectOne("qnaMapper.selectQnaCount", option);
	}
	
	public List<Qna> selectMyQnaAll(SqlSession session, Qna option) {
		return session.selectList("qnaMapper.selectMyQnaAll", option);
	}
	
	public List<Qna> selectQnaAll(SqlSession session, Qna option) {
		return session.selectList("qnaMapper.selectQnaAll", option);
	}
	
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
