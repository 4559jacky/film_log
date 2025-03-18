package com.filmlog.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.Member;

@WebServlet(name="memberLoginServlet",urlPatterns="/memberLogin")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
       
    public MemberLoginServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("member_id");
		String memberPwd = request.getParameter("member_pwd");
		String rememberId = request.getParameter("remember_id");
		System.out.println(memberId + " : " + rememberId + " : " + memberPwd);
		
		Member member = new Member(memberId, memberPwd);
		Member m = memberService.selectMemberOne(member);
		System.out.println(m);
		
		JSONObject obj = new JSONObject();
		if(m != null) {
			HttpSession session = request.getSession();
			if(session.isNew() || session.getAttribute("member") == null) {
				session.setAttribute("member", m);
				session.setMaxInactiveInterval(60*30);
			}
			String value = "";
			int time = 0;
			if(rememberId.equals("Y")) {
				value = m.getMemberId();
				time = 60*60*24*7;
				Cookie cookie = new Cookie("remember_id",value);
				cookie.setHttpOnly(false); // JS에서 쿠키 접근 가능하도록 설정
				cookie.setSecure(false); // HTTPS에서만 쿠키 전송 방지 해제
				cookie.setMaxAge(time);
				cookie.setPath("/"); // 경로 설정 추가
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("remember_id","");
				cookie.setHttpOnly(false); // JS에서 쿠키 접근 가능하도록 설정
				cookie.setSecure(false); // HTTPS에서만 쿠키 전송 방지 해제
				cookie.setMaxAge(0);
				cookie.setPath("/"); // 경로 설정 추가
				response.addCookie(cookie);
			}
			
			
			obj.put("res_code", "200");
			obj.put("res_msg", "로그인에 성공하였습니다.\n메인 페이지로 이동합니다.");
			
		} else {
			// 실패시 다시 로그인 페이지 이동
			obj.put("res_code", "500");
			obj.put("res_msg", "로그인에 실패하였습니다.\n아이디 또는 비밀번호를 확인해주세요.");
			System.out.println("이거왜안됌");
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().write(obj.toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
