package com.filmlog.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.model.vo.Member;
import com.filmlog.member.model.vo.MemberAddress;
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

	public int insertMember(SqlSession session, Member mem) {
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
	
	
	public int insertMemberInterestGenre(SqlSession session, Map<String, Object> paramMap) {
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
	public List<Integer> selectMemberInterestGenreAll(SqlSession session, int memberNo) {
		return session.selectList("memberMapper.selectMemberInterestGenreAll",memberNo);
	}

	public int updateMemberInfo(SqlSession session, Member member) {
		return session.update("memberMapper.updateMemberOne",member);
	}

	public int insertMemberImg(SqlSession session, MemberImg mi) {
		return session.insert("memberMapper.insertMemberImg",mi);
	}

	public MemberImg selectMemberImg(SqlSession session, int memberNo) {
		return session.selectOne("memberMapper.selectMemberImg",memberNo);
	}

	public int deleteMemberImg(SqlSession session, int memberNo) {
		return session.delete("memberMapper.deleteMemberImg",memberNo);
	}
	
	// update전 관심장르 삭제
	public int deleteMemberInterestGenre(SqlSession session, int memberNo) {
		return session.delete("memberMapper.deleteMemberGenre",memberNo);
	}

	public int insertMemberAddress(SqlSession session, MemberAddress ma) {
		return session.insert("memberMapper.insertMemberAddress",ma);
	}

	public Member selectMemberByPhone(SqlSession session, String memberPhone) {
		return session.selectOne("memberMapper.selectMemberByPhone",memberPhone);
	}

	public MemberAddress selectMemberAddress(SqlSession session, int memberNo) {
		return session.selectOne("memberMapper.selectMemberAddress",memberNo);
	}

	public int updateMemberAddress(SqlSession session, MemberAddress memberAddress) {
		return session.update("memberMapper.updateMemberAddress",memberAddress);
	}

	public Member selectMemberPwdForChangePwd(SqlSession session, Member m) {
		return session.selectOne("memberMapper.selectMemberOneByIdAndPwd",m);
	}

	/*
	 * public int selectGenreById(SqlSession session, int genreId) { return 0; }
	 */

}

