package com.filmlog.movie.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.movie.model.dao.MovieDao;
import com.filmlog.movie.model.vo.Movie;

public class MovieService {
	
//	private MovieDao movieDao = new MovieDao();

	public List<Movie> selectMovieList() {
		SqlSession session = getSqlSession();
		List<Movie> resultList = new MovieDao().selectMovieList(session);
		session.close();
		return resultList;
	} 

}
