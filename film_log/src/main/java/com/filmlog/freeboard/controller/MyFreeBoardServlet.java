package com.filmlog.freeboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.filmlog.freeboard.model.service.FreeBoardService;
import com.filmlog.freeboard.model.vo.FreeBoard;
import com.filmlog.member.model.vo.Member;


@WebServlet("/myFreeBoard")
public class MyFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyFreeBoardServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("member") != null) {
			member = (Member)session.getAttribute("member");
		}
		
		List<FreeBoard> freeBoards = new FreeBoardService().selectMyBoardList(member);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/member/general/myFreeBoard.jsp");
		request.setAttribute("freeBoardList", freeBoards);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
