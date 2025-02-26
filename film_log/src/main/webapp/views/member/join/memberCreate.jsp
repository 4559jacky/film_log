<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include/nav.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
</head>
<body class="joinBody body">
	

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
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" novalidate>
        	<div id="join1">
	          <div class="row">
	            <div class="col-md-6 mb-3">
	              <label for="memberName">이름</label>
	              <input type="text" class="form-control" name="member_name" id="memberName" placeholder="" value="" required>
	              <div class="invalid-feedback">
	                이름을 입력해주세요. (2-10자 이내)
	              </div>
	            </div>
	            <div class="col-md-6 mb-3">
	              <label for="memberNickname">닉네임</label>
	              <input type="text" class="form-control" name="member_nickname" id="memberNickname" placeholder="" value="" required>
	              <div class="invalid-feedback">
	                중복된 닉네임 또는 형식에 맞지않는 닉네임입니다. (특수기호 제외 8자 이내)
	              </div>
	            </div>
	          </div>
	
	          <div class="mb-3">
	            <label for="memberEmail">이메일</label>
	            <input type="email" class="form-control" name="member_email" id="memberEmail" placeholder="you@example.com" required>
	            <div class="invalid-feedback">
	              이메일을 형식에 맞게 입력해주세요. ex) hogildong123@gmail.com
	            </div>
	          </div>
	
	          <div class="mb-3">
	            <label for="membeAddress">주소</label>
	            <input type="text" class="form-control" name="member_address" id="membeAddress" placeholder="서울특별시 강남구" required>
	            <div class="invalid-feedback">
	              주소를 입력해주세요.
	            </div>
	          </div>

	          <div class="row">
	            <div class="col-md-6 mb-3">
	              <label for="memberPhone">전화번호</label>
	              <input type="text" class="form-control" name="member_phone" id="memberPhone" placeholder="ex) 010-1111-1111" value="" required>
	              <div class="invalid-feedback">
	                전화번호를 형식에 맞게 입력해주세요.
	              </div>
	            </div>
	            <div class="col-md-6 mb-3">
	              <label for="memberBirth">생년월일</label>
	              <input type="date" class="form-control" name="member_birth" id="memberBirth" value="0000-00-00"
   					 min="1920-01-01" max="2025-03-12">
	              <!-- <input type="text" class="form-control" name="member_birth" id="memberBirth" placeholder="ex) 1998-12-07" value="" required> -->
	              <div class="invalid-feedback">
	                생년월일을 형식에 맞게 입력해주세요.
	              </div>
	            </div>
	          </div>
	          <div class="col-md-6 mb-3">
		          <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="M" checked>
					  <label class="form-check-label" for="inlineRadio1">남자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="F">
					  <label class="form-check-label" for="inlineRadio2">여자</label>
					</div>
					<div class="invalid-feedback">
		              성별을 선택해주세요.
		            </div>
				</div>
				<button class="btn btn-primary btn-lg btn-block btn-next1" type="button">다음</button>
			</div>
			<div id="join2">
				<div class="row">
	            <div class="col-md-6 mb-3">
	              <label for="memberId">아이디</label>
	              <input type="text" class="form-control" name="member_id" id="memberId" placeholder="아이디" value="" required>
	              <div class="invalid-feedback">
	                중복된 아이디 또는 형식에 맞지않는 아이디입니다.(특수기호 제외 8자 이내)
	              </div>
	            </div>
	            <div class="mb-3">
	              <label for="memberPwd">비밀번호</label>
	              <input type="text" class="form-control" name="member_pwd" id="memberPwd" placeholder="비밀번호" value="" required>
	              <div class="invalid-feedback">
	                형식에 맞지않는 비밀번호 입니다.(15자 이내)
	              </div>
	            </div>
	          </div>
	          <div class="mb-3">
	            <label for="memberPwdCheck">비밀번호 확인</label>
	            <input type="email" class="form-control" name="member_pwd_check" id="memberPwdCheck"placeholder="비밀번호 확인" required>
	            <div class="invalid-feedback">
	              비밀번호와 일치하지 않습니다.
	            </div>
	          </div>
	          <button class="btn btn-primary btn-lg btn-block btn-next2" type="button">다음</button>
			<button class="btn btn-secondary btn-lg btn-block btn-prev2" type="button">이전</button>
			</div>
			<div id="join3">
			    <p>관심사를 선택하세요</p>
			    <label><input type="checkbox" name="interest" value="멜로"> 멜로</label>
			    <label><input type="checkbox" name="interest" value="액션"> 액션</label>
			    <label><input type="checkbox" name="interest" value="어드벤처"> 어드벤처</label>
			    <label><input type="checkbox" name="interest" value="판타지"> 판타지</label>
			    <br>
			    <label><input type="checkbox" name="interest" value="드라마"> 드라마</label>
			    <label><input type="checkbox" name="interest" value="코미디"> 코미디</label>
			    <label><input type="checkbox" name="interest" value="스릴러"> 스릴러</label>
			    <label><input type="checkbox" name="interest" value="공포"> 공포</label>
			    <br>
			    <label><input type="checkbox" name="interest" value="범죄"> 범죄</label>
			    <label><input type="checkbox" name="interest" value="미스터리"> 미스터리</label>
			    <label><input type="checkbox" name="interest" value="애니메이션"> 애니메이션</label>
			    <label><input type="checkbox" name="interest" value="뮤지컬"> 뮤지컬</label>
			    <br>
			    <label><input type="checkbox" name="interest" value="역사"> 역사</label>
			    <label><input type="checkbox" name="interest" value="전쟁"> 전쟁</label>
			    <label><input type="checkbox" name="interest" value="스포츠"> 스포츠</label>
			    <label><input type="checkbox" name="interest" value="다큐"> 다큐</label>
				<label><input type="checkbox" name="interest" value="가족"> 가족</label>
				<br>
				<br>
			    <button class="btn btn-secondary btn-lg btn-block btn-prev3" type="button">이전</button>
			</div>
          <hr class="mb-4">
          <div class="mb-4"></div>
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div><br>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
    </div> 

	<script>
		// 버튼을 활용하여 페이지 전환 기능
		$(document).ready(function () {
			// div 숨기기
			$("#join2, #join3").hide(); 

		    $(".btn-next1").click(function () { 
		        $("#join1").hide();
		        $("#join2").show();
		    });
		
		    $(".btn-next2").click(function () { 
		        $("#join2").hide();
		        $("#join3").show();
		    });
		
		    $(".btn-prev2").click(function () {
		        $("#join2").hide();
		        $("#join1").show();
		    });
		
		    $(".btn-prev3").click(function () {
		        $("#join3").hide();
		        $("#join2").show();
		    });
		 });
		    $(document).ready(function () {
		    $('.validation-form').each(function () {
		        let form = $(this);
			
		        $(this).on('submit', function (event) {
		            // 사용자가 입력한 값들을 이 시점에서 가져오기
		            let name = form.find("input[name='member_name']").val();
		            let nickname = form.find("input[name='member_nickname']").val();
		            let duplicateNicknameCheck = false;
		            let email = form.find("input[name='member_email']").val();
		            let address = form.find("input[name='member_address']").val();
		            let phone = form.find("input[name='member_phone']").val();
		            let birth = form.find("input[name='member_birth']").val();
		            let gender = form.find("input[name='inlineRadioOptions']").val();
		            let id = form.find("input[name='member_id']").val();
		            let duplicateIdCheck = false;
		            let pwd = form.find("input[name='member_pwd']").val();
		            let pwdCheck = form.find("input[name='member_pwd_check']").val();
		            let selectedOptions = [];
		            $("input[name='interest']:checked").each(function () {
		                selectedOptions.push($(this).val());
		            });

		            console.log("선택된 관심사:", selectedOptions);

		            if (!this.checkValidity()) {
		                event.preventDefault();
		                event.stopPropagation();
		                $(this).addClass('was-validated');
		                alert('형식에 만족하지않은 항목이 존재합니다.');
		            } else {
		            	$.ajax({
		            		url : "/dulicateIdCheck",
							type : 'post',
							data : {
								"member_id" : id
							},
							dataType : 'JSON',
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data) {
								if(data.res_code == '200') {
									duplicateIdCheck = true;
								}
							}
		            	})
		            	$.ajax({
		            		url : "/duplicateNicknameCheck",
							type : 'post',
							data : {
								"member_nickname" : nickname
							},
							dataType : 'JSON',
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data) {
								if(data.res_code == '200') {
									duplicateNicknameCheck = true;
								}
							}
		            	})
		            	
		            	if(duplicateIdCheck == false) {
		            		alert('존재하는 아이디입니다.');
		            		id.focus();
		            	} else if(duplicateNicknameCheck == false) {
		            		alert('존재하는 닉네임입니다.');
		            		nickname.focus();
		            	} else if(pwd != pwdCheck) {
		            		alert('비밀번호가 일치하지 않습니다.');
		            		pwdCheck.focus();
		            	}
		            }
		            
		        });
		    });
		});
	</script>
	<script>
		
	</script>
	<!-- <script>
		const createMemberForm = function(){
			const form = document.create_member_form;
			if(!form.member_id.value){
				alert('아이디를 입력하세요.');
				form.member_id.focus();
			} else if(!form.member_pw.value){
				alert('비밀번호를 입력하세요.');
				form.member_pw.focus();
			} else if(!form.member_pw_check.value){
				alert('비밀번호 확인을 입력하세요.');
				form.member_pw_check.focus();
			} else if(form.member_pw.value != form.member_pw_check.value){
				alert('비밀번호가 일치하지 않습니다.');
				form.member_pw_check.focus();
			} else if(!form.member_name.value){
				alert('이름을 입력하세요.');
				form.member_name.focus();
			} else {
				// form.submit();
				$.ajax({
					url : "/memberCreateEnd",
					type : 'post',
					data : {
						"member_id" : form.member_id.value,
						"member_pw" : form.member_pw.value,
						"member_name" : form.member_name.value
					},
					dataType : 'JSON',
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {
						// console.log(data);
						// res_msg를 alert 창에 출력
						// 만약에 res_code가 200과 같다면
						// / 경로로 이동(location)
						alert(data.res_msg);
						if(data.res_code == '200') {
							location.href = "/";
						}
					}
				});
			}
		}
	</script> -->
</body>
</html>