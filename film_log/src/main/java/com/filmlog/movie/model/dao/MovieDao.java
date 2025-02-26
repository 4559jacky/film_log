package com.filmlog.movie.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.filmlog.movie.model.vo.MovieDTO;

public class MovieDao {
	private SqlSessionFactory sqlSessionFactory;

	// 영화 추가
	public int insertMovie(SqlSession session, MovieDTO movie) {
		return session.insert("movieMapper.insertMovie",movie);
	}
	
	// API
	public int insertMovieApi(SqlSession session, MovieDTO movie) {
		return session.insert("movieMapper.insertMovie", movie);
	}
}
