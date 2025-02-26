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
import com.filmlog.qna.model.service.QnaResponseService;
import com.filmlog.qna.model.service.QnaService;
import com.filmlog.qna.model.vo.Qna;
import com.filmlog.qna.model.vo.QnaResponse;

@WebServlet("/qna")
public class SelectOneQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneQnaServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("member") != null) {
			member = (Member)session.getAttribute("member");
		}
		
		String tempQnaBoardNo = request.getParameter("qna_board_no");
		int qnaBoardNo = Integer.parseInt(tempQnaBoardNo);
		Qna qna = new QnaService().selectOneQna(qnaBoardNo);
//		QnaResponse qnaResponse = new QnaResponseService().selectOneQnaResponse(qnaResponse.getQnaBoardNo());
		String qnaType = "";
		if(qna.getQnaType() == 1) {
			qnaType = "[영화 문의]";
		} else {
			qnaType = "[일반 문의]";
		}
		RequestDispatcher view = request.getRequestDispatcher("/views/qna/showQna.jsp");
		request.setAttribute("qna", qna);
		request.setAttribute("member",member);
		request.setAttribute("qnaType", qnaType);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
