package com.filmlog.member.controller.duplicate_check;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.Member;

@WebServlet("/duplicatePhoneCheck")
public class DuplicatePhoneCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();

    public DuplicatePhoneCheckServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String memberPhone = request.getParameter("member_phone");
		
		Member member = memberService.selectMemberByPhone(memberPhone);
		JSONObject obj = new JSONObject();
		obj.put("res_code", "200");
		obj.put("res_msg", "사용가능한 번호입니다.");

		if(member != null) {
			obj.put("res_code", "500");
			obj.put("res_msg", "이미 사용중인 번호입니다.");
		}
		
		System.out.println("키보드 테스트");
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
