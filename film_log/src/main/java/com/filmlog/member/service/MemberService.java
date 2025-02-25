package com.filmlog.member.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.dao.MemberDao;
import com.filmlog.member.vo.Member;

public class MemberService {
	
	private MemberDao memberDao = new MemberDao();

	public List<Member> selectMemberAll() {
		SqlSession session = getSqlSession();
		List<Member> resultList = memberDao.selectMemberAll(session);
		session.close();
		return resultList;
	}
	
}
