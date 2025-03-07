package com.filmlog.reviewboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.movie.model.vo.MovieDTO;
import com.filmlog.reviewboard.model.vo.ReviewBoard;
import com.filmlog.reviewboard.model.vo.ReviewBoardComment;
import com.filmlog.reviewboard.model.vo.ReviewBoardImg;

public class ReviewBoardDao {
	
	public List<ReviewBoard> selectReviewListInHome(SqlSession session) {
		return session.selectList("reviewboardMapper.selectReviewListInHome");
	}

	// 리뷰 게시판 목록 출력
	public List<ReviewBoard> selectReviewBoardAll(SqlSession session, ReviewBoard option){
		return session.selectList("reviewboardMapper.selectReviewBoardAll",option);
	}
	
	//영화 전체 목록
	public List<MovieDTO> selectMovieListAll(SqlSession session,String movieTitle){
		return session.selectList("reviewboardMapper.selectMovieListAll",movieTitle);
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
		return session.update("reviewboardMapper.updateReviewBoard",board);
	}
	
	
	
	// 게시글 이미지 삭제
	public int deleteReviewBoardImg(ReviewBoardImg img, SqlSession session) {
		return session.insert("reviewboardMapper.deleteReviewBoardImg",img);
	}
	
	//  상세 페이지 게시글 이미지 삭제
	public int deleteReviewBoardImgOne( int imgNo, SqlSession session) {
		return session.insert("reviewboardMapper.deleteReviewBoardImgOne",imgNo);
	}
	
	// 게시글 조회수 증가 
	public int updateViews(int reviewBoardNo, SqlSession session) {
		int result = session.update("reviewboardMapper.updateViews",reviewBoardNo);
		
		// 증가된 조회수 가져옴
		int updateViews=0;
		if(result>0) {
			updateViews = session.selectOne("reviewboardMapper.selectUpdateViews",reviewBoardNo);			
		}
		
		return updateViews;
	}
	
	// 댓글 추가
	public int insertReviewBoardComment(ReviewBoardComment comment,SqlSession session) {
		session.insert("reviewboardMapper.insertReviewBoardComment",comment);
		int CommentNo = comment.getReviewBoardCommentNo();
		return CommentNo;
		
	}
	
	// 방금 단 댓글 추가
	public ReviewBoardComment selectReviewBoardCommentOne(int commentNo,SqlSession session) {
		ReviewBoardComment commentOne = session.selectOne("reviewboardMapper.selectReviewBoardCommentOne",commentNo);
		return commentOne;
	}
	
	// 댓글 전체 목록 출력
	public  List<ReviewBoardComment> selectReviewBoardCommentAll(int reviewBoardNo, SqlSession session) {
		return session.selectList("reviewboardMapper.selectReviewBoardCommentAll",reviewBoardNo);
	}
	
	//댓글 삭제 
	public int deleteReviewBoardComment(int commentNo, SqlSession session) {
		int result = session.delete("reviewboardMapper.deleteReviewBoardComment",commentNo);
		return result;
	}
	
	// 댓글 수정 
	public int updateReviewBoardComment(ReviewBoardComment comment, SqlSession session) {
		int result = session.delete("reviewboardMapper.updateReviewBoardComment",comment);
		return result;
	}

	public List<ReviewBoard> selectReviewBoardByMemberNo(int memberNo, SqlSession session) {
		return session.selectList("reviewboardMapper.selectReviewListByMemberNo",memberNo);
	}

	public List<ReviewBoard> selectReviewBoardListByWord(ReviewBoard option, SqlSession session) {
		return session.selectList("reviewboardMapper.selectReviewBoardAllByWord",option);
	}

	public List<ReviewBoard> selectReviewBoardTop4(String yeaterday, SqlSession session) {
		return session.selectList("reviewboardMapper.selectReviewBoardTop4",yeaterday);
	}
	
}
