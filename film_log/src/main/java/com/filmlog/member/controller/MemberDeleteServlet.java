package com.filmlog.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.Member;

@WebServlet("/memberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
       
    public MemberDeleteServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("member_id");
//		Member member = memberService.selectMemberById(memberId);
		
		int result = memberService.deleteMemberById(memberId);
		
		JSONObject obj = new JSONObject();
		if(result > 0) {
			obj.put("res_code", "200");
			obj.put("res_msg", "회원탈퇴에 성공하였습니다. 메인페이지로 이동합니다.");
			HttpSession session = request.getSession(false);
			if(session != null && session.getAttribute("member") != null) {
				session.removeAttribute("member");
				session.invalidate();
			}
		} else {
			obj.put("res_code", "500");
			obj.put("res_msg", "회원탈퇴에 실패하였습니다.");
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
