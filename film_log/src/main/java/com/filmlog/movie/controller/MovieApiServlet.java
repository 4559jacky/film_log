package com.filmlog.movie.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.filmlog.movie.model.service.MovieService;
import com.filmlog.movie.model.vo.MovieDTO;

@WebServlet("/movieAPI")
public class MovieApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MovieService movieService = new MovieService(); // 객체 재사용
       
    public MovieApiServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 영화 list
			for(int allPage = 1; allPage <= 1; allPage++) {
				HttpRequest req = HttpRequest.newBuilder()
						.uri(URI.create("https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=ko-KR&page="+allPage+"&sort_by=popularity.desc"))
						.header("accept", "application/json")
						.header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNWE3ZGI2MDE3NGM1NDA4NWQ3NDA0NTM4MzllMzYyNyIsIm5iZiI6MTc0MDQwMDcxMy42NDk5OTk5LCJzdWIiOiI2N2JjNjg0OWJmNTIxZjE5MGYwYTkyYzYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qb4mx4iM014XVXGXh1s2kfx6loE81ZPVMsHbXu15sLI")
						.method("GET", HttpRequest.BodyPublishers.noBody())
						.build();
				HttpResponse<String> rep = HttpClient.newHttpClient().send(req, HttpResponse.BodyHandlers.ofString());
				System.out.println("API Response: " + rep.body());
				
				ObjectMapper objectMapper = new ObjectMapper();
				JsonNode rootNode = objectMapper.readTree(rep.body());
				JsonNode moviesNode = rootNode.path("results");
				
				System.out.println(rootNode.toString());
				
				if (moviesNode.isMissingNode() || moviesNode.isNull()) {
					System.out.println("No movies found in response.");
					return;
				}
				
				// 하나씩 개별 객체에 매핑
				List<MovieDTO> movies = new ArrayList<>();
				int result = 0;
				for (JsonNode node : moviesNode) {
				    MovieDTO movie = objectMapper.treeToValue(node, MovieDTO.class);
				    List<Integer> genreList = new ArrayList<>(); // 영화별로 초기화
				    JsonNode genreIdsNode = node.path("genre_ids"); // JSON에서 genre_ids 가져오기
				    if (genreIdsNode.isArray()) {
				        for (JsonNode genreIdNode : genreIdsNode) {
				            genreList.add(genreIdNode.asInt()); // Integer 값으로 변환 후 리스트에 추가
				        }
				    }
				    System.out.println(genreList);
				    
				    MovieDTO newMovie = fetchMovieDetails(movie.getId());

				    // 한 영화의 정보 + 해당 영화의 장르 리스트를 DB에 저장
//				    result = movieService.insertMovieAndGenre(newMovie, newMovie.getId(), genreList);
				    result = movieService.insertMovie(newMovie);
				    if(result > 0) {
				    	movieService.insertMovieGenre(newMovie.getId(), genreList);
				    }

				    movies.add(newMovie);
				}
				
				// 영화 20개씩 추가(movie-mapper에서 반복문)
//				int resultEnd = 0;
//				
//				if(result > 0) {
//					resultEnd = movieService.insertMovie(movies);
//				}
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 개별 영화 상세 정보 조회 -> runtime 가져옴
	private MovieDTO fetchMovieDetails(int movieId) throws IOException, InterruptedException {
	    try {
	    	HttpRequest req = HttpRequest.newBuilder()
	      		  .uri(URI.create("https://api.themoviedb.org/3/movie/" + movieId + "?language=ko-KR"))
	      		  .header("accept", "application/json")
	      		  .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNWE3ZGI2MDE3NGM1NDA4NWQ3NDA0NTM4MzllMzYyNyIsIm5iZiI6MTc0MDQwMDcxMy42NDk5OTk5LCJzdWIiOiI2N2JjNjg0OWJmNTIxZjE5MGYwYTkyYzYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qb4mx4iM014XVXGXh1s2kfx6loE81ZPVMsHbXu15sLI")
	      		  .method("GET", HttpRequest.BodyPublishers.noBody())
	      		  .build();
	  	    
	  	    HttpResponse<String> rep = HttpClient.newHttpClient().send(req, HttpResponse.BodyHandlers.ofString());
	  	    
	  	    ObjectMapper objectMapper = new ObjectMapper();
	  	    JsonNode rootNode = objectMapper.readTree(rep.body());
	  		
	  		System.out.println(rootNode.toString());
	  		
	  		MovieDTO movie = objectMapper.treeToValue(rootNode, MovieDTO.class);
	  	    return movie;
	  	    
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
	    return null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}