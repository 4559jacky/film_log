package com.filmlog.movie.model.vo;

import java.sql.Date;

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
public class Movie {
	private int movieNo;
	private String movieTitle;
	private String moviePlot;
	private String movieDirector;
	private String movieActor;
	private Date releaseDate;
	private int runTime;
	private float rating;
	private int viewsNum;
	private int genreNo;
	private String movieAddressUrl;
		
	}
