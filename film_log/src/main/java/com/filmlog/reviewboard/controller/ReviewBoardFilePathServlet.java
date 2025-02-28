package com.filmlog.reviewboard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmlog.reviewboard.model.service.ReviewBoardService;
import com.filmlog.reviewboard.model.vo.ReviewBoardImg;


@WebServlet("/reviewFilePath")
public class ReviewBoardFilePathServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ReviewBoardFilePathServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int imgNo = Integer.parseInt(request.getParameter("img_no"));
		ReviewBoardImg img = new ReviewBoardService().selectImgOne(imgNo);
		String filePath = img.getImgPath();
		if(filePath ==null || filePath.trim().equals("")) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		File file = new File(filePath);
		if(!file.exists()) {
			// 404오류(요청한 파일 찾을 수 없음) 발생
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		String mimeType = getServletContext().getMimeType(filePath);
		if(mimeType == null) {
			mimeType = "application/octet-stream";
		}
		response.setContentType(mimeType);
		
		try(FileInputStream fis =  new FileInputStream(file);
				OutputStream out = response.getOutputStream()){
			byte[] buffer = new byte[1024];
			int byteRead;
			while((byteRead = fis.read(buffer)) != -1) {
				out.write(buffer,0,byteRead);
			}
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
