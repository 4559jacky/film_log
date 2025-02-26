package com.filmlog.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberNickname;
	private String memberBirth;
	private String memberPhone;
	private String memberGender;
	private String memberAddr;
	private String adminWhether;
	
	public Member(String memberId, String memberPwd) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}
	
	public Member(String memberId, String memberPwd, String memberName, String memberNickname, String memberBirth,
			String memberPhone, String memberGender, String memberAddr, String adminWhether) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.memberBirth = memberBirth;
		this.memberPhone = memberPhone;
		this.memberGender = memberGender;
		this.memberAddr = memberAddr;
		this.adminWhether = adminWhether;
	}
	
	
	
}
