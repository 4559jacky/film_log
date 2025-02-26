package com.filmlog.movie.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.movie.model.service.MovieService;
import com.filmlog.movie.model.vo.MovieDTO;

@WebServlet("/movieCreate")
public class MovieCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovieCreateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String overview = request.getParameter("overview");
		String releaseDate = request.getParameter("releaseDate");
		int voteCount = Integer.parseInt(request.getParameter("voteCount"));
		double voteAverage = Double.parseDouble(request.getParameter("voteAverage"));
		String posterPath = request.getParameter("posterPath");

		String genreIdsStr = request.getParameter("genreIds");
		List<Integer> genreIds 
			= Arrays.stream(genreIdsStr.split(",")).map(Integer::parseInt).collect(Collectors.toList());
		
		MovieDTO movie = new MovieDTO();
		movie.setId(id);
		movie.setTitle(title);
		movie.setOverview(overview);
		movie.setReleaseDate(releaseDate);
		movie.setVoteCount(voteCount);
		movie.setVoteAverage(voteAverage);
		movie.setPosterPath(posterPath);
		movie.setGenreIds(genreIds);

		int result = new MovieService().insertMovie(movie);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
