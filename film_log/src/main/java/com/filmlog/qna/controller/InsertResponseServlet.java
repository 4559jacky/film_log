package com.filmlog.qna.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.qna.model.service.QnaService;

@WebServlet("/insertResponse")
public class InsertResponseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertResponseServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnaBoardNo = Integer.parseInt(request.getParameter("qna_board_no"));
		String responseContent = request.getParameter("response_content");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaBoardNo", qnaBoardNo);
		map.put("responseContent", responseContent);
		
		int result = new QnaService().insertResponse(map);
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "답변 작성 중 문제가 발생하였습니다. 다시 시도해주세요.");
		if(result > 0) {
			obj.put("res_code", "200");
			obj.put("res_msg", "답변이 정상적으로 작성되었습니다.");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
