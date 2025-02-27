package com.filmlog.reviewboard.controller;

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


@WebServlet("/reviewBoardList")
public class ReviewBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReviewBoardListServlet() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nowPage = request.getParameter("nowPage");
		
		ReviewBoard option = new ReviewBoard();
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		int totalData = new ReviewBoardService().selectReviewBoardCount(option);
		option.setTotalData(totalData);
		
		List<ReviewBoard> resultList = new ReviewBoardService().selectReviewBoardAll(option);
		System.out.println(resultList);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/reviewBoard/reviewBoardList.jsp");
		request.setAttribute("resultList", resultList);
		request.setAttribute("paging", option);
		view.forward(request, response);
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
