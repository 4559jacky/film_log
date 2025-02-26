package com.filmlog.movie.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.net.http.HttpResponse;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.movie.model.dao.MovieDao;
import com.filmlog.movie.model.vo.Movie;
import com.filmlog.movie.model.vo.MovieDTO;

public class MovieService {

	// 영화 목록
//	public List<Movie> selectMovieList() {
//		SqlSession session = getSqlSession();
//		List<Movie> resultList = new MovieDao().selectMovieList(session);
//		session.close();
//		return resultList;
//	}
	
	// 영화 추가
	public int insertMovie(MovieDTO movie) {
		SqlSession session = getSqlSession();
		int result = new MovieDao().insertMovie(session,movie);
		session.close();
		return result;
	} 
	// API
	public int insertMovieApi(MovieDTO movie){
		SqlSession session = getSqlSession();
		int resultList = new MovieDao().insertMovieApi(session,movie);
		session.close();
		return resultList;
	}
	
}
