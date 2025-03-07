<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/include/myMenuNav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
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
			<div id="changePwd">
			    <div class="input-form-backgroud row">
			      <div class="input-form col-md-12 mx-auto">
			        <h4 class="mb-3">비밀번호 재설정</h4><br>
			        <form class="changePwd-form" novalidate>
					<div class="row">
						<div class="mb-3">
			              <label for="nowMemberPwd">현재 비밀번호</label>
			              <input type="password" class="form-control" name="now_member_pwd" id="nowMemberPwd" placeholder="현재 비밀번호" required>
			              <div class="invalid-feedback nowMemberPwd-error">
			                형식에 맞지않는 비밀번호 입니다. (8자이상 18자이내)
			              </div>
			            </div>
			            <div class="mb-3">
			              <label for="memberPwd">비밀번호</label>
			              <input type="password" class="form-control" name="member_pwd" id="memberPwd" placeholder="새로운 비밀번호" required>
			              <div class="invalid-feedback">
			                형식에 맞지않는 비밀번호 입니다.(8자이상 18자이내)
			              </div>
			            </div>
			          <div class="mb-3">
			            <label for="memberPwdCheck">비밀번호 확인</label>
			            <input type="password" class="form-control" name="member_pwd_check" id="memberPwdCheck" placeholder="비밀번호 확인" required>
			            <div class="invalid-feedback">
			              비밀번호와 일치하지 않습니다.
			            </div>
			          </div>
		          	</div>
				    <hr class="mb-4">
		            <div class="mb-4"></div>
		            <button class="btn btn-primary btn-lg btn-block" type="button" id="changePwdButton">비밀번호 재설정</button>
		            </form>
				</div>
			</div>

    	</div>
    </div> 
    <script type="text/javascript">
    	$(document).ready(function(){
    		let memberId = "<c:out value='${member.memberId}'/>"
    		console.log("memberId" + memberId);
    		
    		$('#changePwdButton').click(async function(){
    			
    			let form = $('.changePwd-form');
    			let nowMemberPwd = form.find("input[name='now_member_pwd']").val();
    			let pwd = form.find("input[name='member_pwd']").val();
        		let pwdCheck = form.find("input[name='member_pwd_check']").val();
    	        let isValid = true;
    	        let nowPwdValid = true;

    			// 비밀번호 길이 검사
    			if (nowMemberPwd.length < 8 || nowMemberPwd.length > 18) {
    				form.find("input[name='now_member_pwd']").addClass('is-invalid').removeClass('is-valid');
		            $('.nowMemberPwd-error').text('비밀번호는 8자이상 18자이내입니다.').show();
		            isValid = false;
		        } else {
		        	nowPwdValid = await checknowMemberPwd(nowMemberPwd, memberId);
			        if (!nowPwdValid) {
			        	form.find("input[name='now_member_pwd']").addClass('is-invalid').removeClass('is-valid');
			        	$('.nowMemberPwd-error').text('비밀번호가 일치하지않습니다.').show();
			            isValid = false;
			        }
		        }

		        console.log("확인후 : "+isValid);
    	        
    	    	// 비밀번호 유효성 검사 (8자 이상 18자 이하)
		        if (!pwd || pwd.length < 8 || pwd.length > 18) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#memberPwd").addClass("is-invalid").removeClass("is-valid");
		            isValid = false;
		        } else {
		            $("#memberPwd").removeClass("is-invalid").addClass("is-valid");
		        }

		        // 비밀번호 확인 필드 검사
		        if (!pwdCheck || pwd !== pwdCheck) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#memberPwdCheck").addClass("is-invalid").removeClass("is-valid");
		            isValid = false;
		        } else {
		            $("#memberPwdCheck").removeClass("is-invalid").addClass("is-valid");
		        }
		        
        		if (isValid) {
        			$.ajax({
    					url : "/changePwd",
    					type : 'post',
    					ContentType : "application/x-www-form-urlencoded; charset=UTF-8",
    					data : {
    						member_id : memberId,
    						member_pwd : pwd,
    					},
    					dataType : "JSON",
    					success : function(data){
    						alert(data.res_msg);
    						if(data.res_code == '200') {
    							location.href = '/myPass'
    						} else {
    							event.preventDefault();
    				            event.stopPropagation();
    						}
    					}
    				})
    	        } else {
    	        	alert('정보가 일치하지않습니다.');
    	        }
        	});
    		
    		// 비밀번호 일치여부를 Promise 형태로 변경
		    function checknowMemberPwd(nowMemberPwd, memberId) {
		        return new Promise((resolve, reject) => {
		        	console.log(memberId + " : " + nowMemberPwd);
		            $.ajax({
		                url: "/checkPwd",
		                type: 'post',
		                data: { 
		                    "member_id": memberId,
		                    "member_pwd": nowMemberPwd
		                },
		                dataType: 'JSON',
		                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		                success: function (data) {
		                    if (data.res_code === '200') {
		                        $("input[name='now_member_pwd']").addClass('is-valid').removeClass('is-invalid');
		                        $('.now_member_pwd-error').hide();
		                        resolve(true); // 비밀번호 일치확인
		                        console.log("비밀번호 맞음");
		                    } else {
		                        $("input[name='now_member_pwd']").addClass('is-invalid').removeClass('is-valid');
		                        $('.now_member_pwd-error').text(data.res_msg).show();
		                        resolve(false); // 비밀번호 다름
		                        console.log("비밀번호 틀림");
		                    }
		                },
		                error: function () {
		                    reject(false);
		                }
		            });
		        });
		    }
    		
    		
    		

    	})

    	$('#loginButton').click(function(){
    		location.href = '/memberLoginPass';
    	})
    </script>
</body>
</html>