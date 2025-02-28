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

@WebServlet(name="changePwd",urlPatterns="/changePwd")
public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberService();
       
    public ChangePwdServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("member_id");
		String memberPwd = request.getParameter("member_pwd");
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPwd(memberPwd);
		
		int result = memberService.updateMemberPwd(member);

		
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "비밀번호 변경에 실패하였습니다.");

		if(result > 0) {
			obj.put("res_code", "200");
			obj.put("res_msg", "비밀번호가 성공적으로 재설정되었습니다.");
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
