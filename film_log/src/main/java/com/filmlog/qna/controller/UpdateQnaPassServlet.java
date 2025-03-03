package com.filmlog.qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.filmlog.member.model.vo.Member;
import com.filmlog.qna.model.service.QnaService;
import com.filmlog.qna.model.vo.Qna;

@WebServlet("/updateQnaPass")
public class UpdateQnaPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateQnaPassServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		String tempQnaBoardNo = request.getParameter("qna_board_no");
		int qnaBoardNo = Integer.parseInt(tempQnaBoardNo);
		Qna qna = new QnaService().selectOneQna(qnaBoardNo);
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("member") != null) {
			member = (Member)session.getAttribute("member");
			if(member.getMemberNo() != qna.getMemberNo()) {
				response.sendRedirect("/");
			}
		} else {
			response.sendRedirect("/");
		}

		RequestDispatcher view = request.getRequestDispatcher("/views/qna/updateQna.jsp");
		request.setAttribute("qna", qna);
		request.setAttribute("member", member);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
