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
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" novalidate>
        	<div id="join1" class="join1">
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
				    <input type="text" class="form-control" name="member_nickname" id="memberNickname" placeholder="특수기호 제외 8자 이내" value="" required>
				    <div class="invalid-feedback nickname-error">
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
	              <input type="date" class="form-control" name="member_birth" id="memberBirth" value="yyyy-MM-dd"
   					 min="1920-01-01" max="2025-03-12">
	              <!-- <input type="text" class="form-control" name="member_birth" id="memberBirth" placeholder="ex) 1998-12-07" value="" required> -->
	              <div class="invalid-feedback">
	                생년월일을 형식에 맞게 입력해주세요.
	              </div>
	            </div>
	          </div>
	          <div class="col-md-6 mb-3">
		          <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="member_gender" id="inlineRadio1" value="M" checked>
					  <label class="form-check-label" for="inlineRadio1">남자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="member_gender" id="inlineRadio2" value="F">
					  <label class="form-check-label" for="inlineRadio2">여자</label>
					</div>
					<div class="invalid-feedback">
		              성별을 선택해주세요.
		            </div>
				</div>
				<button class="btn btn-primary btn-lg btn-block btn-next1" type="button">다음</button>
			</div>
			<div id="join2" class="join2">
				<div class="row">
	            <div class="col-md-6 mb-3">
	              <label for="memberId">아이디</label>
	              <input type="text" class="form-control" name="member_id" id="memberId" placeholder="아이디" value="" required>
	              <div class="invalid-feedback id-error">
	                중복된 아이디 또는 형식에 맞지않는 아이디입니다.(특수기호 제외 8자이상 15자이내)
	              </div>
	            </div>
	            <div class="mb-3">
	              <label for="memberPwd">비밀번호</label>
	              <form class="password-form">
	              <input type="password" class="form-control" name="member_pwd" id="memberPwd" placeholder="비밀번호" required>
	              </form>
	              <div class="invalid-feedback">
	                형식에 맞지않는 비밀번호 입니다.(10자이상 18자이내)
	              </div>
	            </div>
	          </div>
	          <div class="mb-3">
	            <label for="memberPwdCheck">비밀번호 확인</label>
	            <input type="password" class="form-control" name="member_pwd_check" id="memberPwdCheck" placeholder="비밀번호 확인" required>
	            <div class="invalid-feedback">
	              비밀번호와 일치하지 않습니다.
	            </div>
	          </div>
	          <button class="btn btn-primary btn-lg btn-block btn-next2" type="button">다음</button>
			<button class="btn btn-secondary btn-lg btn-block btn-prev2" type="button">이전</button>
			</div>
			<div id="join3" class="join3">
			    <p>관심사를 선택하세요(필수선택 X)</p>
			    <label><input type="checkbox" name="interest" value="10749"> 로맨스</label>
			    <label><input type="checkbox" name="interest" value="28"> 액션</label>
			    <label><input type="checkbox" name="interest" value="12"> 어드벤처</label>
			    <label><input type="checkbox" name="interest" value="14"> 판타지</label>
			    <br>
			    <label><input type="checkbox" name="interest" value="18"> 드라마</label>
			    <label><input type="checkbox" name="interest" value="35"> 코미디</label>
			    <label><input type="checkbox" name="interest" value="53"> 스릴러</label>
			    <label><input type="checkbox" name="interest" value="27"> 공포</label>
			    <br>
			    <label><input type="checkbox" name="interest" value="80"> 범죄</label>
			    <label><input type="checkbox" name="interest" value="9648"> 미스터리</label>
			    <label><input type="checkbox" name="interest" value="16"> 애니메이션</label>
			    <label><input type="checkbox" name="interest" value="10402"> 뮤지컬</label>
			    <label><input type="checkbox" name="interest" value="878"> SF</label>
			    <br>
			    <label><input type="checkbox" name="interest" value="36"> 역사</label>
			    <label><input type="checkbox" name="interest" value="10752"> 전쟁</label>
			    <label><input type="checkbox" name="interest" value="37"> 서부</label>
			    <label><input type="checkbox" name="interest" value="99"> 다큐</label>
				<label><input type="checkbox" name="interest" value="10751"> 가족</label>
				<br>
				<br>
			    <button class="btn btn-secondary btn-lg btn-block btn-prev3" type="button">이전</button>
			    <hr class="mb-4">
	            <div class="mb-4"></div>
	              <div class="custom-control custom-checkbox">
	                <input type="checkbox" class="custom-control-input" name="aggrement" id="aggrement" required>
	                <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
	              </div><br>
	            <button class="btn btn-primary btn-lg btn-block" type="button" id="joinButton">가입 완료</button>
				</div>
          
        </form>
      </div>
    </div>
    </div> 

	<script type="text/javascript">
		// 버튼을 활용하여 페이지 전환 기능
		$(document).ready(function () {
			// div 숨기기
			$("#join2, #join3").hide();
			
			/* 정규식 무시하고 다음으로 이동 */
			/* $(".btn-next1").click(function () {
		        $("#join1").hide();
		        $("#join2").show();
		    }); */

			// 닉네임 중복 검사
		    $('#memberNickname').on('input', function () {
		        let nickname = $(this).val();
		        let inputField = $(this);
		        
		        // 닉네임 길이 검사 (2~8자 사이가 아닐 경우)
		        if (nickname.length < 2 || nickname.length > 8) {
		            inputField.addClass('is-invalid').removeClass('is-valid');
		            $('.nickname-error').text('닉네임은 2~8자 이내여야 합니다.').show();
		            return; // 중복 검사 실행 X
		        }

		        $.ajax({
		            url: "/duplicateNicknameCheck",
		            type: 'post',
		            data: { "member_nickname": nickname },
		            dataType: 'JSON',
		            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            success: function (data) {
		                if (data.res_code === '200') {
		                    inputField.addClass('is-valid').removeClass('is-invalid');
		                    $('.nickname-error').hide();
		                } else {
		                    inputField.addClass('is-invalid').removeClass('is-valid');
		                    $('.nickname-error').text('이미 사용 중인 닉네임입니다.').show();
		                }
		            }
		        });
		    });

		    // "다음" 버튼 클릭 시 유효성 검사 및 페이지 이동
		    $(".btn-next1").click(function (event) {
		        let form = $('.validation-form');
		        let name = form.find("input[name='member_name']").val();
		        let nickname = form.find("input[name='member_nickname']").val();
		        let email = form.find("input[name='member_email']")[0]; // HTML input element 직접 가져옴
		        let address = form.find("input[name='member_address']").val();
		        let phone = form.find("input[name='member_phone']").val();
		        let birth = form.find("input[name='member_birth']").val();
		        let gender = form.find("input[name='member_gender']").val();

		        let isNicknameValid = $("#memberNickname").hasClass("is-valid");
		        let isValid = true;
		        // 유효성 검사
		        if (!name || name.length < 2 || name.length > 10) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#memberName").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#memberName").removeClass("is-invalid").addClass("is-valid");
		        }

		        if (!isNicknameValid) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#memberNickname").addClass("is-invalid");
		            isValid = false;
		        }

		        if (!email.checkValidity()) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#memberEmail").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#memberEmail").removeClass("is-invalid").addClass("is-valid");
		        }

		        if (!address) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#membeAddress").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#membeAddress").removeClass("is-invalid").addClass("is-valid");
		        }

		        if (!phone || !/^\d{3}-\d{4}-\d{4}$/.test(phone)) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#memberPhone").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#memberPhone").removeClass("is-invalid").addClass("is-valid");
		        }
		        
		        // 생년월일 정규식표현
		        const dateRegex = /^(19|20)\d{2}-(0[1-9]|1[0-2])-([0-2][1-9]|3[01])$/;

		        if (!birth || dateRegex.test(birth) == false) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#memberBirth").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#memberBirth").removeClass("is-invalid").addClass("is-valid");
		        }

		        if (!gender) {
		            event.preventDefault();
		            event.stopPropagation();
		            $(".form-check-input").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $(".form-check-input").removeClass("is-invalid").addClass("is-valid");
		        }

		        // 모든 필드가 유효할 때만 페이지 이동
		        if (isValid) {
		            $("#join1").hide();
		            $("#join2").show();
		        } else {
		        	alert('정확하지 않은 정보가 있습니다.');
		        }
		    });
		    
		    /* 정규식 무시하고 다음으로 이동 */
		    /* $(".btn-next2").click(function () {
		        $("#join2").hide();
		        $("#join3").show();
		    }); */
		    
		    ///////////////////////////////////////
		    
		    // 아이디 중복검사
		    $('#memberId').on('input', function () {
		        let id = $(this).val();
		        let inputField = $(this);
		        
		        // 아이디 길이 검사 (6~15자 사이가 아닐 경우)
		        if (id.length < 6 || id.length > 15) {
		            inputField.addClass('is-invalid').removeClass('is-valid');
		            $('.id-error').text('아이디는 6~15자 이내여야 합니다.').show();
		            return; // 중복 검사 실행 X
		        }

		        $.ajax({
		            url: "/dulicateIdCheck",
		            type: 'post',
		            data: { "member_id": id },
		            dataType: 'JSON',
		            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            success: function (data) {
		                if (data.res_code === '200') {
		                    inputField.addClass('is-valid').removeClass('is-invalid');
		                    $('.id-error').hide();
		                } else {
		                    inputField.addClass('is-invalid').removeClass('is-valid');
		                    $('.id-error').text('이미 사용 중인 아이디입니다.').show();
		                }
		            }
		        });
		    });
		
		    $(".btn-next2").click(function (event) { 
		        let form = $('.validation-form');
		        let id = form.find("input[name='member_id']").val();
		        let pwd = form.find("input[name='member_pwd']").val();
		        let pwdCheck = form.find("input[name='member_pwd_check']").val();

		        let isIdValid = $("#memberId").hasClass("is-valid");
		        let isValid = true; // 전체 유효성 체크용 변수

		        // 아이디 유효성 검사
		        if (!isIdValid) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#memberId").addClass("is-invalid");
		            isValid = false;
		        }

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

		        // 모든 필드가 유효할 때만 페이지 이동
		        if (isValid) {
		            $("#join2").hide();
		            $("#join3").show();
		        } else {
		            alert('정확하지 않은 정보가 있습니다.');
		        }
		    });
		    
		    ///////////////////////////
		    
		    $(".btn-prev2").click(function () {
		        $("#join2").hide();
		        $("#join1").show();
		    });
		
		    $(".btn-prev3").click(function () {
		        $("#join3").hide();
		        $("#join2").show();
		    });
		 });
		
		//////////////////////////////////////////////////////////////

    	// 가입완료 버튼
    	$(document).ready(function () {
            $('#joinButton').click(function(event) {
             	// 사용자가 입력한 값들을 이 시점에서 가져오기
             	let form = $('.validation-form');
	            let name = form.find("input[name='member_name']").val();
	            let nickname = form.find("input[name='member_nickname']").val();
	            let duplicateNicknameCheck = false;
	            let email = form.find("input[name='member_email']").val();
	            let address = form.find("input[name='member_address']").val();
	            let phone = form.find("input[name='member_phone']").val();
	            let birth = form.find("input[name='member_birth']").val();
	            let gender = form.find("input[name='inlineRadioOptions']:checked").val();
	            let id = form.find("input[name='member_id']").val();
	            let duplicateIdCheck = false;
	            let pwd = form.find("input[name='member_pwd']").val();
	            let pwdCheck = form.find("input[name='member_pwd_check']").val();
	            let selectedOptions = [];
	            $("input[name='interest']:checked").each(function () {
	                selectedOptions.push($(this).val());
	            });
	            
	            console.log(name);
	            console.log(nickname);
	            console.log(email);
	            console.log(address);
	            console.log(phone);
	            console.log(birth);
	            console.log(gender);
	            console.log(id);
	            console.log(pwd);
	            console.log("선택된 관심사:", selectedOptions);
	            
	            const sendData = new FormData(form.get(0));

	            sendData.forEach((value, key) => {
	                console.log(key, value);
	            });
	            
	            let personalAgree = document.getElementById('aggrement');
	            console.log(personalAgree.checked);
	            
	            if (personalAgree.checked == false) { // ✅ 체크 여부 확인
	                event.preventDefault();
	                event.stopPropagation();
	                console.log('실패');
	                alert('개인정보 수집 및 이용에 동의해주세요.');
	                personalAgree.classList.add("is-invalid");
	            } else {
	                $.ajax({
			            url: "/memberCreate",
			            type : 'post',
						// 파일데이터를 보내기 위해 추가해야하는 속성들
						// enctype이랑 cache, async, contentType, processData은 짝꿍이다.
						enctype : 'multipart/form-data',
						cache : false,
						async : false,
						contentType : false,
						processData : false,
						data : sendData,
			            dataType: 'JSON',
			            success: function (data) {
			            	alert(data.res_msg);
			            	if(data.res_code == '200') {
		            			location.href = "/memberLoginPass";
		            		} else {
		            			event.preventDefault();
		    		            event.stopPropagation();
		            		}
			            }
			        });
	            }


           });
  	});
	</script>
	
</body>
</html>