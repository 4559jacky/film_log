package com.filmlog.movie.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.movie.model.vo.Movie;

public class MovieDao {

	public List<Movie> selectMovieList(SqlSession session) {
		return session.selectList("movieMapper.movieList");
	}

}
