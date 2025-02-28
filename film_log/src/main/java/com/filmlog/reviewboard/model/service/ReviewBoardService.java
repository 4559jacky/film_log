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
	// 게시글 추가
	public int insertReviewBoard (ReviewBoard board, ReviewBoardImg img) {
		SqlSession session = getSqlSession(false); //오토인크리먼트 꺼짐
		int result = 0;
		int boardNo = 0;
		int imgNo = 0;
		try{
			boardNo = new ReviewBoardDao().insertReviewBoard(board,session);
			if(img != null) {
				img.setReviewBoardNo(boardNo);
				imgNo = new ReviewBoardDao().insertReviewBoardImg(img,session);				
			}
			
			
			if(img != null) {
				// 이미지 파일이 잇을 때랑 없을 때 
				if(boardNo !=0 && imgNo!= 0) {
					result = 1;
					session.commit(true);
				}else {
					session.rollback();
				}
			}else {
				if(boardNo !=0) {
					result = 1;
					session.commit(true);
				}else {
					session.rollback();
				}
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
	
	// 페이징 처리
	public int selectReviewBoardCount(ReviewBoard option) {
		SqlSession session = getSqlSession();
		int result = new ReviewBoardDao().selectReviewBoardCount(option,session);
		session.close();
		return result;
	}
	
	// 리뷰 게시글 상세 조회
	public ReviewBoard selectReviewBoardOne(int reviewBoardNo) {
		SqlSession session = getSqlSession();
		ReviewBoard reviewboard = new ReviewBoardDao().selectReviewBoardOne(reviewBoardNo, session);
		session.close();
		
		return reviewboard;
		
	}
	
	// 이미지 파일 출력
	public ReviewBoardImg selectImgOne(int imgNo) {
		SqlSession session = getSqlSession();
		ReviewBoardImg reviewboardImg = new ReviewBoardDao().selectImgOne(imgNo, session);
		session.close();
		
		return reviewboardImg;
	}
	
	// 게시글 삭제
	public int deleteReviewBoard(int reviewBoardNo) {
		SqlSession session = getSqlSession();
		int result = new ReviewBoardDao().deleteReviewBoard(reviewBoardNo,session);
		return result;
	}
	
	
	// imgNo 가져와서 이거를 기준으로 삭제 메소드 
	
	
	// 게시글 수정
	public int updateReviewBoard (ReviewBoard board, ReviewBoardImg img) {
		SqlSession session = getSqlSession(false); //오토인크리먼트 꺼짐
		int result = 0;
		int boardNo = 0;
		int imgNo = 0;
		try{
			boardNo = new ReviewBoardDao().insertReviewBoard(board,session);
			if(img != null) {
				img.setReviewBoardNo(boardNo);
				imgNo = new ReviewBoardDao().insertReviewBoardImg(img,session);				
			}
			
			
			if(img != null) {
				// 이미지 파일이 잇을 때랑 없을 때 
				if(boardNo !=0 && imgNo!= 0) {
					result = 1;
					session.commit(true);
				}else {
					session.rollback();
				}
			}else {
				if(boardNo !=0) {
					result = 1;
					session.commit(true);
				}else {
					session.rollback();
				}
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

	
}
