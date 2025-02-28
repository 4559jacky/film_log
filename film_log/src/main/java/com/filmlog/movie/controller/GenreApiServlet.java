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

@WebServlet("/GenreAPI")
public class GenreApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GenreApiServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	       // 장르 list
	       HttpRequest req2 = HttpRequest.newBuilder()
	            	.uri(URI.create("https://api.themoviedb.org/3/genre/movie/list?language=ko-KR"))
	            	.header("accept", "application/json")
	            	.header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNWE3ZGI2MDE3NGM1NDA4NWQ3NDA0NTM4MzllMzYyNyIsIm5iZiI6MTc0MDQwMDcxMy42NDk5OTk5LCJzdWIiOiI2N2JjNjg0OWJmNTIxZjE5MGYwYTkyYzYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qb4mx4iM014XVXGXh1s2kfx6loE81ZPVMsHbXu15sLI")
	            	.method("GET", HttpRequest.BodyPublishers.noBody())
	            	.build();
	           HttpResponse<String> rep2 = HttpClient.newHttpClient().send(req2, HttpResponse.BodyHandlers.ofString());
	           System.out.println(rep2.body());
	           
	           ObjectMapper object = new ObjectMapper();
	           JsonNode rootNode2 = object.readTree(rep2.body());
	           JsonNode genresNode = rootNode2.path("genres");

	           List<Genre> genres = object.readValue(genresNode.traverse(), new TypeReference<List<Genre>>() {});

	           int insertGenres = 0;
	           for(int i = 0; i < genres.size(); i++) {
	        	   int result = new MovieService().insertGenre(genres.get(i));
	        	   if(result > 0) {
	        		   insertGenres++;
	        	   }
	           }
	           request.setAttribute("genres", genres);	           

	           // 배우 list
	           for(int currentPage = 1; currentPage <= 500; currentPage++) {  
	        	   HttpRequest req3 = HttpRequest.newBuilder()
	        			   .uri(URI.create("https://api.themoviedb.org/3/person/popular?language=ko-KR&page="+currentPage))
	        			   .header("accept", "application/json")
	        			   .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNWE3ZGI2MDE3NGM1NDA4NWQ3NDA0NTM4MzllMzYyNyIsIm5iZiI6MTc0MDQwMDcxMy42NDk5OTk5LCJzdWIiOiI2N2JjNjg0OWJmNTIxZjE5MGYwYTkyYzYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qb4mx4iM014XVXGXh1s2kfx6loE81ZPVMsHbXu15sLI")
	        			   .method("GET", HttpRequest.BodyPublishers.noBody())
	        			   .build();
	        	   HttpResponse<String> rep3 = HttpClient.newHttpClient().send(req3, HttpResponse.BodyHandlers.ofString());
	        	   System.out.println(rep3.body());
	        	   
	        	   ObjectMapper obj = new ObjectMapper();
	        	   JsonNode rootNode3 = obj.readTree(rep3.body());
	        	   JsonNode actorsNode = rootNode3.path("results");
	        	   
	        	   List<Actor> actors = obj.readValue(actorsNode.traverse(), new TypeReference<List<Actor>>() {});
	        	   
	        	   int insertActors = 0;
	        	   for(int i = 0; i < actors.size(); i++) {
	        		   int result = new MovieService().insertActor(actors.get(i));
	        		   if(result >0) {
	        			   insertActors++;
	        		   }
	        	   }
	        	   request.setAttribute("actors", actors);
	           }
	           request.getRequestDispatcher("/views/movie/list.jsp").forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
