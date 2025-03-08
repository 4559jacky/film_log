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
		
		String movieTitle = request.getParameter("movie_title");
		String tempGenreType = request.getParameter("genre_type");
		System.out.println("tempGenreType" + tempGenreType);
		
		WatchedMovieRecord option = new WatchedMovieRecord();
		option.setMemberNo(member.getMemberNo());
		option.setMovieTitle(movieTitle);
		
		int nowPage = 1;
		option.setNowPage(nowPage);
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
			option.setNowPage(nowPage);
		}
		int genreType = 0;
		option.setGenreType(genreType);
		if(tempGenreType != null) {
			genreType = Integer.parseInt(tempGenreType);
			option.setGenreType(genreType);
		}
		
		int totalRecord = new WatchedMovieRecordService().selectRecordCount(option);
		option.setTotalData(totalRecord);
		
		List<WatchedMovieRecord> records = new WatchedMovieRecordService().selectRecordAll(option);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/member/general/myMovieLog.jsp");
		request.setAttribute("genres", genres);
		request.setAttribute("records", records);
		request.setAttribute("paging", option);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
