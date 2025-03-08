package com.filmlog.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.Member;

@WebServlet(name="checkPwd",urlPatterns="/checkPwd")
public class CheckPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberService();
       
    public CheckPwdServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("member_id");
		String memberPwd = request.getParameter("member_pwd");
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPwd(memberPwd);
		
		Member member = memberService.selectMemberPwdForChangePwd(m);
		
		JSONObject obj = new JSONObject();
		if(member != null) {
			obj.put("res_code", "200");
			obj.put("res_msg", "비밀번호 일치 확인");
		} else {
			obj.put("res_code", "500");
			obj.put("res_msg", "비밀번호 불일치");
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
