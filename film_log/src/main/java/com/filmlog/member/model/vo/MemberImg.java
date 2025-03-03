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
public class MemberImg {
	private int memberImgNo;
	private int memberNo;
	private String oriName;
	private String newName;
	private String imgPath;
}
