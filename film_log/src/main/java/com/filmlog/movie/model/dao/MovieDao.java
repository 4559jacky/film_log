package com.filmlog.movie.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.filmlog.movie.model.vo.Actor;
import com.filmlog.movie.model.vo.Genre;
import com.filmlog.movie.model.vo.MovieDTO;

public class MovieDao {
	private SqlSessionFactory sqlSessionFactory;
	
	// 배우 추가
	public int insertActor(SqlSession session, Actor actor) {
		return session.insert("movieMapper.insertActor",actor);
	}
	// 장르 추가
	public int insertGenre(SqlSession session, Genre genre) {
		return session.insert("movieMapper.insertGenre",genre);
	}
	// 영화 추가
	public int insertMovie(SqlSession session, MovieDTO movieDTO) {
		return session.insert("movieMapper.insertMovie", movieDTO);
	}
	// 중복 검사
	public MovieDTO selectMovieById(SqlSession session,int id) {
		return session.selectOne("movieMapper.selectMovieById",id);
	}

	
	// API
//	public int insertMovieApi(SqlSession session, MovieDTO movie) {
//		return session.insert("movieMapper.insertMovie", movie);
//	}


}
