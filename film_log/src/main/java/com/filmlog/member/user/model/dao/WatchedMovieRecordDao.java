package com.filmlog.member.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.user.model.vo.WatchedMovieRecord;
import com.filmlog.movie.model.vo.Genre;

public class WatchedMovieRecordDao {
	
	public List<Genre> selectChartGenres(SqlSession session, int memberNo) {
		return session.selectList("watchedMovieRecordMapper.selectChartGenres", memberNo);
	}
	
	public int updateRecord(SqlSession session, WatchedMovieRecord record) {
		return session.insert("watchedMovieRecordMapper.updateRecord", record);
	}
	
	public int deleteRecord(SqlSession session, int recordNo) {
		return session.delete("watchedMovieRecordMapper.deleteRecord", recordNo);
	}
	
	public WatchedMovieRecord selectRecordOne(SqlSession session, int recordNo) {
		return session.selectOne("watchedMovieRecordMapper.selectRecordOne", recordNo);
	}
	
	public int insertRecord(SqlSession session, WatchedMovieRecord record) {
		return session.insert("watchedMovieRecordMapper.insertRecord", record);
	}
	
	public List<WatchedMovieRecord> selectRecordAll(SqlSession session, WatchedMovieRecord option) {
		return session.selectList("watchedMovieRecordMapper.selectRecordAll", option);
	}
	
	public List<Genre> selectGenre(SqlSession session, int memberNo) {
		return session.selectList("watchedMovieRecordMapper.selectGenre", memberNo);
	}

	public int selectRecordCount(SqlSession session, WatchedMovieRecord option) {
		return session.selectOne("watchedMovieRecordMapper.recordCount", option);
	}
}
