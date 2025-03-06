package com.filmlog.member.user.model.vo;

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
public class WatchedMovieRecord extends Paging {
	private int recordNo;
	private int movieNo;
	private int memberNo;
	private String memo;
	private LocalDateTime watchedDate;
	private int genreType;
	private String movieTitle;
}
