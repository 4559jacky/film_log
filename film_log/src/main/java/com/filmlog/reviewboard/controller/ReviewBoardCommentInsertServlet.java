package com.filmlog.reviewboard.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
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
		
		ReviewBoardComment comment = new ReviewBoardComment();
		comment.setReviewBoardNo(reviewBoardNo);
		comment.setMemberNo(memberNo);
		comment.setComment(commentContent);
		
		int commentNo = new ReviewBoardService().insertReviewBoardComment(comment);
		System.out.println("서블릿 : "+commentNo);
		
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "댓글 등록에 실패하였습니다.");
		
		if(commentNo>0) {
			ReviewBoardComment commentOne = new ReviewBoardService().selectReviewBoardCommentOne(commentNo);
			System.out.println("No"+commentOne);
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			
			obj.put("res_code", "200");
			obj.put("res_msg", "댓글 등록에 성공하였습니다.");
			obj.put("commentNo", commentOne.getReviewBoardCommentNo());
			obj.put("comment", commentOne.getComment());
			obj.put("regDate", commentOne.getRegDate().format(formatter));
		    obj.put("modDate", commentOne.getModDate().format(formatter));
		    obj.put("reviewBoardNo", commentOne.getReviewBoardNo());
		    obj.put("memberNo", commentOne.getMemberNo());
		    obj.put("commentWriter", commentOne.getCommentWriter());
		    
		}
		
		response.setContentType("application/json");  
	    response.setCharacterEncoding("UTF-8");  
//	    response.getWriter().print(obj);
	    response.getWriter().write(obj.toString());  
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
