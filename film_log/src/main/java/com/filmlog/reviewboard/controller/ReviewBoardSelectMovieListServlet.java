package com.filmlog.reviewboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.filmlog.movie.model.vo.MovieDTO;
import com.filmlog.reviewboard.model.service.ReviewBoardService;


@WebServlet("/reviewBoardSelectMovieList")
public class ReviewBoardSelectMovieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public ReviewBoardSelectMovieListServlet() {
        super();
    }


	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String movieTitle = request.getParameter("movieTitle");
		
		List<MovieDTO> movieList = new ReviewBoardService().selectMovieListAll(movieTitle);
		
		JSONArray array = new JSONArray();
		
		for(int i=0 ; i<movieList.size() ; i++) {
			JSONObject obj = new JSONObject();
			obj.put("movieTitle", movieList.get(i).getTitle());
			obj.put("movieId", movieList.get(i).getId());
			array.add(obj);
		}
		
		JSONObject resultObj = new JSONObject();
		resultObj.put("movieArray", array);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(resultObj);     
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
