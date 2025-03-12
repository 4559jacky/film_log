package com.filmlog.freeboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.freeboard.model.service.FreeBoardService;
import com.filmlog.freeboard.model.vo.FreeBoard;

@WebServlet("/freeBoardUpdatePass")
public class FreeBoardUpdatePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FreeBoardUpdatePassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("freeBoardNo"));
	    
		FreeBoard board = new FreeBoardService().selectBoardOne(boardNo);
	    
	    RequestDispatcher view =
	              request.getRequestDispatcher("/views/freeBoard/freeBoardUpdate.jsp");
		request.setAttribute("freeBoard", board);
		view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
