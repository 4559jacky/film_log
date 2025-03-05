package com.filmlog.member.admin.controllor;

import java.io.IOException;

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
	        String temp1 = request.getParameter("id");
	 		int id = 0;
	 		if(temp1 != null) id = Integer.parseInt(temp1);
	 		
	 		String temp2 = request.getParameter("runtime");
	 		int runtime = 0;
	 		if(temp2 != null) runtime = Integer.parseInt(temp2);
	 		
	 		String temp3 = request.getParameter("voteAverage");
	 		double voteAverage = 0.0;
	 		if(temp3 != null) voteAverage = Double.parseDouble(temp3);
	 		
	 	    String title = request.getParameter("title");
	 	    String overview = request.getParameter("overview");
	 	    String releaseDate = request.getParameter("releaseDate");
	 	    String posterPath = request.getParameter("posterPath");
	 	    
	 	    if(id == 0) {
	 	    	obj.put("res_code", "400");
                obj.put("res_msg", "올바른 영화 번호를 입력하세요.");
	 	    }else {
	 	    	MovieDTO movie = new MovieDTO();
	 			movie.setId(id);
	 			movie.setTitle(title);
	 			movie.setOverview(overview);
	 			movie.setRuntime(runtime);
	 			movie.setReleaseDate(releaseDate); 
	 			movie.setVoteAverage(voteAverage);
	 			movie.setPosterPath(posterPath);

//	 			int result = MovieService.deleteBoard(movie);

//                if (result > 0) {
//                    obj.put("res_code", "200");
//                    obj.put("res_msg", "영화가 성공적으로 삭제되었습니다.");
//                } else {
//                    obj.put("res_code", "404");
//                    obj.put("res_msg", "해당 영화가 존재하지 않습니다.");
//                }
            }
        } catch (NumberFormatException e) {
            obj.put("res_code", "400");
            obj.put("res_msg", "영화 번호는 숫자여야 합니다.");
        } catch (Exception e) {
            obj.put("res_code", "500");
            obj.put("res_msg", "서버 오류가 발생했습니다.");
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
