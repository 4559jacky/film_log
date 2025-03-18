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
	private int id; //영화 아이디 PK
    private String title; //영화 제목

    @JsonProperty("original_title")
    private String originalTitle; // 영화 제목(외국어)

    private String overview; // 줄거리
    private int runtime; // 런타임

    @JsonProperty("release_date")
    private String releaseDate; //개봉일

    @JsonProperty("vote_average")
    private Double voteAverage; // 평점

    @JsonProperty("poster_path")
    private String posterPath; // 이미지

    private Boolean adult; //성인 여부 1/0
    
    @JsonProperty("genre_ids")
    private List<Integer> genres; // 영화 장르 


    
    private List<Actor> actors;
 }
