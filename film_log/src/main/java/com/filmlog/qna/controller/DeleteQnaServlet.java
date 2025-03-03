package com.filmlog.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.qna.model.service.QnaService;

@WebServlet("/deleteQna")
public class DeleteQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteQnaServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tempQnaBoardNo = request.getParameter("qna_board_no");
		int qnaBoardNo = Integer.parseInt(tempQnaBoardNo);
		int result = new QnaService().deleteQna(qnaBoardNo);
		JSONObject obj = new JSONObject();
		obj.put("res_msg", "삭제 중 문제가 발생하여, 삭제 하지 못 하였습니다.");
		obj.put("res_code", "500");
		
		if(result > 0) {
			obj.put("res_msg", "정상적으로 삭제 되었습니다.");
			obj.put("res_code", "200");
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
