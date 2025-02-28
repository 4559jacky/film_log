package com.filmlog.movie.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.filmlog.movie.model.service.MovieService;
import com.filmlog.movie.model.vo.Actor;
import com.filmlog.movie.model.vo.Genre;
import com.filmlog.movie.model.vo.MovieDTO;

@WebServlet("/movieAPI")
public class MovieApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovieApiServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 영화 list
			for(int allPage = 1; allPage <= 50; allPage++) {
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
				
				if (moviesNode.isMissingNode() || moviesNode.isNull()) {
					System.out.println("No movies found in response.");
					return;
				}
				
				List<MovieDTO> movies = objectMapper.readValue(
						moviesNode.traverse(), new TypeReference<List<MovieDTO>>() {}
						);

				MovieService movieService = new MovieService(); // 객체 재사용
				
				for (MovieDTO movie : movies) {
					MovieDTO existingMovie = movieService.selectMovieById(movie.getId());
					if(existingMovie == null) {
						int result = movieService.insertMovie(movie);
						if (result > 0) {  
							System.out.println("Inserted : "+movie);
						}  
					}else {
						System.out.println("Duplicate movie skipped : "+movie);
					}
				}
	           request.setAttribute("movies", movies);
			}
	           request.getRequestDispatcher("/views/movie/list.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
