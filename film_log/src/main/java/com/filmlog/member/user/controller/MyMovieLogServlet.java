package com.filmlog.member.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.filmlog.member.model.vo.Member;
import com.filmlog.member.user.model.service.WatchedMovieRecordService;
import com.filmlog.member.user.model.vo.WatchedMovieRecord;
import com.filmlog.movie.model.vo.Genre;

@WebServlet("/myMovieLog")
public class MyMovieLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyMovieLogServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("member") != null) {
			member = (Member)session.getAttribute("member");
		}
		
		List<Genre> genres = new WatchedMovieRecordService().selectGenre(member.getMemberNo());
		System.out.println(genres);
		
		/*
		 * String movieTitle = request.getParameter("movie_title"); String tempgenreType
		 * = request.getParameter("genre_type"); int nowPage = 1;
		 * if(request.getParameter("nowPage") != null) { nowPage =
		 * Integer.parseInt(request.getParameter("nowPage")); }
		 * 
		 * int genreType = 0; WatchedMovieRecord option = new WatchedMovieRecord();
		 * option.setNowPage(nowPage); option.setMovieTitle(movieTitle);
		 * 
		 * int totalRecord = new WatchedMovieRecordService().selectRecordCount(option);
		 */
		
		RequestDispatcher view = request.getRequestDispatcher("/views/member/general/myMovieLog.jsp");
		request.setAttribute("genres", genres);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
