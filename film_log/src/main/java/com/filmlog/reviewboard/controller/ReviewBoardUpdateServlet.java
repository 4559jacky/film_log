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

@WebServlet("/reviewBoardUpdate")
public class ReviewBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReviewBoardUpdateServlet() {
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
							// 0보다 크지 않으면 처음에 이미지 값 없음 
						case "movie_id" :
							board.setMovieId(Integer.parseInt(fileItem.getString("utf-8"))); break;
						case "review_board_title" :
							board.setReviewBoardTitle(fileItem.getString("utf-8")); break;
						case "review_board_content" :
							board.setReviewBoardContent(fileItem.getString("utf-8")); break;
						case "review_board_writer" :
							board.setReviewBoardWriter(Integer.parseInt(fileItem.getString("utf-8"))); break;
						case "review_board_no" :
						    board.setReviewBoardNo(Integer.parseInt(fileItem.getString("utf-8"))); break;
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
						img.setReviewBoardNo(board.getReviewBoardNo());
					}
				}
			}
			
			int result = 0;
			
			System.out.println(board);
			
//		if(!보드에있는img 게터 써서.equals("0")) {
//			System.out.println("기존 이미지 ㅇㅇ");
//			System.out.println(imgNo);
//			// 원래 이미지 정보 가지고 파일 경로 조회해서 파일 삭제
//			// 제대로 들어오는지 판단하고 이미지 있을 때 컴에서 지우고 데베에서 딜리트
//			// 그 다음에 업데이트 해보쟝 ㅎㅎ
//		}else {
//			System.out.println("기존 이미지 ㄴ ㄴ ");
//		}
			
			result = new ReviewBoardService().updateReviewBoard(board,img);
			
			JSONObject obj = new JSONObject();
			if(result>0) {
				obj.put("res_code", "200");
				obj.put("res_msg", "게시글 수정이 완료되었습니다.");
			}else {
				obj.put("res_code", "500");
				obj.put("res_msg", "게시글 수정 중 오류가 발생하였습니다.");
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
