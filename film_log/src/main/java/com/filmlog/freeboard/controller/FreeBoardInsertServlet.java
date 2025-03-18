package com.filmlog.freeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.freeboard.model.service.FreeBoardService;
import com.filmlog.freeboard.model.vo.FreeBoard;

@WebServlet("/freeBoardInsert")
public class FreeBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FreeBoardInsertServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		String temp = request.getParameter("memberNo");
		int memberNo = 0;
		if(temp != null) memberNo = Integer.parseInt(temp);
		
		FreeBoard board = new FreeBoard();
		board.setFreeBoardTitle(boardTitle);
		board.setFreeBoardContent(boardContent);
		board.setMemberNo(memberNo);
		int result = new FreeBoardService().insertFreeBoard(board);
		
		JSONObject obj = new JSONObject();
        if (result > 0) {
            obj.put("res_code", "200");
            obj.put("res_msg", "게시글이 성공적으로 작성되었습니다.");
        } else {
            obj.put("res_code", "500");
            obj.put("res_msg", "웹 사이트에서 페이지를 표시할 수 없습니다.");
        }
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
