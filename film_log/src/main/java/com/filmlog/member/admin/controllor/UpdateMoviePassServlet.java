package com.filmlog.member.admin.controllor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.movie.model.service.MovieService;
import com.filmlog.movie.model.vo.MovieDTO;

@WebServlet("/updateMoviePass")
public class UpdateMoviePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMoviePassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int movieId = Integer.parseInt(request.getParameter("id"));
		System.out.println(movieId);
		
		MovieDTO md = new MovieService().selectMovieOne(movieId);
		request.setAttribute("movie",md);
		
		RequestDispatcher view
		= request.getRequestDispatcher("/views/member/admin/movieUpdate.jsp");
		view.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
