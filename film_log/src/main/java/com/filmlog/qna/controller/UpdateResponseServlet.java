package com.filmlog.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.qna.model.service.QnaService;
import com.filmlog.qna.model.vo.QnaResponse;

@WebServlet("/updateResponse")
public class UpdateResponseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateResponseServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int responseNo = Integer.parseInt(request.getParameter("response_no"));
		String responseContent = request.getParameter("response_content");
		QnaResponse qnaResponse = new QnaResponse();
		qnaResponse.setResponseNo(responseNo);
		qnaResponse.setResponseContent(responseContent);
		int result = new QnaService().updateResponse(qnaResponse);
		JSONObject obj = new JSONObject();
		obj.put("res_code", 500);
		obj.put("res_msg", "수정 중 오류가 발생하였습니다.");
		if(result > 0) {
			obj.put("res_code", 200);
			obj.put("res_msg", "정상적으로 수정되었습니다.");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
