package com.filmlog.member.admin.controllor;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/myQnaList")
public class SelectMyQnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMyQnaListServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("member") != null) {
			member = (Member)session.getAttribute("member");
		}
		int nowPage = 1;
	    if (request.getParameter("nowPage") != null) {
	        nowPage = Integer.parseInt(request.getParameter("nowPage"));
	    }
		
		Qna option = new Qna();
		option.setNowPage(nowPage);
		System.out.println(member.getMemberNo());
		option.setMemberNo(member.getMemberNo());
		
		int totalQna = new QnaService().selectMyQnaCount(member);
		option.setTotalData(totalQna);
		
		List<Qna> qnaList = new QnaService().selectMyQnaAll(option);
		RequestDispatcher view = request.getRequestDispatcher("/views/member/general/myQnaList.jsp");
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("paging", option);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
