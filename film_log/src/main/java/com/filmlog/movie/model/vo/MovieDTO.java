package com.filmlog.movie.model.vo;

import java.time.LocalDateTime;
import java.util.List;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.filmlog.common.vo.Paging;
import com.filmlog.reviewboard.model.vo.ReviewBoard;

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

public class MovieDTO extends Paging{
	private int id;
    private String title;

    @JsonProperty("original_title")
    private String originalTitle;

    private String overview;
    private int runtime;

    @JsonProperty("release_date")
    private String releaseDate;

    @JsonProperty("vote_average")
    private Double voteAverage;

    @JsonProperty("poster_path")
    private String posterPath;

    private Boolean adult;
    
    @JsonProperty("genre_ids")
    private List<Integer> genres;


}
