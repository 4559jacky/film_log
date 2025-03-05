package com.filmlog.reviewboard.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.reviewboard.model.dao.ReviewBoardDao;
import com.filmlog.reviewboard.model.vo.ReviewBoard;
import com.filmlog.reviewboard.model.vo.ReviewBoardComment;
import com.filmlog.reviewboard.model.vo.ReviewBoardImg;

public class ReviewBoardService {
	
	public List<ReviewBoard> selectReviewListInHome() {
		SqlSession session = getSqlSession();
		List<ReviewBoard> reviews = new ArrayList<ReviewBoard>();
		reviews = new ReviewBoardDao().selectReviewListInHome(session);
		return reviews;
	}
	
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
		session.close();
		return result;
	}
	
	
	// imgNo 가져와서 이거를 기준으로 삭제 메소드 
	public int deleteReviewBoardImgOne(int imgNo) {
		SqlSession session = getSqlSession();
		int result = new ReviewBoardDao().deleteReviewBoardImgOne(imgNo,session);
		session.close();
		return result;
	}
	
	// 게시글 수정 여기서 부터 !!
	public int updateReviewBoard (ReviewBoard board, ReviewBoardImg img) {
		SqlSession session = getSqlSession(false); //오토인크리먼트 꺼짐
		int result = 0;
		int result2 = 0;
		
		int result1 = 0;
		try {
			
			result1 = new ReviewBoardDao().updateReviewBoard(board,session);
			
			if(img != null) {
				img.setReviewBoardNo(board.getReviewBoardNo());
				result2 = new ReviewBoardDao().insertReviewBoardImg(img,session);				
			}
			
			
			if(img != null) {
				// 이미지 파일이 잇을 때랑 없을 때 
				if(result1 !=0 && result2!= 0) {
					result = 1;
					session.commit(true);
				}else {
					session.rollback();
				}
			}else {
				if(result1 !=0) {
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
		
		return result;
	}
	
	//조회수 증가
	public int updateViews(int reviewBoardNo) {
		SqlSession session = getSqlSession();
		int updateViews = new ReviewBoardDao().updateViews(reviewBoardNo,session);
		
		if(updateViews>0) {
			session.commit();
		}
		session.close();
		
		return updateViews;
	}
	
	// 댓글 추가
	public int insertReviewBoardComment(ReviewBoardComment comment){
		SqlSession session = getSqlSession();
		int CommentNo = new ReviewBoardDao().insertReviewBoardComment(comment,session);
		session.close();
		return CommentNo;
		
	}

	//방금 단 댓글 출력
	public ReviewBoardComment selectReviewBoardCommentOne(int commentNo) {
		SqlSession session = getSqlSession();
		ReviewBoardComment commentOne = new ReviewBoardDao().selectReviewBoardCommentOne(commentNo,session);
		session.close();
		return commentOne;
	}
	
	// 전체 댓글 목록 조회
	public List<ReviewBoardComment> selectReviewBoardCommentAll(int reviewBoardNo) {
		SqlSession session = getSqlSession();
		List<ReviewBoardComment> commentList = new ArrayList<ReviewBoardComment>();
		commentList = new ReviewBoardDao().selectReviewBoardCommentAll(reviewBoardNo,session);
		session.close();
		return commentList;
	}
	
	// 댓글 삭제
	public int deleteReviewBoardComment(int commentNo) {
		SqlSession session = getSqlSession();
		int result = new ReviewBoardDao().deleteReviewBoardComment(commentNo,session);
		session.close();
		return result;
	}
	public List<ReviewBoard> selectReviewBoardByMemberNo(int memberNo) {
		SqlSession session = getSqlSession();
		List<ReviewBoard> resultList = new ReviewBoardDao().selectReviewBoardByMemberNo(memberNo,session);
		session.close();
		return resultList;
	}
	
}
