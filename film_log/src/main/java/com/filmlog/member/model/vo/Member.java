package com.filmlog.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberNickname;
	private String memberEmail;
	private String memberPhone;
	private String memberBirth;
	private String memberGender;
	private String adminWhether;
	
	public Member(String memberId, String memberPwd) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}
	
	public Member(String memberId, String memberPwd, String memberName, String memberNickname, String memberEmail		,
			String memberAddr, String memberPhone, String memberBirth, String memberGender) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberBirth = memberBirth;
		this.memberGender = memberGender;
	}
	
	
	
}
