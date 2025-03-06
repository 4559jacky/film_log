package com.filmlog.member.user.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.user.model.dao.WatchedMovieRecordDao;
import com.filmlog.member.user.model.vo.WatchedMovieRecord;
import com.filmlog.movie.model.vo.Genre;

public class WatchedMovieRecordService {
	
	public List<Genre> selectGenre(int memberNo) {
		SqlSession session = getSqlSession();
		List<Genre> genres = new ArrayList<Genre>();
		genres = new WatchedMovieRecordDao().selectGenre(session, memberNo);
		return genres;
	}

	public int selectRecordCount(WatchedMovieRecord option) {
		SqlSession session = getSqlSession();
		int result = new WatchedMovieRecordDao().selectRecordCount(session, option);
		return result;
	}
}
