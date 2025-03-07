
package com.filmlog.freeboard.model.vo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FreeBoard
 */
@WebServlet("/FreeBoard")
public class FreeBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

//package com.filmlog.freeboard.model.vo;
//
//import java.time.LocalDateTime;
//
//import com.filmlog.common.vo.Paging;
//
//import lombok.AllArgsConstructor;
//import lombok.Builder;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//import lombok.ToString;
//
//@NoArgsConstructor
//@AllArgsConstructor
//@Getter
//@Setter
//@ToString
//@Builder
//public class FreeBoard extends Paging{
//	
//	private int freeBoardNo;
//	private String freeBoardTitle;
//	private String freeBoardContent;
//	private int freeBoardWriter;
//	private int memberNo;
//	private String memberName;
//	private String memberNickname;
//	private LocalDateTime regDate;
//	private int views;
//	private int movieId;
//	private String movieTitle;
//	private int imgNo;
//	private String oriImg;
//	private String filter;
//	private String word;
//}

