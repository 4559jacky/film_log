package com.filmlog.member.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.member.user.model.service.WatchedMovieRecordService;

@WebServlet("/deleteRecord")
public class DeleteRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteRecordServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recordNo = Integer.parseInt(request.getParameter("record_no"));
		
		int result = new WatchedMovieRecordService().deleteRecord(recordNo);
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "삭제 중 오류가 발생하였습니다. 다시 시도해주세요.");
		if(result > 0) {
			obj.put("res_code", "200");
			obj.put("res_msg", "정상적으로 삭제 되었습니다.");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
