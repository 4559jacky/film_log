package com.filmlog.qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.qna.model.service.QnaService;
import com.filmlog.qna.model.vo.Qna;

@WebServlet("/qna")
public class SelectOneQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneQnaServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tempQnaBoardNo = request.getParameter("qna_board_no");
		int qnaBoardNo = Integer.parseInt(tempQnaBoardNo);
		Qna qna = new QnaService().selectOneQna(qnaBoardNo);
		System.out.println(qna);
		RequestDispatcher view = request.getRequestDispatcher("/views/qna/showQna.jsp");
		request.setAttribute("qna", qna);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
