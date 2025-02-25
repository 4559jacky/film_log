package com.filmlog.reviewboard.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.reviewboard.model.dao.ReviewBoardDao;
import com.filmlog.reviewboard.model.vo.ReviewBoard;

public class ReviewBoardService {
	
	// 리뷰 게시판 목록 출력
	public List<ReviewBoard> selectReviewBoardList(){
		SqlSession session = getSqlSession();
		List<ReviewBoard> resultList = new ArrayList<ReviewBoard>();
		resultList = new ReviewBoardDao().ReviewBoardService(session);
		
		return resultList;
		
	}
}
