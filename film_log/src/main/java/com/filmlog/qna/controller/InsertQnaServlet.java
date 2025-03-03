package com.filmlog.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.qna.model.service.QnaService;
import com.filmlog.qna.model.vo.Qna;

@WebServlet("/qnaInsert")
public class InsertQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QnaService qnaService = new QnaService();
       
    public InsertQnaServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tempMemberNo = request.getParameter("member_no");
		int memberNo = Integer.parseInt(tempMemberNo);
		String tempQnaType = request.getParameter("qna_type");
		int qnaType = Integer.parseInt(tempQnaType);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Qna qna = new Qna();
		qna.setContent(content);
		qna.setQnaType(qnaType);
		qna.setTitle(title);
		qna.setMemberNo(memberNo);
		int result = qnaService.insertQna(qna);
		JSONObject obj = new JSONObject();
		obj.put("res_code", 500);
		obj.put("res_msg", "1:1문의 작성 중 오류가 발생하였습니다.");
		if(result > 0) {
			obj.put("res_code", 200);
			obj.put("res_msg", "정상적으로 등록되었습니다.");
			obj.put("qna_board_no", qna.getQnaBoardNo());
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
