package com.filmlog.movie.model.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

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
public class Actor {
	private int id;
	private String name;
	@JsonProperty("original_name")
	private String originalName;
	private int gender;
	private String character;
	@JsonProperty("profile_path")
	private String profilePath;
//	private String character;
}
