package com.filmlog.home.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.filmlog.reviewboard.model.service.ReviewBoardService;
import com.filmlog.reviewboard.model.vo.ReviewBoard;

@WebServlet("/indexReviewList")
public class SelectReviewListInHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectReviewListInHomeServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ReviewBoard> reviews = new ReviewBoardService().selectReviewListInHome();
		
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		
		if(reviews != null && !reviews.isEmpty()) {
			JSONArray jsonArray = new JSONArray();
			for(ReviewBoard review : reviews) {
				JSONObject reviewObj = new JSONObject();
				reviewObj.put("id", review.getReviewBoardNo());
				reviewObj.put("title", review.getReviewBoardTitle());
				reviewObj.put("nickname", review.getMemberNickname());
				reviewObj.put("imgNo", review.getImgNo());
				jsonArray.add(reviewObj);
			}
			
			obj.put("res_code", "200");
			obj.put("res_data", jsonArray);
			
		}
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
