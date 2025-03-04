package com.filmlog.reviewboard.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.reviewboard.model.service.ReviewBoardService;
import com.filmlog.reviewboard.model.vo.ReviewBoardComment;


@WebServlet("/insertReviewComment")
public class ReviewBoardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReviewBoardCommentInsertServlet() {
        super();
    }

	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewBoardNo = Integer.parseInt(request.getParameter("reviewBoardNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String commentContent = request.getParameter("commentContent");
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("review_board_no",reviewBoardNo);
		map.put("member_no",memberNo);
		map.put("comment_content",commentContent);
		
		int CommentNo = new ReviewBoardService().insertReviewBoardComment(map);
		
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "댓글 등록에 실패하였습니다.");
		
		if(CommentNo>0) {
			obj.put("res_code", "200");
			obj.put("res_msg", "댓글 등록에 성공하였습니다.");
			
			ReviewBoardComment comment = new ReviewBoardService().selectReviewBoardCommentOne(CommentNo);
			System.out.println("No"+CommentNo);
		    
		}
		
		response.setContentType("application/json");  
	    response.setCharacterEncoding("UTF-8");      
	    response.getWriter().write(obj.toString());  
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
