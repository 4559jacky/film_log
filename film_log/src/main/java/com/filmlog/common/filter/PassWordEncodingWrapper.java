package com.filmlog.common.filter;

import java.security.MessageDigest;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PassWordEncodingWrapper extends HttpServletRequestWrapper {
	
	public PassWordEncodingWrapper(HttpServletRequest request)  {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		if(name.contains("member_pwd")) {
			String ori = super.getParameter(name);
			System.out.println("암호화 전 : " + ori);
			String enc = getSHA512(ori);
			System.out.println("암호화 후 : " + enc);
			return enc;
		}
		
		return super.getParameter(name);
	}
	
	// 단방향 암호화 메소드
	private String getSHA512(String str) {
		// 암호화 처리 클래스 선언
		MessageDigest md = null;
		try {
			// 적용할 알고리즘 선택해서 인스턴스화
			md = MessageDigest.getInstance("SHA-512");
		} catch(Exception e) {
			e.printStackTrace();
		}
		// String을 byte[]로 자름
		byte[] strByte = str.getBytes();
		// 자른 데이터를 암호화 처리
		md.update(strByte);
		// 암호화 처리된 값을 byte[]로 가져옴
		byte[] encryptByte = md.digest();
		// Base64인코더로 byte[]를 String으로 변환
		return Base64.getEncoder().encodeToString(encryptByte);
	}
}
