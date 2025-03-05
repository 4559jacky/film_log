<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<c:set var="rememberId" value="" />
<c:forEach var="cookie" items="${pageContext.request.cookies}">
    <c:if test="${cookie.name == 'remember_id'}">
        <c:set var="rememberId" value="${cookie.value}" />
    </c:if>
</c:forEach>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
    .joinBody {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
    }
    
    .find-account {
	    text-align: right;  /* 텍스트를 오른쪽 정렬 */
	}
	
	.find-account a {
	    margin-left: 10px;  /* 링크 간 간격 조정 */
	    color: #007bff;  /* 기본적인 부트스트랩 블루 컬러 */
	    text-decoration: none; /* 밑줄 제거 */
	}
	
	.find-account a:hover {
	    text-decoration: underline; /* 마우스 올리면 밑줄 추가 */
	}
  </style>
</head>
<body>
	<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">로그인</h4><br>
        <form class="validation-form" novalidate>
			<div id="login" class="login">
				<div class="row">
		            <div class="mb-3">
		              <label for="memberId">아이디</label>
		              <input type="text" class="form-control" name="member_id" id="memberId" placeholder="아이디"
		              value="<c:out value="${rememberId == null ? '' : rememberId}"/>" required>
		              <div class="invalid-feedback id-error">
		                아이디를 확인해주세요.
		              </div>
		            </div>
		            <div class="mb-3">
		              <label for="memberPwd">비밀번호</label>
		              <input type="password" class="form-control" name="member_pwd" id="memberPwd" placeholder="비밀번호" required>
		              <div class="invalid-feedback pwd-error">
		                비밀번호를 확인해주세요.
		              </div>
		            </div>
		            <div class="col-md-6 mb-3">
					    <input type="checkbox" name="remember_id" id="rememberId" <c:if test="${rememberId == null}">checked</c:if> >
					    <label for="rememberId">아이디 저장</label>
					</div>
					<div class="col-md-6 mb-3 find-account">
					    <a href="/findIdPass">아이디 찾기</a>
					    <a href="/changePwdPass">비밀번호 재설정</a>
					</div>
	          	</div>
			    <hr class="mb-4">
	            <div class="mb-4"></div>
	            <button class="btn btn-primary btn-lg btn-block" type="button" id="loginButton">로그인</button><br>
	            <button class="btn btn-primary btn-lg btn-block" type="button" id="joinButton">회원가입</button>
			</div>
        </form>
      </div>
    </div>
    </div> 
    <script type="text/javascript">
    	$('#loginButton').click(function(){
    		let form = $('.validation-form');
    		let id = form.find("input[name='member_id']").val();
	        let password = form.find("input[name='member_pwd']").val();
	        let rememberId =  form.find("input[name='remember_id']").val();
	        let isValid = true;
    		if (id == '') {
    			event.preventDefault();
	            event.stopPropagation();
				$("#memberId").addClass("is-invalid");
				isValid = false;
			} else {
				$("#memberId").removeClass("is-invalid").addClass("is-valid");
			}
    		if (password == '') {
    			event.preventDefault();
	            event.stopPropagation();
				$("#memberPwd").addClass("is-invalid");
				isValid = false;
			} else {
				$("#memberPwd").removeClass("is-invalid").addClass("is-valid");
			}
    		
    		if (!isValid) {
    			event.preventDefault();
	            event.stopPropagation();
	            alert("형식에 맞지않은 정보가 있습니다.");
	        } else {
	        	$.ajax({
	        		url:'/memberLogin',
	        		type:'post',
	        		data:{
	        			member_id : id,
	        			member_pwd : password,
	        			remember_id : rememberId
	        		},
	        		dataType: 'JSON',
	        		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            success: function (data) {
		            	alert(data.res_msg);
		                if (data.res_code === '200') {
		                    location.href = '/';
		                } else {
		                	event.preventDefault();
		    	            event.stopPropagation();
		    	            $("#memberId").addClass("is-invalid");
		    	            $("#memberPwd").addClass("is-invalid");
		    	            
		                }
		            }
	        	})
	        }
    	})
    	$('#joinButton').click(function(){
    		location.href = '/memberCreatePass';
    	})
    </script>
	<%-- <section>
	<div id="section_wrap">
			<div class="word">
				<h3>Login</h3>
			</div>
			<div class="login_form">
				
				
				<form action='/memberLogin' name="login_form" method="post">
					<input type="text"	name="member_id" 	placeholder="아이디"
					value="<c:out value="${rememberId == null ? '' : rememberId}"/>"> <br>
					<input type="password"	name="member_pwd" 	placeholder="비밀번호"> <br>
					<input type="checkbox" id="rememberId"
					<c:if test="${rememberId == null}">checked</c:if>>
					<label for="rememberId">아이디 저장</label>
					
					<label><input type="checkbox" name="interest" value="10749"> 로맨스</label>
					
					
					
					<br>
					<a href="/findId">아이디 찾기</a>
					<a href="/changePwd">비밀번호 변경</a><br>
					<input type="button"	value="로그인" onclick="loginForm();">				
				</form>
			</div>
			<div class="find_password_create_account">
				<a href='/memberCreatePass'>회원가입</a>
			</div>
		</div>
	</section> --%>
	<!-- <script type="text/javascript">
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
	</script> -->
</body>
</html>