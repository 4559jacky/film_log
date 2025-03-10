package com.filmlog.freeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.freeboard.model.service.FreeBoardService;

@WebServlet("/freeBoardDelete")
public class FreeBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FreeBoardDeleteServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("freeBoardNo");
        int boardNo = 0;
        if(temp != null) boardNo = Integer.parseInt(temp);
       
        int result = new FreeBoardService().deleteBoard(boardNo);

        JSONObject obj = new JSONObject(); 
		  if(result>0) {
			  obj.put("res_code", "200");
			  obj.put("res_msg", "게시글 삭제를 성공하였습니다.");
		  }else{
            obj.put("res_code", "500");
		    obj.put("res_msg", "게시글 삭제에 실패하였습니다.");
        }
		  response.setContentType("application/json; charset=utf-8");
		  response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
