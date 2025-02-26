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
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요. (2-10자 이내)
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">닉네임</label>
              <input type="text" class="form-control" id="nickname" placeholder="" value="" required>
              <div class="invalid-feedback">
                중복된 닉네임 또는 형식에 맞지않는 닉네임입니다. (특수기호 제외 8자 이내)
              </div>
            </div>
          </div>

          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 형식에 맞게 입력해주세요. ex) hogildong123@gmail.com
            </div>
          </div>

          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <!-- <div class="mb-3">
            <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요.">
          </div> -->
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">전화번호</label>
              <input type="text" class="form-control" id="phone" placeholder="ex) 010-1111-1111" value="" required>
              <div class="invalid-feedback">
                전화번호를 형식에 맞게 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="nickname">생년월일</label>
              <input type="text" class="form-control" id="birth" placeholder="ex) 1998-12-07" value="" required>
              <div class="invalid-feedback">
                생년월일을 형식에 맞게 입력해주세요.
              </div>
            </div>
          </div>
          <div class="mb-3">
	          <div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
				  <label class="form-check-label" for="inlineRadio1">남자</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
				  <label class="form-check-label" for="inlineRadio2">여자</label>
				</div>
				<div class="invalid-feedback">
	              성별을 선택해주세요.
	            </div>
		</div>
          <!-- <div class="row">
            <div class="col-md-8 mb-3">
              <label for="root">전화번호</label>
              <select class="custom-select d-block w-100" id="root">
                <option value="010">010</option>
                <option>011</option>
                <option>카페</option>
              </select>
              <div class="invalid-feedback">
                가입 경로를 선택해주세요.
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="code">추천인 코드</label>
              <input type="text" class="form-control" id="code" placeholder="" required>
              <div class="invalid-feedback">
                추천인 코드를 입력해주세요.
              </div>
            </div>
          </div> -->
          <hr class="mb-4">
          <button class="btn btn-primary btn-lg btn-block" type="button">다음</button>
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
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');
	
      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
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