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

@WebServlet("/duplicateNickNameCheckForInfoChange")
public class DuplicateNickNameCheckForInfoChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService memberService = new MemberService();
       
    public DuplicateNickNameCheckForInfoChangeServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberNickname = request.getParameter("member_nickname");
		String memberId = request.getParameter("member_id");
		
		Member member = memberService.selectMemberByNickname(memberNickname);
		JSONObject obj = new JSONObject();
		obj.put("res_code", "200");
		obj.put("res_msg", "사용가능한 닉네임입니다.");

		if(member != null && !member.getMemberId().equals(memberId)) {
			obj.put("res_code", "500");
			obj.put("res_msg", "중복된 닉네임입니다.");
			System.out.println(member.getMemberName());
		}
		
		
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
