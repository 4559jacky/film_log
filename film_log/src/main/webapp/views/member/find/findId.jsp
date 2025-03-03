<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
	        <h4 class="mb-3">아이디 찾기</h4><br>
	        <form class="validation-form" action='/findId' method='post'>
				<div id="findId" class="findId">
					<div class="row">
			            <div class="mb-3">
			              <label for="memberName">이름</label>
			              <input type="text" class="form-control" name="member_name" id="memberName" placeholder="이름"
			              value="" required>
			              <div class="invalid-feedback id-error">
			                이름을 입력해주세요. 
			              </div>
			            </div>
			            <div class="mb-3">
			              <label for="memberPhone">휴대폰 번호</label>
			              <input type="text" class="form-control" name="member_phone" id="memberPhone" placeholder="ex) 010-1111-1111" required>
			              <div class="invalid-feedback">
			                휴대폰번호를 양식에 맞게 입력해주세요.
			              </div>
			            </div>
			            <div class="col-md-6 mb-3">
						</div>
						<div class="col-md-6 mb-3 find-account">
						    <a href="/changePwdPass">비밀번호 재설정</a>
						</div>
		          	</div>
				    <hr class="mb-4">
		            <div class="mb-4"></div>
		            <button class="btn btn-primary btn-lg btn-block" type="button" id="findIdButton">아이디 찾기</button><br>
		            <button class="btn btn-primary btn-lg btn-block" type="button" id="loginButton">로그인 하러가기</button>
				</div>
				<div id="findIdSuccess" class="findIdSuccess">
					<div class="row">
			            <div class="mb-3">
			              <label for="memberId">아이디</label>
			              <input type="text" class="form-control" name="member_id" id="memberId" value=""  readonly>
			              <%-- <input type="text" class="form-control" name="member_id" id="memberId" value="<c:out value='${member_id}'/>"  readonly> --%>
			            </div>
			            <div class="col-md-6 mb-3">
						</div>
						<div class="col-md-6 mb-3 find-account">
						    <a href="/changePwdPass">비밀번호 재설정</a>
						</div>
		          	</div>
				    <hr class="mb-4">
		            <div class="mb-4"></div>
		            <button class="btn btn-primary btn-lg btn-block" type="button" id="loginButton">로그인 하러가기</button>
				</div>
	        </form>
	      </div>
	    </div>
    </div> 
    <script type="text/javascript">
    	$(document).ready(function(){
    		$('#findIdSuccess').hide();
    		
    		$('#findIdButton').click(function(){
    			let form = $('.validation-form');
        		let name = form.find("input[name='member_name']").val();
    	        let phone = form.find("input[name='member_phone']").val();
    	        let isValid = true;
        		if (!name || name < 2 || name > 10) {
        			event.preventDefault();
    	            event.stopPropagation();
    				$("#memberName").addClass("is-invalid");
    				isValid = false;
    			} else {
    				$("#memberName").removeClass("is-invalid").addClass("is-valid");
    			}
        		if (!phone || !/^\d{3}-\d{4}-\d{4}$/.test(phone)) {
        			event.preventDefault();
    	            event.stopPropagation();
    				$("#memberPhone").addClass("is-invalid");
    				isValid = false;
    			} else {
    				$("#memberPhone").removeClass("is-invalid").addClass("is-valid");
    			}
        		
        		if (isValid) {
        			$.ajax({
    					url : "/findId",
    					type : 'post',
    					ContentType : "application/x-www-form-urlencoded; charset=UTF-8",
    					data : {
    						member_name : name,
    						member_phone : phone
    					},
    					dataType : "JSON",
    					success : function(data){
    						alert(data.res_msg);
    						if(data.res_code == '200') {
    							$('#findId').hide();
    							$('#findIdSuccess').show();
    							form.find("input[name='member_id']").val(data.member_id);
    						} else {
    							event.preventDefault();
    				            event.stopPropagation();
    						}
    					}
    				})
    	        } else {
    	        	alert('해당하는 회원이 존재하지않습니다. 다시 확인해주세요.');
    	        }
        	})

    	})

    	$('#loginButton').click(function(){
    		location.href = '/memberLoginPass';
    	})
    </script>
</body>
</html>