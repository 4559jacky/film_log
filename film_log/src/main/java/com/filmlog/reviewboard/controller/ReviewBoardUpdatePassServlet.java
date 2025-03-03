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


@WebServlet("/reviewBoardUpdatePass")
public class ReviewBoardUpdatePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReviewBoardUpdatePassServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewBoardNo = Integer.parseInt(request.getParameter("reviewBoardNo"));
		ReviewBoard ReviewBoard = new ReviewBoardService().selectReviewBoardOne(reviewBoardNo);
		RequestDispatcher view = request.getRequestDispatcher("/views/reviewBoard/reviewBoardUpdate.jsp");
		request.setAttribute("ReviewBoard", ReviewBoard);
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
