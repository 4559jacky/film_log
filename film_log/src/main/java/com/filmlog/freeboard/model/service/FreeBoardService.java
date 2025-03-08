package com.filmlog.freeboard.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import com.filmlog.freeboard.model.dao.FreeBoardDao;
import com.filmlog.freeboard.model.vo.FreeBoard;

public class FreeBoardService {
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

	public int insertFreeBoard(FreeBoard board) {
		SqlSession session = getSqlSession();
		int result = new FreeBoardDao().insertFreeBoard(session,board);
		session.close();
		return result;
	}

	

}
