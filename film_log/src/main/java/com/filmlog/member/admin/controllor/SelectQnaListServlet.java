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
		String qnaTitle = request.getParameter("qna_title");
		String tempQnaType = request.getParameter("qna_type");
		String tempIsAnswer = request.getParameter("is_answer");
		int nowPage = 1;
	    if (request.getParameter("nowPage") != null) {
	        nowPage = Integer.parseInt(request.getParameter("nowPage"));
	    }
		
	    int qnaType = 0;
		Qna option = new Qna();
		option.setNowPage(nowPage);
		option.setTitle(qnaTitle);
		
		if(tempQnaType != null) {
			qnaType = Integer.parseInt(tempQnaType);
			option.setQnaType(qnaType);
		}
		int isAnswer = 0;
		if(tempIsAnswer != null) {
			isAnswer = Integer.parseInt(tempIsAnswer);
			option.setIsAnswer(isAnswer);
		}
		
		int totalQna = new QnaService().selectQnaCount(option);
		option.setTotalData(totalQna);
		System.out.println("나 전체 갯수요 : "+totalQna);
		
		
		
		
		List<Qna> qnaList = new QnaService().selectQnaAll(option);
		
		for (Qna qna : qnaList) {
	        if (qna.getQnaType() == 1) {
	            qna.setQnaTypeStr("[영화문의]");
	        } else if (qna.getQnaType() == 2) {
	            qna.setQnaTypeStr("[일반문의]");
	        }
	    }
		
		RequestDispatcher view = request.getRequestDispatcher("/views/member/admin/qnaList.jsp");
		System.out.println(isAnswer);
		request.setAttribute("isAnswer", isAnswer);
		request.setAttribute("qnaType", qnaType);
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("paging", option);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
