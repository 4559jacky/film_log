package com.filmlog.reviewboard.model.vo;

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
public class ReviewBoard extends Paging{
	
	private int reviewBoardNo;
	private String reviewBoardTitle;
	private String reviewBoardContent;
	private int reviewBoardWriter;
	private String memberName;
	private String memberNickname;
	private LocalDateTime regDate;
	private int views;
	private int movieNo;
	private String movieTitle;
	private int imgNo;
	
}
