package com.filmlog.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

@WebServlet(name="encryptPwServlet",urlPatterns="/encryptPassword")
public class EncryptPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EncryptPwServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_pwd = request.getParameter("member_pwd");
		System.out.println(member_pwd);
		
        
        // 비밀번호가 비어있으면 오류 응답
        if (member_pwd == null || member_pwd.trim().isEmpty()) {
            response.setContentType("application/json; charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            
            JsonObject errorJson = new JsonObject();
            errorJson.addProperty("res_code", "400");
            errorJson.addProperty("res_msg", "비밀번호가 없습니다.");
            response.getWriter().write(errorJson.toString());
            return;
        } else {
        	JsonObject jsonResponse = new JsonObject();
    		jsonResponse.addProperty("res_code", "200");
            jsonResponse.addProperty("res_msg", "비밀번호 암호화 성공");
            jsonResponse.addProperty("member_pwd", member_pwd);
            // 응답 설정 및 전송
            response.setContentType("application/json; charset=UTF-8");
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(jsonResponse.toString());
        }
		
        
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
