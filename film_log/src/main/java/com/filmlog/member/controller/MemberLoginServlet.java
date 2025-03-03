package com.filmlog.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.Member;

@WebServlet(name="memberLoginServlet",urlPatterns="/memberLogin")
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
		String rememberId = request.getParameter("remember_id");
		System.out.println(memberId + " : " + memberPwd);
		
		Member member = new Member(memberId, memberPwd);
		Member m = memberService.selectMemberOne(member);
		System.out.println(m);
		if(m != null) {
			HttpSession session = request.getSession();
			if(session.isNew() || session.getAttribute("member") == null) {
				session.setAttribute("member", m);
				session.setMaxInactiveInterval(60*30);
			}
			String value = "";
			int time = 0;
			if(rememberId != null) {
				value = m.getMemberId();
				time = 60*60*24*7;
			} else {
				Cookie cookie = new Cookie("remember_id","");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			Cookie cookie = new Cookie("remember_id",value);
			cookie.setMaxAge(time);
			response.addCookie(cookie);
			// 성공시 메인 페이지로 이동
			response.sendRedirect("/");
		} else {
			// 실패시 다시 로그인 페이지 이동
			response.sendRedirect("/memberLoginPass");
			System.out.println("이거왜안됌");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
