package com.filmlog.freeboard.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.freeboard.model.dao.FreeBoardDao;
import com.filmlog.freeboard.model.vo.FreeBoard;
import com.filmlog.member.model.vo.Member;

public class FreeBoardService {
	
	public List<FreeBoard> selectMyBoardList(Member member) {
		SqlSession session = getSqlSession();
		List<FreeBoard> resultList = new ArrayList<FreeBoard>();
		resultList = new FreeBoardDao().selectMyBoardList(session, member);
		return resultList;
	}
	
	// 게시판 전체 목록조회
	public List<FreeBoard> selectBoardList(FreeBoard option) {
		SqlSession session = getSqlSession();
		List<FreeBoard> resultList = new ArrayList<FreeBoard>();
		resultList = new FreeBoardDao().selectBoardList(session,option);
		return resultList;
	}
	// 페이징 처리
	public int selectBoardListCount() {
		SqlSession session = getSqlSession();
		int result = new FreeBoardDao().selectBoardListCount(session);
		session.close();
		return result;
	}
	// insert 코드
	public int insertFreeBoard(FreeBoard board) {
		SqlSession session = getSqlSession();
		int result = new FreeBoardDao().insertFreeBoard(session,board);
		session.close();
		return result;
	}
	
	// detail 코드
	public FreeBoard selectBoardOne(int boardNo) {
		SqlSession session = getSqlSession();
	    FreeBoard fb = new FreeBoardDao().selectBoardOne(session,boardNo);
	    session.close();
		return fb;
	}
	// update 코드
	public int updateBoard(FreeBoard board){
	     SqlSession session = getSqlSession();
	     int result = new FreeBoardDao().updateBoard(session,board);
	     session.close();
	     return result;
	}
	// delete 코드
	public int deleteBoard(int boardNo) {
		 SqlSession session = getSqlSession();
	     int result = new FreeBoardDao().deleteBoard(session,boardNo);
	     session.close();
	     return result;
	}
	
	

}
