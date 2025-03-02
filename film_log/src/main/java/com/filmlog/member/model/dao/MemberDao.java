package com.filmlog.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.model.vo.Member;
import com.filmlog.member.model.vo.MemberImg;

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
		int result = session.insert("memberMapper.insertMemberOne", mem);
		result = mem.getMemberNo();
		return result;
	}
	
	// 로그인
	public Member selectMemberOne(SqlSession session, Member member) {
		return session.selectOne("memberMapper.selectMemberOne",member);
	}
	
	// 닉네임 중복 체크
	public Member selectMemberByNickname(SqlSession session, String memberNickname) {
		return session.selectOne("memberMapper.selectMemberByNickname",memberNickname);
	}
	
	
	public int InsertMemberInterestGenre(SqlSession session, Map<String, Object> paramMap) {
		return session.insert("memberMapper.insertMemberInterestGenreOne",paramMap);
	}
	
	
//	public int InsertMemberInterestGenre(SqlSession session, Map<String, Integer> paramMap) {
//		return session.insert("memberMapper.insertMemberInterestGenreOne",paramMap);
//	}

	public int UpdateMemberPwd(SqlSession session, Member member) {
		return session.update("memberMapper.updateMemberPwd",member);
	}

	public MemberImg selectMemberImgOne(SqlSession session, int memberImgNo) {
		return session.selectOne("memberMapper.selectMemberImgOne",memberImgNo);
	}
	
	// 사용자 아이디로 관심 장르 가져오기
	public List<Integer> selectMemberInterestGenreAll(SqlSession session, int memberId) {
		return session.selectList("memberMapper.selectMemberInterestGenreAll",memberId);
	}

	public int updateMemberInfo(SqlSession session, Member member) {
		return session.update("memberMapper.updateMemberOne",member);
	}

	public int updateMemberImg(SqlSession session, MemberImg memberImg) {
//		int result = session.delete
//		return session.insert;
		return 0;
	}

	public int insertMemberImg(SqlSession session, MemberImg mi) {
		return session.insert("memberMapper.insertMemberImg",mi);
	}

	/*
	 * public int selectGenreById(SqlSession session, int genreId) { return 0; }
	 */

}

