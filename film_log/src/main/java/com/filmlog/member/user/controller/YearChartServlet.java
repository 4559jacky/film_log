package com.filmlog.member.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.filmlog.member.model.vo.Member;

@WebServlet("/yearChart")
public class YearChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public YearChartServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("member") != null) {
			member = (Member)session.getAttribute("member");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
