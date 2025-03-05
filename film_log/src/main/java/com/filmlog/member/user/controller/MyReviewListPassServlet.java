package com.filmlog.member.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.reviewboard.model.service.ReviewBoardService;
import com.filmlog.reviewboard.model.vo.ReviewBoard;

@WebServlet("/myReviewListPass")
public class MyReviewListPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyReviewListPassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		String nowPage = request.getParameter("nowPage");
		
		ReviewBoard option = new ReviewBoard();
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		List<ReviewBoard> resultList = new ReviewBoardService().selectReviewBoardByMemberNo(memberNo);
		option.setTotalData(resultList.size());
		
		System.out.println(resultList);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/member/my/myReviewList.jsp");
		request.setAttribute("resultList", resultList);
		request.setAttribute("paging", option);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
