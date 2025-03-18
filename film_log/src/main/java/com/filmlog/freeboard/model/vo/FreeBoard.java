package com.filmlog.freeboard.model.vo;

import java.time.LocalDateTime;

import com.filmlog.common.vo.Paging;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class FreeBoard extends Paging{
	
	private int freeBoardNo;
	private String freeBoardTitle;
	private String freeBoardContent;
	private int memberNo;
	private String memberNickname;
	private LocalDateTime regDate;
	private String regDateStr;
//	private int views;
}

