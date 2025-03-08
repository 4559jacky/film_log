package com.filmlog.freeboard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.freeboard.model.vo.FreeBoard;
import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

public class FreeBoardDao {

	public List<FreeBoard> selectBoardList(SqlSession session, FreeBoard option) {
		return session.selectList("freeboardMapper.selectFreeBoardList",option);
	}

	public int selectBoardListCount(SqlSession session) {
		int result = session.selectOne("freeboardMapper.selectBoardListCount");
		return result;
	}

	public int insertFreeBoard(SqlSession session, FreeBoard board) {
		int result = session.insert("freeboardMapper.insertFreeBoard",board);
		result = board.getFreeBoardNo();
		return result;
	}

}
