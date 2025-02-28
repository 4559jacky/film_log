package com.filmlog.member.admin.controllor;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.qna.model.service.QnaService;
import com.filmlog.qna.model.vo.Qna;

@WebServlet("/qnaList")
public class SelectQnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectQnaListServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int nowPage = 1;
	    if (request.getParameter("nowPage") != null) {
	        nowPage = Integer.parseInt(request.getParameter("nowPage"));
	    }
		
		Qna option = new Qna();
		option.setNowPage(nowPage);
		
		int totalQna = new QnaService().selectQnaCount();
		option.setTotalData(totalQna);
		
		List<Qna> qnaList = new QnaService().selectQnaAll(option);
		RequestDispatcher view = request.getRequestDispatcher("/views/member/admin/qnaList.jsp");
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("paging", option);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
