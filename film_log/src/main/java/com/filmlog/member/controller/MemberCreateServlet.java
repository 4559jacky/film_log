package com.filmlog.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@WebServlet(name="memberCreateServlet", urlPatterns="/memberCreate")
public class MemberCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberService memberService = new MemberService();
       
    public MemberCreateServlet() {
        super();
    }


	@SuppressWarnings({ "unchecked", "unused" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String memberId = request.getParameter("member_id");
//		String memberPwd = request.getParameter("member_pwd");
//		String memberName = request.getParameter("member_name");
//		String memberNickname = request.getParameter("member_nickname");
//		String memberEmail = request.getParameter("member_email");
//		String memberAddr = request.getParameter("member_addr");
//		String memberPhone = request.getParameter("member_phone");
//		String memberBirth = request.getParameter("member_birth");
//		String memberGender = request.getParameter("member_gender");
//		String[] interestGenre = request.getParameterValues("selectedOptions");

//		Member mem = new Member(memberId, memberPwd, memberName, memberNickname, memberEmail,
//				memberAddr, memberPhone, memberBirth, memberGender);
//		
//		int memberNo = memberService.InsertMember(mem); // 멤버 번호를 바로 받아온다. 장르를 저장하기 위해서
//		int result = 0;
//		int cnt = 0;
//		if(interestGenre == null && memberNo > 0) {
//			result = 1;
//		} else if(interestGenre != null && memberNo > 0) {
//			for(int i=0; i<interestGenre.length; i++) {
//				Map<String,Integer> paramMap = new HashMap<String,Integer>();
//				int genreId = Integer.parseInt(interestGenre[i]);
//				paramMap.put("memberNo", memberNo);
//				paramMap.put("genreId", genreId);
//				result = memberService.InsertMemberInterestGenre(paramMap);
//				cnt++;
//			}
//		}
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		Member m = new Member();
		List<String> genreList = new ArrayList<String>();
		try {
			List<FileItem> items = upload.parseRequest(request);
			// items의 길이 체크(파일이 몇개 들어있는지)
			System.out.println(items.size());
			for(int i=0; i<items.size(); i++) {
				FileItem fileItem = items.get(i);
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
				}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("회원 : "+m);
		System.out.println("관심 장르 : "+genreList);

		int memberNo = memberService.InsertMember(m); // 멤버 번호를 바로 받아온다. 장르를 저장하기 위해서
		int result = 0;
		if(genreList == null && memberNo > 0) {
			result = 1;
		} else if(genreList != null && memberNo > 0) {
			for(int i=0; i<genreList.size(); i++) {
				Map<String,Integer> paramMap = new HashMap<String,Integer>();
				int genreId = Integer.parseInt(genreList.get(i));
				paramMap.put("memberNo", memberNo);
				paramMap.put("genreId", genreId);
				result = memberService.InsertMemberInterestGenre(paramMap);
			}
		}
		
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
