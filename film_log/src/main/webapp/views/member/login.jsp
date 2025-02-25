<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<section>
	<div id="section_wrap">
			<div class="word">
				<h3>Login</h3>
			</div>
			<div class="login_form">
				<form action='/memberLogin' name="login_form" method="post">
					<input type="text"	name="member_id" 	placeholder="아이디"> <br>
					<input type="password"	name="member_pwd" 	placeholder="비밀번호"> <br>
					<a href="/findId">아이디 찾기</a>
					<a href="/changePwd">비밀번호 변경</a><br>
					<input type="button"	value="로그인" onclick="loginForm();">				
				</form>
			</div>
			<div class="find_password_create_account">
				<a href='/memberCreatePass'>회원가입</a>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		function loginForm() {
			let form = document.login_form;
			if (form.member_id.value == '') {
				alert('아이디를 입력하세요.');
				form.member_id.focus();	
			} else if (form.member_pwd.value == '') {
				alert('비밀번호를 입력하세요.');
				form.member_pwd.focus();
			} else {
				form.submit();
			}
		}
	</script>
</body>
</html>