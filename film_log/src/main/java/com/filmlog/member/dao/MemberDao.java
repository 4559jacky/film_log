package com.filmlog.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.vo.Member;

public class MemberDao {

	public List<Member> selectMemberAll(SqlSession session) {
		return session.selectList("memberMapper.memberList");
	}

}
