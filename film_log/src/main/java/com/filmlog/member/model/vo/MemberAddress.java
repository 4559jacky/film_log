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
public class MemberAddress {
	private int memberAddressNo;
	private int postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private int memberNo;
}
