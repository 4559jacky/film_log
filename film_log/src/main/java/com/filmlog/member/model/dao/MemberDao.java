package com.filmlog.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.model.vo.Member;

public class MemberDao {

	public List<Member> selectMemberAll(SqlSession session) {
		return session.selectList("memberMapper.memberList");
	}
	
	public Member tempSelectAdmin(SqlSession session, int memberNo) {
		return session.selectOne("memberMapper.memberOne", memberNo);
	}

}