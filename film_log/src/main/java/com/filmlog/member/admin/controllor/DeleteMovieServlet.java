package com.filmlog.member.admin.controllor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.filmlog.movie.model.service.MovieService;
import com.filmlog.movie.model.vo.MovieDTO;

@WebServlet("/deleteMovie")
public class DeleteMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMovieServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject obj = new JSONObject();

        try {
            // 1. 요청에서 "id" 값을 가져오고 유효성 검사
            String idParam = request.getParameter("id");
            int movieId = 0;
            if (idParam != null && idParam.matches("\\d+")) { // 숫자 형식 확인
                movieId = Integer.parseInt(idParam);
            } else {
                obj.put("res_code", "400");
                obj.put("res_msg", "올바른 영화 ID를 입력하세요.");
                response.setContentType("application/json; charset=utf-8");
                response.getWriter().print(obj);
                return; // 실행 중단
            }

            // 2. 영화 삭제 요청
            int result = new MovieService().deleteMovie(movieId);

            // 3. 결과 처리
            if (result > 0) {
                obj.put("res_code", "200");
                obj.put("res_msg", "영화가 성공적으로 삭제되었습니다.");
            } else {
                obj.put("res_code", "404");
                obj.put("res_msg", "해당 영화가 존재하지 않습니다.");
            }
        } catch (Exception e) {
            obj.put("res_code", "500");
            obj.put("res_msg", "서버 오류가 발생했습니다.");
        }

        // 4. JSON 응답 반환
        response.setContentType("application/json; charset=utf-8");
        response.getWriter().print(obj);
    }

		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
