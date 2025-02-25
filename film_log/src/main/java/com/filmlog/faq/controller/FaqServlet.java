package com.filmlog.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.faq.model.service.FaqService;
import com.filmlog.faq.model.vo.Faq;
import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.Member;

@WebServlet("/faq")
public class FaqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
	private FaqService faqService = new FaqService();
       
    public FaqServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 임시로 관리자 계정 가져옴
		// 이후에 nav에 있는 세션에 있는 값을 사용
		Member member = memberService.tempSelectAdmin(1);
		System.out.println(member);

		List<Faq> faqList = faqService.selectFaqAll();
		RequestDispatcher view = request.getRequestDispatcher("/views/faq/faq.jsp");
		System.out.println(member.getAdminWhether());
		request.setAttribute("isAdmin", member.getAdminWhether());
		request.setAttribute("faqList", faqList);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
