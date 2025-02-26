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

@WebServlet(name="memberCreateServlet", urlPatterns="/memberCreate")
public class MemberCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService memberService = new MemberService();
       
    public MemberCreateServlet() {
        super();
    }


	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("member_id");

		Member member = memberService.selectMemberById(memberId);
		JSONObject obj = new JSONObject();
		obj.put("res_code", "200");
		obj.put("res_msg", "사용가능한 아이디입니다.");

		if(member != null) {
			obj.put("res_code", "500");
			obj.put("res_msg", "중복된 아이디입니다.");
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
		
		String memberPwd = request.getParameter("member_pwd");
		String memberName = request.getParameter("member_name");
		String memberNickname = request.getParameter("member_nickname");
		String memberBirth = request.getParameter("member_birth");
		String memberGender = request.getParameter("member_gender");
		String memberPhone = request.getParameter("member_phone");
		String memberAddr = request.getParameter("member_addr");
		String adminWhether = request.getParameter("admin_whether");
		
		Member mem = new Member(memberId, memberPwd, memberName, memberNickname,
				memberBirth, memberGender, memberPhone, memberAddr, adminWhether);
		
		int result = memberService.InsertMember(mem);
		
		
		
	} 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
