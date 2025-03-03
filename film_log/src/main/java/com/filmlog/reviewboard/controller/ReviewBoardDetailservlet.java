package com.filmlog.reviewboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.reviewboard.model.service.ReviewBoardService;
import com.filmlog.reviewboard.model.vo.ReviewBoard;


@WebServlet("/reviewBoardDetail")
public class ReviewBoardDetailservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReviewBoardDetailservlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewBoardNo = Integer.parseInt(request.getParameter("review_board_no"));
		ReviewBoard ReviewBoard = new ReviewBoardService().selectReviewBoardOne(reviewBoardNo);
		RequestDispatcher view = request.getRequestDispatcher("/views/reviewBoard/reviewBoardDetail.jsp");
		request.setAttribute("ReviewBoard", ReviewBoard);
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
