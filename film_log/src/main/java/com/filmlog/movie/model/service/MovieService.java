package com.filmlog.movie.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.movie.model.dao.MovieDao;
import com.filmlog.movie.model.vo.Actor;
import com.filmlog.movie.model.vo.Director;
import com.filmlog.movie.model.vo.Genre;
import com.filmlog.movie.model.vo.MovieDTO;

public class MovieService {

	// 영화 목록
//	public List<Movie> selectMovieList() {
//		SqlSession session = getSqlSession();
//		List<Movie> resultList = new MovieDao().selectMovieList(session);
//		session.close();
//		return resultList;
//	}
	// 배우 추가
	public int insertActor(Actor actor) {
		SqlSession session = getSqlSession();
		int result = new MovieDao().insertActor(session,actor);
		session.close();
		return result;
	}
	// 장르 추가
	public int insertGenre(Genre genre) {
		SqlSession session = getSqlSession();
		int result = new MovieDao().insertGenre(session,genre);
		session.close();
		return result;
	}
	
	// 중복 검사
	public MovieDTO selectMovieById(int id) {
		SqlSession session = getSqlSession();
		MovieDTO result = new MovieDao().selectMovieById(session,id);
		session.close();
		return result;
	}
	
	// 영화 추가 - 트랜잭션 X
	public int insertMovie(MovieDTO movies) {
	    SqlSession session = getSqlSession();
	    int result = new MovieDao().insertMovie(session,movies);
	    session.close();
	    return result;
	}
	
	// 영화 장르 저장
	public int insertMovieGenre(int movieId, List<Integer> genreList) {
		SqlSession session = getSqlSession();
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("movieId", movieId);
	    paramMap.put("list", genreList);
	    int result = new MovieDao().insertMovieGenre(session,paramMap);
	    session.close();
	    return result;
	}
	
	// 영화 추가 - 트랜잭션 O
	public int insertMovieAndGenre(MovieDTO newMovie, int movieId, List<Integer> genreList) {
		SqlSession session = getSqlSession(false);
		int result1 = 0;
	    int result2 = 0;
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("movieId", movieId);
	    paramMap.put("list", genreList);
	    try {
	        // 영화
	        result1 = new MovieDao().insertMovie(session, newMovie);
	        
	        // 영화 장르
	        result2 = new MovieDao().insertMovieGenre(session, paramMap);

	        // 4. 두 개의 insert가 모두 성공했을 때만 commit
	        if (result1 > 0 && result2 > 0) {
	            session.commit();
	        } else {
	            session.rollback();  // 하나라도 실패하면 롤백
	            return 0;
	        }
	    } catch (Exception e) {
	        if (session != null) {
	            session.rollback();  // 예외 발생 시 롤백
	        }
	        e.printStackTrace();
	        return 0;
	    } finally {
	        if (session != null) {
	            session.close();  // 세션 종료
	        }
	    }
	    
	    return result1 + result2;  // 성공한 개수 반환
	}
	
	// 전체 무비 가져오기
	public List<MovieDTO> selectMovieAll() {
		SqlSession session = getSqlSession();
		List<MovieDTO> movies = new MovieDao().selectMovieAll(session);
	    session.close();
	    return movies;
	}
		
	
	// 배우추가 트랜잭션
	public int insertActorAll(List<Actor> actors, int movieId) {
		SqlSession session = getSqlSession(false);
		int result1 = 0;
	    int result2 = 0;
	    List<Integer> actorIdList = new ArrayList<Integer>();
	    for(Actor a : actors) {
	    	actorIdList.add(a.getId());
	    }
	    System.out.println(actorIdList);
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("movieId", movieId);
	    paramMap.put("list", actorIdList);
	    try {
	        // 배우 추가
	        result1 = new MovieDao().insertActorAll(session, actors);
	        
	        // 영화아이디 배우아이디 매핑
	        result2 = new MovieDao().insertMovieActor(session, paramMap);

	        // 4. 두 개의 insert가 모두 성공했을 때만 commit
	        if (result1 > 0 && result2 > 0) {
	            session.commit();
	        } else {
	            session.rollback();  // 하나라도 실패하면 롤백
	            return 0;
	        }
	    } catch (Exception e) {
	        if (session != null) {
	            session.rollback();  // 예외 발생 시 롤백
	        }
	        e.printStackTrace();
	        return 0;
	    } finally {
	        if (session != null) {
	            session.close();  // 세션 종료
	        }
	    }
	    
	    return result1 + result2;
	}
	
	// 감독 추가 트랜잭션
	public int insertDirectorOne(Director director, int movieId) {
		SqlSession session = getSqlSession(false);
		int result1 = 0;
	    int result2 = 0;
	    int directorId = director.getId();

	    System.out.println(directorId);
		Map<String, Integer> paramMap = new HashMap<>();
	    paramMap.put("movieId", movieId);
	    paramMap.put("directorId", directorId);
	    try {
	        // 감독 추가
	        result1 = new MovieDao().insertDirectorOne(session, director);
	        
	        // 영화아이디 감독 아이디 매핑
	        result2 = new MovieDao().insertMovieDirector(session, paramMap);

	        // 4. 두 개의 insert가 모두 성공했을 때만 commit
	        if (result1 > 0 && result2 > 0) {
	            session.commit();
	        } else {
	            session.rollback();  // 하나라도 실패하면 롤백
	            return 0;
	        }
	    } catch (Exception e) {
	        if (session != null) {
	            session.rollback();  // 예외 발생 시 롤백
	        }
	        e.printStackTrace();
	        return 0;
	    } finally {
	        if (session != null) {
	            session.close();  // 세션 종료
	        }
	    }
	    
	    return result1 + result2;
	}

	// API
//	public int insertMovieApi(MovieDTO movie){
//		SqlSession session = getSqlSession();
//		int resultList = new MovieDao().insertMovieApi(session,movie);
//		session.close();
//		return resultList;
//	}

	

}