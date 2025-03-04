package com.filmlog.movie.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.filmlog.movie.model.vo.Actor;
import com.filmlog.movie.model.vo.Director;
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
	// 영화 추가(20개씩)
//	public int insertMovie(SqlSession session, List<MovieDTO> movies) {
//		return session.insert("movieMapper.insertMovieAll", movies);
//	}
	// 영화 추가(1개씩)
	public int insertMovie(SqlSession session, MovieDTO movie) {
		return session.insert("movieMapper.insertMovie", movie);
	}
	
	// 중복 검사
	public MovieDTO selectMovieById(SqlSession session,int id) {
		return session.selectOne("movieMapper.selectMovieById",id);
	}
	// 영화 장르 추가 매핑
	public int insertMovieGenre(SqlSession session, Map<String,Object> paramMap) {
		return session.insert("movieMapper.insertMovieGenre",paramMap);
	}
	
	// 전체 movie 가져오기
	public List<MovieDTO> selectMovieAll(SqlSession session) {
		return session.selectList("movieMapper.selectMovieAll");
	}
	
	// 배우 추가 (트랜잭션)
	public int insertActorAll(SqlSession session, List<Actor> actors) {
		return session.insert("movieMapper.insertActorAll",actors);
	}
	
	// 영화별 배우 매핑
	public int insertMovieActor(SqlSession session, Map<String, Object> paramMap) {
		return session.insert("movieMapper.insertMovieActor",paramMap);
	}
	public int insertDirectorOne(SqlSession session, Director director) {
		return session.insert("movieMapper.insertDirectorOne",director);
	}
	
	// 영화별 배우 매핑
	public int insertMovieDirector(SqlSession session, Map<String, Integer> paramMap) {
		return session.insert("movieMapper.insertMovieDirector",paramMap);
	}
	// 관리자 페이지 영화 전체 목록 출력
	public List<MovieDTO> selectMovieList(SqlSession session,MovieDTO option) {
		return session.selectList("movieMapper.selectMovieList",option);
	}
	// 관리자 페이지 영화 추가
	public int insertMovieAdmin(SqlSession session, MovieDTO movie) {
		return session.insert("movieMapper.insertMovieAdmin",movie);
	}
	public int selectMovieListCount(SqlSession session) {
		int result = session.selectOne("movieMapper.selectMovieListCount");
		return result;
	}
	
	// API
//	public int insertMovieApi(SqlSession session, MovieDTO movie) {
//		return session.insert("movieMapper.insertMovie", movie);
//	}


}