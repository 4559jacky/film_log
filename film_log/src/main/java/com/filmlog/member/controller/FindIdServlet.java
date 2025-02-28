package com.filmlog.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.Member;

@WebServlet("/findId")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberService();
       
    public FindIdServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberName = request.getParameter("member_name");
		String memberPhone = request.getParameter("member_phone");
		System.out.println(memberName + " : " + memberPhone);
		
		Member member = new Member();
		member.setMemberName(memberName);
		member.setMemberPhone(memberPhone);
		
		Member m = memberService.selectMemberOne(member);
		System.out.println(m);
		
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "일치하는 정보가 없습니다.");

		if(m != null) {
			String memberId = m.getMemberId();
			obj.put("res_code", "200");
			obj.put("res_msg", "정보확인이 완료되었습니다.");
			obj.put("member_id", memberId);
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
