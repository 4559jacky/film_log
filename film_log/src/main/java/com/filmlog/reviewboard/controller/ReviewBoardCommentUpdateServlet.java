package com.filmlog.reviewboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.reviewboard.model.service.ReviewBoardService;
import com.filmlog.reviewboard.model.vo.ReviewBoardComment;


@WebServlet("/reviewBoardCommentUpdate")
public class ReviewBoardCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ReviewBoardCommentUpdateServlet() {
        super();
    }

	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("commentNo");
		int commentNo = 0;
		if(temp !=null) commentNo = Integer.parseInt(temp);
		String commentContent = request.getParameter("commentContent");
		
		ReviewBoardComment comment = new ReviewBoardComment();
		comment.setReviewBoardCommentNo(commentNo);
		comment.setComment(commentContent);
		
		int result = new ReviewBoardService().updateReviewBoardComment(comment);
		
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "댓글 수정에 실패하였습니다.");
		if(result>0) {
			obj.put("res_code", "200");
			obj.put("res_msg", "댓글 수정을 성공하였습니다.");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
