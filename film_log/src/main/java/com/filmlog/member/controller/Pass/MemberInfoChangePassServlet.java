package com.filmlog.member.controller.Pass;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.Member;
import com.filmlog.member.model.vo.MemberAddress;
import com.filmlog.member.model.vo.MemberImg;

@WebServlet("/memberInfoChangePass")
public class MemberInfoChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
       
    public MemberInfoChangePassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		Member member = new Member();
		
		if(session != null && session.getAttribute("member") != null) {
			member = (Member)session.getAttribute("member");
		}
		
		int memberNo = member.getMemberNo();
		
		List<Integer> genres = memberService.selectMemberInterestGenreAll(memberNo);
		MemberImg memberImg = memberService.selectMemberImg(memberNo);
		MemberAddress memberAddress = memberService.selectMemberAddress(memberNo);

		
		RequestDispatcher view = request.getRequestDispatcher("/views/member/my/myInfoChange.jsp");
		request.setAttribute("genres", genres);
		request.setAttribute("memberImg", memberImg);
		request.setAttribute("memberAddress", memberAddress);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
