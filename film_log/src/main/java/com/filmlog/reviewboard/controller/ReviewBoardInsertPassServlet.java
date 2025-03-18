package com.filmlog.reviewboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.movie.model.vo.MovieDTO;
import com.filmlog.reviewboard.model.service.ReviewBoardService;


@WebServlet("/reviewBoardInsertPass")
public class ReviewBoardInsertPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ReviewBoardInsertPassServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher view = request.getRequestDispatcher("/views/reviewBoard/reviewBoardInsert.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
