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
	
	public int selectReviewBoardCount(ReviewBoard option,SqlSession session) {
		int result = session.selectOne("reviewboardMapper.selectReviewBoardCount",option);
		return result;
	}
	
}
