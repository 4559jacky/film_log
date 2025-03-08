package com.filmlog.freeboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.freeboard.model.service.FreeBoardService;
import com.filmlog.freeboard.model.vo.FreeBoard;

@WebServlet("/freeBoardList")
public class FreeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FreeBoardListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoard option = new FreeBoard();
		int totalData = new FreeBoardService().selectBoardListCount();
		option.setTotalData(totalData);
		
		List<FreeBoard> resultList = new FreeBoardService().selectBoardList(option);
		request.setAttribute("freeBoardList", resultList);
		
		RequestDispatcher view
			= request.getRequestDispatcher("/views/freeBoard/freeBoardList.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
