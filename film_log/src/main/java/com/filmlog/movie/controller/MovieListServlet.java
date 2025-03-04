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

@WebServlet("/movieList")
public class MovieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private MovieService movieService = new MovieService();
       
    public MovieListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nowPage = request.getParameter("nowPage");
		
//		int currentPage = 1;
//		if(nowPage != null && nowPage.trim().isEmpty()) {
//			try{
//				currentPage = Integer.parseInt(nowPage);
//			}catch(Exception e) {
//				currentPage = 1;
//			}
//		}
		
		MovieDTO option = new MovieDTO();
		
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
//		option.setNowPage(currentPage);
		
		int totalData = new MovieService().selectMovieListCount();
		option.setTotalData(totalData);
		
		System.out.println(totalData);
		
		List<MovieDTO> resultList = new MovieService().selectMovieList(option);
		
		RequestDispatcher view 
			= request.getRequestDispatcher("/views/movie/list.jsp");
		request.setAttribute("resultList", resultList);
		request.setAttribute("paging", option);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
