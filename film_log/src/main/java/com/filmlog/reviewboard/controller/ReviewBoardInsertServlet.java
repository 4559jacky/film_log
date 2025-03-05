package com.filmlog.reviewboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.filmlog.reviewboard.model.service.ReviewBoardService;
import com.filmlog.reviewboard.model.vo.ReviewBoard;
import com.filmlog.reviewboard.model.vo.ReviewBoardImg;


@WebServlet("/reviewBoardInsert")
public class ReviewBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReviewBoardInsertServlet() {
        super();
    }

	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewBoard board = new ReviewBoard();
		ReviewBoardImg img = null;
		
		String path = "C:\\upload\\reviewBoard";
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(dir);
		factory.setSizeThreshold(1024*1024*10);

		ServletFileUpload upload = new ServletFileUpload(factory);
	
		try {
			List<FileItem> items = upload.parseRequest(request);
			for(int i = 0 ; i<items.size() ;i++) {
				FileItem fileItem = items.get(i);
				if(fileItem.isFormField()) {
					switch(fileItem.getFieldName()) {
						case "movie_no" :
							System.out.println("영화 번호 : "+fileItem.getString("utf-8"));
							board.setMovieNo(Integer.parseInt(fileItem.getString("utf-8"))); break;
						case "review_board_title" :
							board.setReviewBoardTitle(fileItem.getString("utf-8")); break;
						case "review_board_content" :
							board.setReviewBoardContent(fileItem.getString("utf-8")); break;
						case "review_board_writer" :
							board.setReviewBoardWriter(Integer.parseInt(fileItem.getString("utf-8"))); break;
							
					}
				}else {
					if(fileItem.getSize()>0) {
						img = new ReviewBoardImg();
						String oriImg = fileItem.getName();
						int idx = oriImg.lastIndexOf(".");
						String ext = oriImg.substring(idx);
						
						String uuid = UUID.randomUUID().toString().replace("-","");
						String newImg = uuid + ext;
						
						File uploadFile = new File(dir,newImg);
						fileItem.write(uploadFile);
						
						img.setOriImg(oriImg);
						img.setNewImg(newImg);
						img.setImgPath(path+"\\"+newImg);
					}
				}
			}
			
			int result = 0;
			
			result = new ReviewBoardService().insertReviewBoard(board,img);
			
			JSONObject obj = new JSONObject();
			if(result>0) {
				obj.put("res_code", "200");
				obj.put("res_msg", "게시글 등록이 완료되었습니다.");
			}else {
				obj.put("res_code", "500");
				obj.put("res_msg", "게시글 등록 중 오류가 발생하였습니다.");
				if(img!= null) {
					String deletePath = img.getImgPath();
					File deleteFile = new File(deletePath);
					if(deleteFile.exists()) {
						deleteFile.delete();
					}		
				}
			}
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(obj);
			
			
		}catch(Exception e ) {
			e.printStackTrace();
		}
		
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
