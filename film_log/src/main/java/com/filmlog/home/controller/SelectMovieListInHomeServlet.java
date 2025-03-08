package com.filmlog.home.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.filmlog.member.model.vo.Member;
import com.filmlog.movie.model.service.MovieService;
import com.filmlog.movie.model.vo.Actor;
import com.filmlog.movie.model.vo.MovieDTO;

@WebServlet("/indexMovieList")
public class SelectMovieListInHomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SelectMovieListInHomeServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Member member = new Member();
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("member") != null) {
			member = (Member)session.getAttribute("member");
		}

        List<MovieDTO> movieList = new MovieService().selectMovieListInHome(member);
        
        for (MovieDTO movie : movieList) {
            movie.setActors(new MovieService().selectMovieActors(movie.getId()));
        }

        JSONObject obj = new JSONObject();
        obj.put("res_code", "500");

        if (movieList != null && !movieList.isEmpty()) {
            JSONArray jsonArray = new JSONArray();
            for (MovieDTO movie : movieList) {
                JSONObject movieObj = new JSONObject();
                movieObj.put("id", movie.getId());
                movieObj.put("title", movie.getTitle());
                movieObj.put("voteAverage", movie.getVoteAverage());
                movieObj.put("poster_path", movie.getPosterPath());
                String actors = "";
                for(Actor actor : movie.getActors()) {
                	actors += actor.getName();
                	actors += ", ";
                }
                movieObj.put("actors", actors);
                
                jsonArray.add(movieObj);
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

