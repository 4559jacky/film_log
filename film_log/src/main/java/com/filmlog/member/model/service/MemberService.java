package com.filmlog.member.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.model.dao.MemberDao;
import com.filmlog.member.model.vo.Member;

public class MemberService {
	
	private MemberDao memberDao = new MemberDao();

	public List<Member> selectMemberAll() {
		SqlSession session = getSqlSession();
		List<Member> resultList = memberDao.selectMemberAll(session);
		session.close();
		return resultList;
	}

	public Member selectMemberById(String memberId) {
		SqlSession session = getSqlSession();
		Member member = memberDao.selectMemberById(session, memberId);
		session.close();
		return member;
	}
	
	public Member tempSelectAdmin(int memberNo) {
		SqlSession session = getSqlSession();
		Member result = memberDao.tempSelectAdmin(session, memberNo);
		session.close();
		return result;
	}
	
}
