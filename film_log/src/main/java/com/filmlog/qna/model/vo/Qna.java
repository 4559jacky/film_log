package com.filmlog.qna.model.vo;

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
@Builder
@ToString
public class Qna {
	private int qnaBoardNo;
	private int qnaType;
	private String title;
	private String content;
	private LocalDateTime regDate;
	private LocalDateTime modDate;
	private int memberNo;
}
