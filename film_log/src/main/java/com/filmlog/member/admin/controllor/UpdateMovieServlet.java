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

@WebServlet("/updateMovie")
public class UpdateMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMovieServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp1 = request.getParameter("id");
		int id = 0;
		if(temp1 != null) id = Integer.parseInt(temp1);
		
		String temp2 = request.getParameter("runtime");
		int runtime = 0;
		if(temp2 != null) runtime = Integer.parseInt(temp2);
		
		String temp3 = request.getParameter("voteAverage");
		double voteAverage = 0.0;
		if(temp3 != null) voteAverage = Double.parseDouble(temp3);
		
	    String title = request.getParameter("title");
	    String overview = request.getParameter("overview");
	    String releaseDate = request.getParameter("releaseDate");
	    String posterPath = request.getParameter("posterPath");
		
		MovieDTO movie = new MovieDTO();
		movie.setId(id);
		movie.setTitle(title);
		movie.setOverview(overview);
		movie.setRuntime(runtime);
		movie.setReleaseDate(releaseDate); 
		movie.setVoteAverage(voteAverage);
		movie.setPosterPath(posterPath);
		System.out.println(movie);

		int result = new MovieService().updateMovie(movie);
		System.out.println(result);
		
		RequestDispatcher view
		= request.getRequestDispatcher("/views/member/admin/movieUpdate.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
