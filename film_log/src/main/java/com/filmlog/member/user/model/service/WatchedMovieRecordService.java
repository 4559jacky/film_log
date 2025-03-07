package com.filmlog.member.user.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.user.model.dao.WatchedMovieRecordDao;
import com.filmlog.member.user.model.vo.WatchedMovieRecord;
import com.filmlog.member.user.model.vo.YearWatch;
import com.filmlog.movie.model.vo.Genre;

public class WatchedMovieRecordService {
	
	public List<YearWatch> selectChartYears(int memberNo) {
		SqlSession session = getSqlSession();
		List<YearWatch> years = new ArrayList<YearWatch>();
		years = new WatchedMovieRecordDao().selectChartYears(session, memberNo);
		return years;
	}
	
	public List<Genre> selectChartGenres(int memberNo) {
		SqlSession session = getSqlSession();
		List<Genre> genres = new ArrayList<Genre>();
		genres = new WatchedMovieRecordDao().selectChartGenres(session, memberNo);
		return genres;
	}
	
	public int updateRecord(WatchedMovieRecord record) {
		SqlSession session = getSqlSession();
		int result = new WatchedMovieRecordDao().insertRecord(session, record);
		return result;
	}
	
	public int deleteRecord(int recordNo) {
		SqlSession session = getSqlSession();
		int result = new WatchedMovieRecordDao().deleteRecord(session, recordNo);
		return result;
	}
	
	public WatchedMovieRecord selectRecordOne(int recordNo) {
		SqlSession session = getSqlSession();
		WatchedMovieRecord record = null;
		record = new WatchedMovieRecordDao().selectRecordOne(session, recordNo);
		return record;
	}
	
	public int insertRecord(WatchedMovieRecord record) {
		SqlSession session = getSqlSession();
		int result = new WatchedMovieRecordDao().insertRecord(session, record);
		return result;
	}
	
	public List<WatchedMovieRecord> selectRecordAll(WatchedMovieRecord option) {
		SqlSession session = getSqlSession();
		List<WatchedMovieRecord> records = new ArrayList<WatchedMovieRecord>();
		records = new WatchedMovieRecordDao().selectRecordAll(session, option);
		return records;
	}
	
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
