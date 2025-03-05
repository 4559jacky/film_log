package com.filmlog.member.model.service;

import static com.filmlog.common.sql.SqlSessionTemplate.getSqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.filmlog.member.model.dao.MemberDao;
import com.filmlog.member.model.vo.Member;
import com.filmlog.member.model.vo.MemberAddress;
import com.filmlog.member.model.vo.MemberImg;

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
	
	// 회원가입 트랜잭션 X
//	public int InsertMember(Member mem) {
//		SqlSession session = getSqlSession();
//		int result = memberDao.InsertMember(session, mem);
//		session.close();
//		return result;
//	}
	
	// 회원가입 트랜잭션 O
	public int insertMember(Member m, List<String> genreList, MemberImg mi, MemberAddress ma) {
		SqlSession session = getSqlSession(false);
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		
		try {
			int memberNo = memberDao.insertMember(session, m);
			if(memberNo > 0) result1 = 1;
			Map<String,Object> paramMap = new HashMap<>();
			paramMap.put("memberNo", memberNo);
			paramMap.put("list", genreList);
			result2 = memberDao.insertMemberInterestGenre(session, paramMap);
			mi.setMemberNo(memberNo);
			result3 = memberDao.insertMemberImg(session, mi);
			ma.setMemberNo(memberNo);
			result4 = memberDao.insertMemberAddress(session,ma);
			
			if (result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
	            session.commit();
	        } else {
	            session.rollback();  // 하나라도 실패하면 롤백
	            return 0;
	        }
		} catch (Exception e) {
	        if (session != null) {
	            session.rollback();  // 예외 발생 시 롤백
	        }
	        e.printStackTrace();
	        return 0;
	    } finally {
	        if (session != null) {
	            session.close();  // 세션 종료
	        }
	    }
	    
	    return result1 + result2 + result3 + result4;
	}
	
	
	
	// 사용자 관심 장르
//	public int InsertMemberInterestGenre(Map<String, Integer> paramMap) {
//		SqlSession session = getSqlSession();
//		int result = memberDao.InsertMemberInterestGenre(session, paramMap);
//		session.close();
//		return result;
//	}

	public int updateMemberPwd(Member member) {
		SqlSession session = getSqlSession();
		int result = memberDao.UpdateMemberPwd(session, member);
		session.close();
		return result;
	}

	public MemberImg selectMemberImgOne(int memberImgNo) {
		SqlSession session = getSqlSession();
		MemberImg memberImg = memberDao.selectMemberImgOne(session, memberImgNo);
		session.close();
		return memberImg;
	}
	
	// 사용자 관심 장르 가져오기
	public List<Integer> selectMemberInterestGenreAll(int memberNo) {
		SqlSession session = getSqlSession();
		List<Integer> genres = memberDao.selectMemberInterestGenreAll(session, memberNo);
		session.close();
		return genres;
	}
	
	// 이미지가 있을 때 사용자정보 업데이트
	public int updateMemberInfo(Member member, MemberImg memberImg, List<String> genreList, MemberAddress memberAddress) {
		SqlSession session = getSqlSession(false);
		int result1 = 0;
	    int result2 = 0;
	    int result3 = 0;
	    int result4 = 0;
	    int result5 = 0;
	    int result6 = 0;
	    try {
	    	result1 = memberDao.updateMemberInfo(session, member);
	    	result2 = memberDao.deleteMemberImg(session, member.getMemberNo());
	    	result3 = memberDao.insertMemberImg(session,memberImg);
	    	result4 = memberDao.deleteMemberInterestGenre(session,member.getMemberNo());
	    	Map<String,Object> paramMap = new HashMap<String,Object>();
	    	paramMap.put("memberNo", member.getMemberNo());
			paramMap.put("list", genreList);
	    	result5 = memberDao.insertMemberInterestGenre(session, paramMap);
	    	result6 = memberDao.updateMemberAddress(session,memberAddress);
	    	
	    	if (result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0 && result6 > 0) {
	            session.commit();
	        } else {
	            session.rollback();  // 하나라도 실패하면 롤백
	            return 0;
	        }
	    } catch (Exception e) {
	        if (session != null) {
	            session.rollback();  // 예외 발생 시 롤백
	        }
	        e.printStackTrace();
	        return 0;
	    } finally {
	        if (session != null) {
	            session.close();  // 세션 종료
	        }
	    }
	    
	    return result1 + result2 + result3 + result4 + result5 + result6;
	}
	
	public int updateMemberInfo(Member member, List<String> genreList, MemberAddress memberAddress) {
		SqlSession session = getSqlSession(false);
		int result1 = 0;
	    int result2 = 0;
	    int result3 = 0;
	    int result4 = 0;
	    try {
	    	result1 = memberDao.updateMemberInfo(session, member);
	    	result2 = memberDao.deleteMemberInterestGenre(session,member.getMemberNo());
	    	Map<String,Object> paramMap = new HashMap<String,Object>();
	    	paramMap.put("memberNo", member.getMemberNo());
			paramMap.put("list", genreList);
			result3 = memberDao.insertMemberInterestGenre(session, paramMap);
			result4 = memberDao.updateMemberAddress(session, memberAddress);
	    	
	    	if (result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
	            session.commit();
	        } else {
	            session.rollback();  // 하나라도 실패하면 롤백
	            return 0;
	        }
	    } catch (Exception e) {
	        if (session != null) {
	            session.rollback();  // 예외 발생 시 롤백
	        }
	        e.printStackTrace();
	        return 0;
	    } finally {
	        if (session != null) {
	            session.close();  // 세션 종료
	        }
	    }
	    
	    return result1 + result2 + result3 + result4;
	}

	public MemberImg selectMemberImg(int memberNo) {
		SqlSession session = getSqlSession();
		MemberImg memberImg = memberDao.selectMemberImg(session, memberNo);
		session.close();
		return memberImg;
	}

	public Member selectMemberByPhone(String memberPhone) {
		SqlSession session = getSqlSession();
		Member member = memberDao.selectMemberByPhone(session, memberPhone);
		session.close();
		return member;
	}

	public MemberAddress selectMemberAddress(int memberNo) {
		SqlSession session = getSqlSession();
		MemberAddress memberAddress = memberDao.selectMemberAddress(session, memberNo);
		session.close();
		return memberAddress;
	}

	public Member selectMemberPwdForChangePwd(Member m) {
		SqlSession session = getSqlSession();
		Member member = memberDao.selectMemberPwdForChangePwd(session, m);
		session.close();
		return member;
	}
	
	
	// 회원 탈퇴
	public int deleteMemberById(String memberId) {
		SqlSession session = getSqlSession();
		int result = memberDao.deleteMemberById(session, memberId);
		session.close();
		return result;
	}
	

	/*
	 * public int selectGenreById(int genreId) { SqlSession session =
	 * getSqlSession(); int result = memberDao.selectGenreById(session, genreId);
	 * session.close(); return result; }
	 */
	
}
