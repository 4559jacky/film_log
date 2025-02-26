package com.filmlog.member.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.model.dao.MemberDao;
import com.filmlog.member.model.vo.Member;

public class MemberService {
	
	private MemberDao memberDao = new MemberDao();
	
	// 데이터베이스 테스트 회원 데이터 가져오기.
	public List<Member> selectMemberAll() {
		SqlSession session = getSqlSession();
		List<Member> resultList = memberDao.selectMemberAll(session);
		session.close();
		return resultList;
	}
	
	// 아이디 중복 체크
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
	
	// 회원가입
	public int InsertMember(Member mem) {
		SqlSession session = getSqlSession();
		int result = memberDao.InsertMember(session, mem);
		session.close();
		return result;
	}

	public Member selectMemberOne(Member member) {
		SqlSession session = getSqlSession();
		Member m = memberDao.selectMemberOne(session, member);
		session.close();
		return m;
	}
	
	// 닉네임 중복 체크
	public Member selectMemberByNickname(String memberNickname) {
		SqlSession session = getSqlSession();
		Member member = memberDao.selectMemberByNickname(session, memberNickname);
		session.close();
		return member;
	}
	
}
