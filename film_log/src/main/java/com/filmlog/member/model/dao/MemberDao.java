package com.filmlog.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.model.vo.Member;

public class MemberDao {
	// 데이터베이스 테스트 회원 데이터 가져오기.
	public List<Member> selectMemberAll(SqlSession session) {
		return session.selectList("memberMapper.memberList");
	}
	
	public Member tempSelectAdmin(SqlSession session, int memberNo) {
		return session.selectOne("memberMapper.memberOne", memberNo);
	}
	
	// 아이디 중복 체크
	public Member selectMemberById(SqlSession session, String memberId) {
		return session.selectOne("memberMapper.selectMemberById",memberId);
	}

	public int InsertMember(SqlSession session, Member mem) {
		return session.insert("memberMapper.insertMemberOne", mem);
	}
	
	// 로그인
	public Member selectMemberOne(SqlSession session, Member member) {
		return session.selectOne("memberMapper.selectMemberOne",member);
	}

}

