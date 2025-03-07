package com.filmlog.common.mail;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Random;

public class EmailVerification {
    public static void main(String[] args) throws FileNotFoundException, IOException {
        String email = "user-email@example.com";  // 사용자 이메일 입력 받기
        String verificationCode = generateVerificationCode();
        String subject = "회원가입 이메일 인증번호";
        String body = "회원가입을 위한 인증번호는 " + verificationCode + "입니다.";

        // 이메일 발송
        EmailSender.sendEmail(email, subject, body);

        // 인증번호를 세션에 저장 (또는 DB에 저장)
        // 예시로 세션을 사용한다면:
        // session.setAttribute("verificationCode", verificationCode);
    }

    private static String generateVerificationCode() {
        Random random = new Random();
        StringBuilder code = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            code.append(random.nextInt(10));  // 0부터 9까지 숫자 랜덤 생성
        }
        return code.toString();
    }
}
