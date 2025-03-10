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

@WebServlet("/freeBoardUpdate")
public class FreeBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FreeBoardUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("boardNo");
        int freeBoardNo = 0;
        if(temp != null) freeBoardNo = Integer.parseInt(temp);
        
        String temp2 = request.getParameter("boardWriter");
        int memberNo = 0;
        if(temp2 != null) memberNo = Integer.parseInt(temp2);
        
        String freeBoardTitle = request.getParameter("boardTitle");
        String freeBoardContent = request.getParameter("boardContent");
        
        FreeBoard board = new FreeBoard();
        board.setFreeBoardNo(freeBoardNo);
        board.setMemberNo(memberNo);
        board.setFreeBoardTitle(freeBoardTitle);
        board.setFreeBoardContent(freeBoardContent);
        int result = new FreeBoardService().updateBoard(board);

        JSONObject obj = new JSONObject();
        if(result>0){
           obj.put("res_code","200");
           obj.put("res_msg","게시글 수정이 완료되었습니다.");
        }else{
           obj.put("res_code","500");
           obj.put("res_msg","게시글 수정 중 오류가 발생하였습니다.");
        }
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
