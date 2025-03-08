package com.filmlog.member.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.filmlog.member.model.vo.Member;
import com.filmlog.member.user.model.service.WatchedMovieRecordService;
import com.filmlog.member.user.model.vo.MonthWatch;
import com.filmlog.member.user.model.vo.YearWatch;

@WebServlet("/monthChart")
public class MonthChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MonthChartServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("member") != null) {
			member = (Member)session.getAttribute("member");
		}
		
		List<MonthWatch> months = new WatchedMovieRecordService().selectChartMonths(member.getMemberNo());
		
		JSONObject obj = new JSONObject();
		
		obj.put("res_code", "500");
		obj.put("res_msg", "데이터를 불러오는 중 오류가 발생했습니다.");
		
		if(months != null && !months.isEmpty()) {
			JSONArray monthArray = new JSONArray();
			
			for(MonthWatch month : months) {
				JSONObject monthObj = new JSONObject();
				monthObj.put("month", month.getMonth());
				monthObj.put("count", month.getCount());
				monthArray.add(monthObj);
			}
			
			obj.put("month", monthArray);
			obj.put("res_code", "200");
			obj.put("res_msg", "데이터를 정상적으로 불러왔습니다.");
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
