package com.filmlog.member.admin.controllor;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.movie.model.service.MovieService;
import com.filmlog.movie.model.vo.Actor;
import com.filmlog.movie.model.vo.Director;
import com.filmlog.movie.model.vo.Genre;
import com.filmlog.movie.model.vo.MovieDTO;

@WebServlet("/updateMoviePass")
public class UpdateMoviePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMoviePassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("들어오는지 test");
		int movieId = Integer.parseInt(request.getParameter("id"));
//		System.out.println("movieId"+movieId);

		MovieDTO md = new MovieService().selectMovieOne(movieId);
		List<Actor> ac = new MovieService().selectMovieActors(movieId);
		Director dt = new MovieService().selectMovieDirector(movieId);
		List<Genre> genres = new MovieService().selectMovieGenres(movieId);
		System.out.println("Actor : "+ac);
		System.out.println("Director : "+dt);
		System.out.println("Genre : "+genres);
		
		request.setAttribute("movie",md);
		request.setAttribute("actors",ac);
		request.setAttribute("director",dt);
		request.setAttribute("genres",genres);
		
		RequestDispatcher view
			= request.getRequestDispatcher("/views/member/admin/movieUpdate.jsp");
		view.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
