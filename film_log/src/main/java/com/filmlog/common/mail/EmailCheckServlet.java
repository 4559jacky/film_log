/*
 * package com.filmlog.common.mail;
 * 
 * import java.io.IOException; import java.util.HashMap; import java.util.Map;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import org.json.simple.JSONObject;
 * 
 * import com.filmlog.member.model.service.MemberService; import
 * com.filmlog.member.model.vo.EmailCode;
 * 
 * @WebServlet("/emailCheck") public class EmailCheckServlet extends HttpServlet
 * { private static final long serialVersionUID = 1L;
 * 
 * public EmailCheckServlet() { super(); }
 * 
 * @SuppressWarnings("unchecked") protected void doGet(HttpServletRequest
 * request, HttpServletResponse response) throws ServletException, IOException {
 * System.out.println("여기 드렁오긴함?");
 * 
 * String email = request.getParameter("email"); String code =
 * request.getParameter("code"); System.out.println("email : "+email);
 * System.out.println("code : "+code);
 * 
 * Map<String,String> paramMap = new HashMap<String,String>();
 * paramMap.put("email", email); paramMap.put("code",code); JSONObject obj = new
 * JSONObject(); EmailCode emailCode = new
 * MemberService().checkEmailCode(paramMap); System.out.println(emailCode);
 * if(emailCode != null) { obj.put("res_code", "200"); obj.put("res_msg",
 * "이메일 인증이 완료되었습니다."); } else { obj.put("res_code", "500"); obj.put("res_msg",
 * "이메일 인증에 실패하였습니다."); }
 * 
 * response.setContentType("application/json; charset=utf-8");
 * response.getWriter().print(obj);
 * 
 * }
 * 
 * 
 * 
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { // TODO Auto-generated
 * method stub doGet(request, response); }
 * 
 * }
 */