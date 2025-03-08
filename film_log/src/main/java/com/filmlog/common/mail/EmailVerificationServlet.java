/*
 * package com.filmlog.common.mail;
 * 
 * import java.io.IOException; import java.util.HashMap; import java.util.Map;
 * import java.util.Random;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import org.json.simple.JSONObject;
 * 
 * import com.filmlog.member.model.service.MemberService; import
 * com.filmlog.member.model.vo.EmailCode; import
 * com.filmlog.member.model.vo.Member;
 * 
 * @WebServlet("/emailVerification") public class EmailVerificationServlet
 * extends HttpServlet { private static final long serialVersionUID = 1L;
 * 
 * public EmailVerificationServlet() { super(); }
 * 
 * @SuppressWarnings("unchecked") protected void doGet(HttpServletRequest
 * request, HttpServletResponse response) throws ServletException, IOException {
 * String email = request.getParameter("email"); String verificationCode =
 * generateVerificationCode(); String subject = "FilmLog 회원가입 인증 코드"; String
 * body = "환영합니다. 회원가입을 위한 인증코드는 '" + verificationCode + "'입니다.";
 * 
 * // 인증번호를 세션에 저장 (또는 DB에 저장) // 예시로 세션을 사용한다면: //
 * session.setAttribute("verificationCode", verificationCode);
 * 
 * JSONObject obj = new JSONObject();
 * 
 * Member member = new MemberService().selectEmail(email); Map<String,String>
 * param = new HashMap<String,String>(); param.put("email", email); EmailCode ec
 * = new MemberService().checkEmailCode(param); System.out.println(ec); int
 * result2 = 0; if(member == null) { if(ec != null) { Map<String,String>
 * paramMap = new HashMap<String,String>(); paramMap.put("email", email);
 * paramMap.put("code",verificationCode); result2 = new
 * MemberService().updateEmailCode(paramMap); EmailSender.sendEmail(email,
 * subject, body); } else { EmailSender.sendEmail(email, subject, body);
 * Map<String,String> paramMap = new HashMap<String,String>();
 * paramMap.put("email", email); paramMap.put("code",verificationCode); result2
 * = new MemberService().insertEmailCode(paramMap); }
 * 
 * // 이메일 발송 if(result2 > 0) { obj.put("res_code", "200"); obj.put("res_msg",
 * "이메일로 인증번호를 보냈습니다."); } else { obj.put("res_code", "500"); obj.put("res_msg",
 * "이메일 전송에 실패했습니다."); } } else { obj.put("res_code", "500"); obj.put("res_msg",
 * "이미 사용중인 이메일입니다."); }
 * 
 * 
 * response.setContentType("application/json; charset=utf-8");
 * response.getWriter().print(obj); }
 * 
 * private static String generateVerificationCode() { Random random = new
 * Random(); StringBuilder code = new StringBuilder(); for (int i = 0; i < 6;
 * i++) { code.append(random.nextInt(10)); // 0부터 9까지 숫자 랜덤 생성 } return
 * code.toString(); }
 * 
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { doGet(request, response); }
 * 
 * }
 */