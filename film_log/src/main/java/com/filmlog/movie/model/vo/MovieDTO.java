package com.filmlog.movie.model.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@JsonIgnoreProperties(ignoreUnknown = true)
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovieDTO {
	private int id;
	private String title;
	private String overview;
	private String releaseDate;
	private int voteCount;
	private Number voteAverage;
	private List<Integer> genreIds;
	private String posterPath;

}
