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
import com.filmlog.reviewboard.model.service.ReviewBoardService;
import com.filmlog.reviewboard.model.vo.ReviewBoard;

@WebServlet("/myReviewListPass")
public class MyReviewListPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyReviewListPassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member member = new Member();
		if(session != null && session.getAttribute("member") != null) {
			member = (Member)session.getAttribute("member");
		}
		int memberNo = member.getMemberNo();
		
		ReviewBoard option = new ReviewBoard();
		
		String nowPage = request.getParameter("nowPage");
	    if (request.getParameter("nowPage") != null) {
	    	option.setNowPage(Integer.parseInt(nowPage));
	    }
	    
		String filter = request.getParameter("search_filter");
		String word = request.getParameter("search_word");
		
		System.out.println("검색 : "+memberNo + ","+filter+","+word);
		
//		if(word.equals("title")) option.setReviewBoardTitle(word);
//		else if(word.equals("movieName")) option.setMovieTitle(word);
		
		option.setMemberNo(memberNo);
		option.setFilter(filter);
		option.setWord(word);
		
		List<ReviewBoard> resultList = new ReviewBoardService().selectReviewBoardListByWord(option);
		option.setTotalData(resultList.size());
//		if(filter != null) {
//			if(filter.equals("0")) {
//				resultList = new ReviewBoardService().selectReviewBoardByMemberNo(memberNo);
//				option.setTotalData(resultList.size());
//			} else {
//				resultList = new ReviewBoardService().selectReviewBoardListByWord(memberNo,filter,word);
//				option.setTotalData(resultList.size());
//			}
//		} else {
//			resultList = new ReviewBoardService().selectReviewBoardByMemberNo(memberNo);
//			option.setTotalData(resultList.size());
//		}
		System.out.println(option.getTotalData());
		RequestDispatcher view = request.getRequestDispatcher("/views/member/my/myReviewList.jsp");
		request.setAttribute("resultList", resultList);
		request.setAttribute("paging", option);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}