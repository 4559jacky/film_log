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
public class ReviewBoardImg {
	
	private int imgNo;
	private int reviewBoardNo;
	private String oriImg;
	private String newImg;
	private String imgPath;
}
