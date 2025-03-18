package com.filmlog.reviewboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.reviewboard.model.service.ReviewBoardService;


@WebServlet("/updateViews")
public class ReviewBoardUpdateViewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReviewBoardUpdateViewsServlet() {
        super();
    }

	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("reviewBoardNo");
		int reviewBoardNo = 0;
		if(temp !=null) reviewBoardNo = Integer.parseInt(temp);

		int updateViews = new ReviewBoardService().updateViews(reviewBoardNo);
		
		JSONObject obj = new JSONObject();
		if(updateViews>0) {
			obj.put("res_code", "200");
			obj.put("updateViews", updateViews);
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
