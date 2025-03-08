package com.filmlog.member.user.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.filmlog.member.model.vo.Member;
import com.filmlog.member.user.model.service.WatchedMovieRecordService;
import com.filmlog.member.user.model.vo.WatchedMovieRecord;

@WebServlet("/updateRecord")
public class UpdateRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateRecordServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("member") != null) {
			member = (Member)session.getAttribute("member");
		}
		
		int movieId = Integer.parseInt(request.getParameter("movie_id"));
		String watched_date = request.getParameter("watched_date");
		String memo = request.getParameter("memo");
		String recordNo = request.getParameter("recordNo");
		
		watched_date = watched_date.replace("T", " ");
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
	    LocalDateTime localDateTime = LocalDateTime.parse(watched_date, formatter);
		
		WatchedMovieRecord record = new WatchedMovieRecord();
		record.setMovieNo(movieId);
		record.setWatchedDate(localDateTime);
		record.setMemo(memo);
		record.setMemberNo(member.getMemberNo());
		
		int result = new WatchedMovieRecordService().updateRecord(record);
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "기록 수정 중 오류가 발생하였습니다. 다시 시도해주세요.");
		if(result > 0) {
			obj.put("res_code", "200");
			obj.put("res_msg", "기록 수정이 정상적으로 완료 되었습니다.");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
