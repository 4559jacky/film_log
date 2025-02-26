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
import com.filmlog.movie.model.vo.MovieDTO;

@WebServlet("/movieList")
public class MovieApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovieApiServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpRequest req = HttpRequest.newBuilder()
				    .uri(URI.create("https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=ko-KR&page=1&sort_by=popularity.desc"))
				    .header("accept", "application/json")
				    .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNWE3ZGI2MDE3NGM1NDA4NWQ3NDA0NTM4MzllMzYyNyIsIm5iZiI6MTc0MDQwMDcxMy42NDk5OTk5LCJzdWIiOiI2N2JjNjg0OWJmNTIxZjE5MGYwYTkyYzYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qb4mx4iM014XVXGXh1s2kfx6loE81ZPVMsHbXu15sLI")
				    .method("GET", HttpRequest.BodyPublishers.noBody())
				    .build();
				HttpResponse<String> rep = HttpClient.newHttpClient().send(req, HttpResponse.BodyHandlers.ofString());
				System.out.println(rep.body());		
				
				// 객체 생성
				ObjectMapper objectMapper = new ObjectMapper();
				JsonNode rootNode = objectMapper.readTree(rep.body());

	            // "results" 배열을 추출하여 List<MovieDTO>로 변환
	            List<MovieDTO> movies = objectMapper.readValue(
	                rootNode.get("results").toString(),new TypeReference<List<MovieDTO>>() {} 
	            );
	            
	            int result = new MovieService().insertMovie(movies.get(1));
//	            movies.get(1);

	            // 3. 변환된 영화 리스트 출력
	            for (MovieDTO movie : movies) {
	                System.out.println(movie);
	            }

	            // 4. 영화 리스트를 request 객체에 저장하고 JSP로 전달
	            request.setAttribute("movies", movies);
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
