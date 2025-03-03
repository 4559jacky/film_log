package com.filmlog.reviewboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.reviewboard.model.vo.ReviewBoard;
import com.filmlog.reviewboard.model.vo.ReviewBoardImg;

public class ReviewBoardDao {

	// 리뷰 게시판 목록 출력
	public List<ReviewBoard> selectReviewBoardAll(SqlSession session, ReviewBoard option){
		return session.selectList("reviewboardMapper.selectReviewBoardAll",option);
	}
	
	// 게시글 추가
	public int insertReviewBoard(ReviewBoard board, SqlSession session) {
		int result = session.insert("reviewboardMapper.insertReviewBoard",board);
		result = board.getReviewBoardNo();
		return result;
	}
	
	// 게시글 이미지 추가
	public int insertReviewBoardImg(ReviewBoardImg img, SqlSession session) {
		return session.insert("reviewboardMapper.insertReviewBoardImg",img);
	}
	
	//페이징 처리
	public int selectReviewBoardCount(ReviewBoard option,SqlSession session) {
		int result = session.selectOne("reviewboardMapper.selectReviewBoardCount",option);
		return result;
	}
	
	// 게시글 상세 조회
	public ReviewBoard selectReviewBoardOne(int reviewBoardNo ,SqlSession session) {
		ReviewBoard reviewBoard = session.selectOne("reviewboardMapper.selectReviewBoardOne",reviewBoardNo);
		return reviewBoard;
	}
	
	// 게시글 이미지 출력
	public ReviewBoardImg selectImgOne(int imgNo ,SqlSession session) {
		ReviewBoardImg reviewBoardImg = session.selectOne("reviewboardMapper.selectImgOne",imgNo);
		return reviewBoardImg;
	}
	
	// 게시글 삭제
	public int deleteReviewBoard(int reviewBoardNo, SqlSession session) {
		int result = session.delete("reviewboardMapper.deleteReviewBoard",reviewBoardNo);
		return result;
	}
	
	// 게시글  수정
	public int updateReviewBoard(ReviewBoard board, SqlSession session) {
		return session.insert("reviewboardMapper.updateReviewBoard",board);
	}
	
	// 게시글 이미지 삭제
	public int deleteReviewBoardImg(ReviewBoardImg img, SqlSession session) {
		return session.insert("reviewboardMapper.deleteReviewBoardImg",img);
	}
	
}
