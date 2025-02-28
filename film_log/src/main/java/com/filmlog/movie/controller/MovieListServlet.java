package com.filmlog.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.movie.model.service.MovieService;
import com.filmlog.movie.model.vo.Movie;

@WebServlet("/movieList")
public class MovieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private MovieService movieService = new MovieService();
       
    public MovieListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* List<Movie> resultList = new MovieService().selectMovieList(); */
		/* request.setAttribute("resultList", resultList); */
		RequestDispatcher view 
			= request.getRequestDispatcher("/views/movie/list.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
