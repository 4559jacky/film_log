package com.filmlog.reviewboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.reviewboard.model.service.ReviewBoardService;


@WebServlet("/reviewBoardDelete")
public class ReviewBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ReviewBoardDeleteServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("review_board_no");
		System.out.println("dddddddddd"+temp);
		int reviewBoardNo = 0;
		if(temp !=null) reviewBoardNo = Integer.parseInt(temp);
		int result = new ReviewBoardService().deleteReviewBoard(reviewBoardNo);
		System.out.println(result);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
