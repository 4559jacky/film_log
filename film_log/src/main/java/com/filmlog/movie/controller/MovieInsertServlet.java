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
import com.filmlog.movie.model.vo.MovieDTO;

@WebServlet("/insertMovie")
public class MovieInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovieInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
	    String title = request.getParameter("title");
	    String originalTitle = request.getParameter("originalTitle");
	    String overview = request.getParameter("overview");
	    String runtimeStr = request.getParameter("runtime");
	    String releaseDate = request.getParameter("releaseDate");
	    String voteAverageStr = request.getParameter("voteAverage");
	    String posterPath = request.getParameter("posterPath");

	    // Null 또는 빈 문자열 체크 후 기본값 설정
	    int id = 0;
	    if(idStr != null && idStr.trim().isEmpty()) {
	    	try {
	    		id = Integer.parseInt(idStr);
	    	}catch(NumberFormatException e ) {
	    		id = 0;
	    	}
	    }
	    
	    int runtime = 0;
	    if (runtimeStr != null && !runtimeStr.trim().isEmpty()) {
	        try {
	            runtime = Integer.parseInt(runtimeStr);
	        } catch (NumberFormatException e) {
	            System.err.println("잘못된 runtime 값: " + runtimeStr);
	            runtime = 0; // 기본값 설정
	        }
	    }

	    double voteAverage = 0.0;
	    if (voteAverageStr != null && !voteAverageStr.trim().isEmpty()) {
	        try {
	            voteAverage = Double.parseDouble(voteAverageStr);
	        } catch (NumberFormatException e) {
	            System.err.println("잘못된 voteAverage 값: " + voteAverageStr);
	            voteAverage = 0.0; // 기본값 설정
	        }
	    }
		
		MovieDTO movie = new MovieDTO();
		movie.setId(id);
		movie.setTitle(title);
		movie.setOriginalTitle(originalTitle);
		movie.setOverview(overview);
		movie.setRuntime(runtime);
		movie.setReleaseDate(releaseDate); 
		movie.setVoteAverage(voteAverage);
		movie.setPosterPath(posterPath);
		System.out.println(movie);

		int result = new MovieService().insertMovieAdmin(movie);
		System.out.println(result);
		
//		RequestDispatcher view
//		= request.getRequestDispatcher("/views/member/admin/movieInsert.jsp");
//		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
