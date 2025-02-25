package com.filmlog.reviewboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.reviewboard.model.vo.ReviewBoard;

public class ReviewBoardDao {

	// 리뷰 게시판 목록 출력
	public List<ReviewBoard> ReviewBoardService(SqlSession session){
		return session.selectList("reviewboardMapper.reviewBoardList");
	}
	
}
