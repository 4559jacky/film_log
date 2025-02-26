package com.filmlog.reviewboard.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.reviewboard.model.dao.ReviewBoardDao;
import com.filmlog.reviewboard.model.vo.ReviewBoard;
import com.filmlog.reviewboard.model.vo.ReviewBoardImg;

public class ReviewBoardService {
	
	// 리뷰 게시판 목록 출력
	public List<ReviewBoard> selectReviewBoardAll(ReviewBoard option){
		SqlSession session = getSqlSession();
		List<ReviewBoard> resultList = new ArrayList<ReviewBoard>();
		resultList = new ReviewBoardDao().selectReviewBoardAll(session,option);
		session.close();
		return resultList;
		
	}
	// 파일 추가
	public int insertReviewBoard (ReviewBoard board, ReviewBoardImg img) {
		SqlSession session = getSqlSession(false); //오토인크리먼트 꺼짐
		int result = 0;
		try{
			int boardNo = new ReviewBoardDao().insertReviewBoard(board,session);
			img.setReviewBoardNo(boardNo);
			int imgNo = new ReviewBoardDao().insertReviewBoardImg(img,session);
			
			if(boardNo !=0 && imgNo!= 0) {
				result = 1;
				session.commit(true);
			}else {
				session.rollback();
			}
			session.close();
			
		}catch(Exception e ) {
			session.rollback();
			e.printStackTrace();
		}
		
		try {
			
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int selectReviewBoardCount(ReviewBoard option) {
		SqlSession session = getSqlSession();
		int result = new ReviewBoardDao().selectReviewBoardCount(option,session);
		session.close();
		return result;
	}
	
}
