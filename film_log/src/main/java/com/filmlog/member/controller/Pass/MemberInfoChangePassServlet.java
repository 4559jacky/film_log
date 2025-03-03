package com.filmlog.member.controller.Pass;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.MemberImg;

@WebServlet("/memberInfoChangePass")
public class MemberInfoChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
       
    public MemberInfoChangePassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		List<Integer> genres = memberService.selectMemberInterestGenreAll(memberNo);
		MemberImg memberImg = memberService.selectMemberImg(memberNo);

		
		RequestDispatcher view = request.getRequestDispatcher("/views/member/my/myInfoChange.jsp");
		request.setAttribute("genres", genres);
		request.setAttribute("memberImg", memberImg);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
