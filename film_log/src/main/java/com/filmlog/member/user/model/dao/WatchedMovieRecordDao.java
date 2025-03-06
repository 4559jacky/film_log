package com.filmlog.member.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.user.model.vo.WatchedMovieRecord;
import com.filmlog.movie.model.vo.Genre;

public class WatchedMovieRecordDao {
	
	public List<Genre> selectGenre(SqlSession session, int memberNo) {
		return session.selectList("watchedMovieRecordMapper.selectGenre", memberNo);
	}

	public int selectRecordCount(SqlSession session, WatchedMovieRecord option) {
		return session.selectOne("watchedMovieRecordMapper.recordCount", option);
	}
}
