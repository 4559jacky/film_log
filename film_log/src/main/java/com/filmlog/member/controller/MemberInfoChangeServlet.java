package com.filmlog.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.filmlog.member.model.service.MemberService;
import com.filmlog.member.model.vo.Member;
import com.filmlog.member.model.vo.MemberAddress;
import com.filmlog.member.model.vo.MemberImg;

@WebServlet("/memberInfoChange")
public class MemberInfoChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService memberService = new MemberService();
       
    public MemberInfoChangeServlet() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		MemberImg memberImg = new MemberImg();
		MemberAddress ma = new MemberAddress();
		List<String> genreList = new ArrayList<String>();
		String path = "C:\\dev\\film_log\\profile_img";
		String defaultImg = "";
		
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
			// items의 길이 체크(파일이 몇개 들어있는지)
			System.out.println(items.size());
			for(int i=0; i<items.size(); i++) {
				FileItem fileItem = items.get(i);
				if(fileItem.isFormField()) {
					// (1) 파일이 아닌 폼 내부 요소
					// System.out.println(fileItem.getFieldName());
					switch(fileItem.getFieldName()) {
						case "member_id" :
							member.setMemberId(fileItem.getString("utf-8"));
							break;
						case "member_name" :
							member.setMemberName(fileItem.getString("utf-8"));
							break;
						case "member_nickname" :
							member.setMemberNickname(fileItem.getString("utf-8"));
							break;
						case "member_email" :
							member.setMemberEmail(fileItem.getString("utf-8"));
							break;
						case "postcode" :
							ma.setPostcode(Integer.parseInt(fileItem.getString("utf-8")));
							break;
						case "address" :
							ma.setAddress(fileItem.getString("utf-8"));
							break;
						case "detail_address" :
							ma.setDetailAddress(fileItem.getString("utf-8"));
							break;
						case "extra_address" :
							ma.setExtraAddress(fileItem.getString("utf-8"));
							break;
						case "member_phone" :
							member.setMemberPhone(fileItem.getString("utf-8"));
							break;
						case "member_birth" :
							member.setMemberBirth(fileItem.getString("utf-8"));
							break;
						case "member_gender" :
							member.setMemberGender(fileItem.getString("utf-8"));
							break;
						case "default_img" :
							defaultImg = fileItem.getString("utf-8");
							break;
						case "interest" :
							genreList.add(fileItem.getString("utf-8"));
							break;
					}
				} else {
					// (2) 파일 형태의 폼 요소
					// System.out.println(fileItem.getName());
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
						
						memberImg.setOriName(oriName);
						memberImg.setNewName(newName);
						// C:\\upload\\board\\새로운이름.확장자
						memberImg.setImgPath(path+"\\"+newName);	
					} else {
						memberImg = null;
					}
				}
			}
			Member mem = memberService.selectMemberById(member.getMemberId());
			member.setMemberNo(mem.getMemberNo());
			ma.setMemberNo(mem.getMemberNo());
			
			JSONObject obj = new JSONObject();
			
			if(memberImg != null) { // 이미지가 있으면 변경(멤버 정보, 관심장르, 이미지)
				System.out.println("수정전 회원정보"+mem);
				System.out.println("수정후 회원정보"+member);
				memberImg.setMemberNo(mem.getMemberNo());
				System.out.println("새로운 이미지 : "+memberImg);
				MemberImg oldMemberImg = memberService.selectMemberImg(mem.getMemberNo());
				System.out.println("전 이미지 : "+oldMemberImg);
				String deletePath = oldMemberImg.getImgPath();
				int result = memberService.updateMemberInfo(member, memberImg, genreList, ma);
				if(result >= 6) {
					obj.put("res_code", "200");
					obj.put("res_msg", "정상적으로 개인정보가 수정되었습니다.");
					File deleteFile = new File(deletePath);
					if(deleteFile.exists()) {
						deleteFile.delete();
					}
				} else {
					obj.put("res_code", "500");
					obj.put("res_msg", "개인정보가 수정 중 오류가 발생하였습니다.");
					String deletePath1 = memberImg.getImgPath();
					File deleteFile1 = new File(deletePath1);
					if(deleteFile1.exists()) {
						deleteFile1.delete();
					}
				}
			} else if(defaultImg.equals("true")) {
				
			} else { // 이미지 그대로 변경(멤버 정보, 관심장르)
				int result = memberService.updateMemberInfo(member, genreList, ma);
				if(result >= 4) {
					obj.put("res_code", "200");
					obj.put("res_msg", "정상적으로 개인정보가 수정되었습니다.");
				} else {
					obj.put("res_code", "500");
					obj.put("res_msg", "개인정보가 수정 중 오류가 발생하였습니다.");
				}
			}
			
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().print(obj);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		Member newMem = memberService.selectMemberById(member.getMemberId());
		HttpSession session = request.getSession();
		session.setAttribute("member", newMem);
		session.setMaxInactiveInterval(60*30);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
