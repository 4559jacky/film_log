package com.filmlog.member.user.controller;

import java.io.IOException;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.member.user.model.service.WatchedMovieRecordService;
import com.filmlog.member.user.model.vo.WatchedMovieRecord;

@WebServlet("/selectRecordOne")
public class SelectRecordOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectRecordOneServlet() {}

    @SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int recordNo = Integer.parseInt(request.getParameter("record_no"));
    	
    	WatchedMovieRecord record = new WatchedMovieRecordService().selectRecordOne(recordNo);
		
    	System.out.println(record);
    	JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "수정 중 오류가 발생하였습니다. 다시 시도해주세요.");
		if(record != null) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			String watchedDateStr = record.getWatchedDate().format(formatter);
			obj.put("watchedDate", watchedDateStr);
			obj.put("res_code", "200");
			obj.put("res_msg", "수정 가능합니다.");
			obj.put("recordNo", record.getRecordNo());
			obj.put("movieNo", record.getMovieNo());
			obj.put("memberNo", record.getMemberNo());
			obj.put("memo", record.getMemo());
			obj.put("watchedDate", watchedDateStr);
			obj.put("movieTitle", record.getMovieTitle());
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
