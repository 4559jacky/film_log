package com.filmlog.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.Member;

@WebServlet("/memberLogin")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
       
    public MemberLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		List<Member> memberList = memberService.selectMemberAll();
//		System.out.println(memberList);
		String memberId = request.getParameter("member_id");
		String memberPwd = request.getParameter("member_pwd");
		System.out.println(memberId + " : " + memberPwd);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
