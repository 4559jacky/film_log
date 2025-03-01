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

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.filmlog.movie.model.service.MovieService;
import com.filmlog.movie.model.vo.Actor;
import com.filmlog.movie.model.vo.Genre;
import com.filmlog.movie.model.vo.MovieDTO;

@WebServlet("/movieCastAndCrewAPI")
public class CastAndCrewApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private MovieService movieService = new MovieService();
	
    public CastAndCrewApiServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			List<MovieDTO> movies = movieService.selectMovieAll();
		    System.out.println(movies);
			// 배우 list
			for(int i = 0; i < movies.size(); i++) {
				int movieId = movies.get(i).getId();
				HttpRequest req3 = HttpRequest.newBuilder()
				.uri(URI.create("https://api.themoviedb.org/3/movie/"+movieId+"/credits?language=ko-kr"))
			    .header("accept", "application/json")
			    .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNWE3ZGI2MDE3NGM1NDA4NWQ3NDA0NTM4MzllMzYyNyIsIm5iZiI6MTc0MDQwMDcxMy42NDk5OTk5LCJzdWIiOiI2N2JjNjg0OWJmNTIxZjE5MGYwYTkyYzYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.qb4mx4iM014XVXGXh1s2kfx6loE81ZPVMsHbXu15sLI")
			    .method("GET", HttpRequest.BodyPublishers.noBody())
			    .build();
			    HttpResponse<String> rep3 = HttpClient.newHttpClient().send(req3, HttpResponse.BodyHandlers.ofString());
			    System.out.println(rep3.body());
			   
			    ObjectMapper obj = new ObjectMapper();
			    JsonNode rootNode3 = obj.readTree(rep3.body());
			    JsonNode actorsNode = rootNode3.path("cast");
			    
			    if (actorsNode.isMissingNode() || actorsNode.isNull()) {
					System.out.println("No actor found in response.");
					return;
				}
			   
			    List<Actor> actors = new ArrayList<Actor>();
			    
			    int result = 0;
			    for(JsonNode node : actorsNode) {
			    	Actor actor = obj.treeToValue(node, Actor.class);
			    	actors.add(actor);
			    }
			    
			    result = movieService.insertActorAll(actors, movieId);

			    		
//			    obj.readValue(actorsNode.traverse(), new TypeReference<List<Actor>>() {});

//			    for(int j = 0; j < actors.size(); j++) {
//				    result = new MovieService().insertActor(actors.get(j));
//			    }
//			    request.setAttribute("actors", actors);
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
