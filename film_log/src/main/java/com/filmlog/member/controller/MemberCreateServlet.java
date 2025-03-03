package com.filmlog.member.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
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

import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.Member;
import com.filmlog.member.model.vo.MemberImg;

@WebServlet(name="memberCreateServlet", urlPatterns="/memberCreate")
public class MemberCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService memberService = new MemberService();
       
    public MemberCreateServlet() {
        super();
    }


	@SuppressWarnings({ "unchecked", "unused" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기까진 들어옴");
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		Member m = new Member();
		MemberImg mi = new MemberImg();
		
		String path = "C:\\dev\\film_log\\profile_img";
		
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		List<String> genreList = new ArrayList<String>();
		try {
			List<FileItem> items = upload.parseRequest(request);
			// items의 길이 체크(파일이 몇개 들어있는지)
			System.out.println(items.size());
			for(int i=0; i<items.size(); i++) {
				FileItem fileItem = items.get(i);
				if(fileItem.isFormField()) {
					switch(fileItem.getFieldName()) {
						case "member_id" :
							m.setMemberId(fileItem.getString("utf-8"));
							break;
						case "member_pwd" :
							m.setMemberPwd(fileItem.getString("utf-8"));
							break;
						case "member_name" :
							m.setMemberName(fileItem.getString("utf-8"));
							break;
						case "member_nickname" :
							m.setMemberNickname(fileItem.getString("utf-8"));
							break;
						case "member_email" :
							m.setMemberEmail(fileItem.getString("utf-8"));
							break;
						case "member_address" :
							m.setMemberAddr(fileItem.getString("utf-8"));
							break;
						case "member_phone" :
							m.setMemberPhone(fileItem.getString("utf-8"));
							break;
						case "member_birth" :
							m.setMemberBirth(fileItem.getString("utf-8"));
							break;
						case "member_gender" :
							m.setMemberGender(fileItem.getString("utf-8"));
							break;
						case "interest" :
							genreList.add(fileItem.getString("utf-8"));
							break;
					}
				} else {
					if(fileItem.getSize() > 0) {
						// 파일의 원래 이름 가져오기
						String oriName = fileItem.getName();
						int idx = oriName.lastIndexOf(".");
						// 파일 확장명 가져오기
						String ext = oriName.substring(idx);
						
						// UUID로 파일의 이름 랜덤값으로 이름 정해주기
						String uuid = UUID.randomUUID().toString().replace("-", "");
						// UUID로 만든 랜덤이름을 확장명을 붙여서 새로운 파일이름으로 붙여주기
						String newName = uuid+ext;
						
						// 여기까지가 자바에서 이미지를 받고 내 컴퓨터 경로로 이동하는 코드
						// 밑에 a.set부터 데이터베이스에 담아주는 코드
						File uploadFile = new File(dir,newName);
						fileItem.write(uploadFile);
						
						mi.setOriName(oriName);
						mi.setNewName(newName);
						// C:\\upload\\board\\새로운이름.확장자
						mi.setImgPath(path+"\\"+newName);
						
					} else { // 이미지 추가를 안했을 때 기본 이미지를 넣어준다.
						File defaultImg = new File("C:\\dev\\film_log\\noProfile_img\\profile.png");
						
						// 기본이미지가 존재여부
						if(defaultImg.exists()) {
							// UUID를 사용하여 새 파일명 생성
							String uuid = UUID.randomUUID().toString().replace("-", "");
							String newName = uuid + ".png";
							
							File copiedFile = new File(dir, newName);
							Files.copy(defaultImg.toPath(), copiedFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
							
							mi.setOriName("profile.png"); // 원본 파일명
				            mi.setNewName(newName); // 새 파일명
				            mi.setImgPath(path + "\\" + newName); // 저장 경로
						
						} else {
							System.out.println("기본 이미지가 존재하지 않습니다.");
						}
						
						
					}
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("회원 : "+m);
		System.out.println("관심 장르 : "+genreList);
		System.out.println("회원 이미지 : "+mi);
	
		int result = memberService.insertMember(m, genreList, mi);
		
		// 트랜잭션 X
//		int memberNo = memberService.InsertMember(m); // 멤버 번호를 바로 받아온다. 장르를 저장하기 위해서
//		int result = 0;
//		if(genreList == null && memberNo > 0) {
//			result = 1;
//		} else if(genreList != null && memberNo > 0) {
//			for(int i=0; i<genreList.size(); i++) {
//				Map<String,Integer> paramMap = new HashMap<String,Integer>();
//				int genreId = Integer.parseInt(genreList.get(i));
//				paramMap.put("memberNo", memberNo);
//				paramMap.put("genreId", genreId);
//				result = memberService.InsertMemberInterestGenre(paramMap);
//			}
//		}
		
		JSONObject obj2 = new JSONObject();
		obj2.put("res_code","500");
		obj2.put("res_msg", "회원가입에 실패하였습니다.\n정확하지않은 정보가있는지 확인해주세요.");
		
		if(result > 0) {
			obj2.put("res_code","200");
			obj2.put("res_msg", "회원가입에 성공하였습니다.\n로그인 페이지로 이동합니다.");
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj2);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
