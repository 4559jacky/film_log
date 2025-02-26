package com.filmlog.reviewboard.controller;

import java.io.IOException;

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
		int boardNo = Integer.parseInt(request.getParameter("reviewBoardNo"));
//		ReviewBoard rb = new ReviewBoardService().selectReviewBoardOne();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
