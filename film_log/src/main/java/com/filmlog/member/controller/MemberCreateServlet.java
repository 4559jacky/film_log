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
		
		JSONObject obj2 = new JSONObject();
		obj2.put("res_code","500");
		obj2.put("res_msg", "회원가입에 실패하였습니다.");
		
		if(result > 0) {
			obj2.put("res_code","200");
			obj2.put("res_msg", "회원가입에 성공하였습니다.");
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj2);
		
	} 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
