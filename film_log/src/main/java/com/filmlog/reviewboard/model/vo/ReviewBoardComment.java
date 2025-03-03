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
public class ReviewBoardComment {

	private int reviewBoardCommentNo;
	private String comment;
	private LocalDateTime regDate;
	private LocalDateTime modDate;
	private int reviewBoardNo;
	private int memberNo;
	
	
}
