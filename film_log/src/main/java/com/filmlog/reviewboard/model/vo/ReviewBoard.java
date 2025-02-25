package com.filmlog.reviewboard.model.vo;

import java.time.LocalDateTime;

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
public class ReviewBoard {
	
	private int reviewBoardNo;
	private String reviewBoardTitle;
	private String reviewBoardContent;
	private String memberName;
	private LocalDateTime regDate;
	private int views;
	
}
