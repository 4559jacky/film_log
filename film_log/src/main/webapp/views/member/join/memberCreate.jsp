<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
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
	          <label for="memberEmail">이메일</label>
			  <div class="row">
		          <div class="col-md-6 mb-3">
		            <input type="email" class="form-control" name="member_email" id="memberEmail" placeholder="you@example.com" required>
		            <div class="invalid-feedback email-error">
		              	이메일을 형식에 맞게 입력해주세요. ex) hogildong123@gmail.com
		            </div>
		          </div>
		          <div class="col-md-6 mb-3">
					<input type="button" class="form-control" id="sendCode" value="인증번호 보내기">
				  </div>
		      </div>
		      <label for="emailCode">인증번호</label>
		      <div class="row">
		          <div class="col-md-6 mb-3">
		            <input type="text" class="form-control" name="email_code" id="emailCode" placeholder="인증번호" required>
		            <div class="invalid-feedback code-error">
		              	인증번호를 입력해주세요.
		            </div>
		          </div>
		          <div class="col-md-6 mb-3">
					<input type="button" class="form-control" id="checkCode" value="인증번호 확인">
				  </div>
		      </div>
		        <label for="membeAddress">주소</label><br>
				<div class="row">
		          <div class="col-md-6 mb-3">
		            <input type="text" class="form-control" name="postcode" id="sample6_postcode" placeholder="우편번호" readonly><br>
		            <div class="invalid-feedback">
		              우편번호를 입력해주세요. (숫자로만 입력가능)
		            </div>
		          </div>
		          <div class="col-md-6 mb-3">
					<input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				  </div>
				</div>
				<div class="row">
				  <div class="mb-3">
					<input type="text" class="form-control" name="address" id="sample6_address" placeholder="주소" readonly><br>
					<div class="invalid-feedback">
		              주소를 입력해주세요.
		            </div>
				  </div>
				  <div class="col-md-6 mb-3">
					<input type="text" class="form-control" name="detail_address" id="sample6_detailAddress" placeholder="상세주소"><br>
				  </div>
				  <div class="col-md-6 mb-3">
					<input type="text" class="form-control" name="extra_address" id="sample6_extraAddress" placeholder="참고항목" readonly>
				  </div>
		            <!-- <input type="text" class="form-control" name="member_address" id="membeAddress" placeholder="서울특별시 강남구" required> -->
		         </div>
	          

	          <div class="row">
	            <div class="col-md-6 mb-3">
	              <label for="memberPhone">전화번호</label>
	              <input type="text" class="form-control" name="member_phone" id="memberPhone" placeholder="ex) 010-1111-1111" value="" required>
	              <div class="invalid-feedback phone-error">
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
	              <input type="password" class="form-control" name="member_pwd" id="memberPwd" placeholder="비밀번호" required>
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
	          <button class="btn btn-primary btn-lg btn-block btn-next2" type="button">다음</button>
			<button class="btn btn-secondary btn-lg btn-block btn-prev2" type="button">이전</button>
			</div>
			<div id="join3" class="join3">
				<div class="row">
	            <div class="col-md-6 mb-3">
	              <label for="memberImg">프로필 이미지 추가</label>
	              <!-- <input type="text" class="form-control" name="member_id" id="memberId" placeholder="아이디" value="" required> -->
	              <svg id="" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-file-image" viewBox="0 0 16 16">
					  <path d="M8.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/>
					  <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2M3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v8l-2.083-2.083a.5.5 0 0 0-.76.063L8 11 5.835 9.7a.5.5 0 0 0-.611.076L3 12z"/>
					</svg>
					<div class="invalid-feedback id-error">
	                형식에 맞지않는 파일입니다.(png만 가능)
	              </div>
	            </div>
	            <div class="mb-3">
	              <input type="file" name="member_img" id="memberImg" accept=".png,.jpg,.jpeg"><br>
	            </div>
	          </div>
	          <button class="btn btn-primary btn-lg btn-block btn-next3" type="button">다음</button>
			<button class="btn btn-secondary btn-lg btn-block btn-prev3" type="button">이전</button>
			</div>
			<div id="join4" class="join4">
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
			    <button class="btn btn-secondary btn-lg btn-block btn-prev4" type="button">이전</button>
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
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		let emailCheck = false;
		// 주소 데이터 가져오기
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
		
      	$(document).ready(function(){
      		$('#sendCode').click(function(event){
	      		let form = $('.validation-form');
			    let email = form.find("input[name='member_email']").val();
	      		isValid = true;
	      		const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
	      		if (!email || !regEmail.test(email)) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#memberEmail").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#memberEmail").removeClass("is-invalid").addClass("is-valid");
		        }
	      		
	      		if(isValid) {
	      			$.ajax({
	      				url:'/emailVerification',
	      				type:'post',
	      				data:{email : email},
	      				dataType:'JSON',
	      				contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
	      				success : function(data) {
	      					alert(data.res_msg);
	      					if(data.res_code == '200') {
	      						$("#memberEmail").removeClass("is-invalid").addClass("is-valid");
	      					} else {
	      						$("#memberEmail").addClass("is-invalid");
	      						$('.email-error').text('이미 사용중인 이메일입니다.').show();
	      					}
	      				},
	      				error: function (error) {
	      			        console.log("오류 발생", error);
	      			    }
	      			})
	      		} else {
	      			alert('이메일 형식이 맞지않습니다.');
	      			event.preventDefault();
		            event.stopPropagation();
	      		}
	      	});
      		
      		$('#checkCode').click(function(event){
      			console.log('왜안찍혀 이거;;');
	      		let form = $('.validation-form');
	      		let email = form.find("input[name='member_email']").val();
			    let code = form.find("input[name='email_code']").val();
	      		isValid = true;
	      		let regex = /^\d{6}$/;
	      		if (!code || !regex.test(code)) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#emailCode").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#emailCode").removeClass("is-invalid").addClass("is-valid");
		            $("#emailCode").addClass("noValid");
		        }
	      		
	      		if(isValid) {
	      			$.ajax({
	      				url:'/emailCheck',
	      				type:'post',
	      				data:{
	      					email : email,
	      					code : code
	      					},
	      				dataType:'JSON',
	      				contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
	      				success : function(data) {
	      					alert(data.res_msg);
	      					if(data.res_code == '200') {
	      						emailCheck = true;
	      						$('#memberEmail').prop('readonly', true);
	      						$("#emailCode").prop('readonly', true);
	      						$("#memberEmail").removeClass("is-invalid").addClass("is-valid");
	      						$("#emailCode").removeClass("is-invalid").addClass("is-valid");
	      						$("#emailCode").removeClass("noValid");
	      					} else {
	      						$("#emailCode").addClass("is-invalid");
	      						$("#emailCode").addClass("noValid")
	      					}
	      				}
	      			})
	      		} else {
	      			alert('코드는 6자리입니다.');
	      			event.preventDefault();
		            event.stopPropagation();
		            $("#emailCode").addClass("is-invalid");
	      		}
	      	});
      		
      	})
	
		// 버튼을 활용하여 페이지 전환 기능
		$(document).ready(function () {
			// div 숨기기
			$("#join2, #join3, #join4").hide();
			
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
		    
			// 번호 중복 검사
		    $('#memberPhone').on('input', function () {
		        let phone = $(this).val();
		        let inputField = $(this);
		        
		     	// 번호가 형식에 맞지않는 경우
		        if (!/^\d{3}-\d{4}-\d{4}$/.test(phone)) {
		            inputField.addClass('is-invalid').removeClass('is-valid');
		            $('.phone-error').text('형식에 맞게 입력해주세요.').show();
		            return; // 중복 검사 실행 X
		        }

		        $.ajax({
		            url: "/duplicatePhoneCheck",
		            type: 'post',
		            data: { "member_phone": phone },
		            dataType: 'JSON',
		            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            success: function (data) {
		                if (data.res_code === '200') {
		                    inputField.addClass('is-valid').removeClass('is-invalid');
		                    $('.phone-error').hide();
		                } else {
		                    inputField.addClass('is-invalid').removeClass('is-valid');
		                    $('.phone-error').text('이미 사용중인 번호입니다.').show();
		                }
		            }
		        });
		    });

		    // "다음" 버튼 클릭 시 유효성 검사 및 페이지 이동
		    $(".btn-next1").click(function (event) {
		        let form = $('.validation-form');
		        let name = form.find("input[name='member_name']").val();
		        let nickname = form.find("input[name='member_nickname']").val();
		        let email = form.find("input[name='member_email']")[0]; // HTML input element 직접 가져옴 */
		        let code = form.find("input[name='email_code']")[0];
		        let postCode = form.find("input[name='postcode']").val();
		        let address = form.find("input[name='address']").val();
		        let detailAddress = form.find("input[name='detail_address']").val();
		        let extraAddress = form.find("input[name='extra_address']").val();
		        let phone = form.find("input[name='member_phone']").val();
		        let birth = form.find("input[name='member_birth']").val();
		        let gender = form.find("input[name='member_gender']").val();

		        let isNicknameValid = $("#memberNickname").hasClass("is-valid");
		        let isCodeValid = $("#emailCode").hasClass("noValid");
		        let isPhoneValid = $("#memberPhone").hasClass("is-valid");
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
		        
		        if (!isPhoneValid) {
		            event.preventDefault();
		            event.stopPropagation();
		            console.log('여기걸리나');
		            $("#memberphone").addClass("is-invalid");
		            isValid = false;
		        }
		        
		        if (isCodeValid) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#memberPhone").addClass("is-invalid");
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
		        
		        if (!code.checkValidity()) {
		            event.preventDefault();
		            event.stopPropagation();
		            console.log('여기걸리나');
		            $("#emailCode").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#emailCode").removeClass("is-invalid").addClass("is-valid");
		        }
		        
		        // 우편번호 숫자인지 확인
		        var regex = /^[0-9]*$/;
		        
		        if (!postCode || !regex.test(postCode)) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#sample6_postcode").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#sample6_postcode").removeClass("is-invalid").addClass("is-valid");
		        }

		        if (!address) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#sample6_address").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#sample6_address").removeClass("is-invalid").addClass("is-valid");
		        }
		        
		        
		        if (!phone || !/^\d{3}-\d{4}-\d{4}$/.test(phone)) {
		            event.preventDefault();
		            event.stopPropagation();
		            $("#memberPhone").addClass("is-invalid").text('형식에 맞게 입력해주세요.').show();;
		            isValid = false;
		        } else {
		            $("#memberPhone").removeClass("is-invalid").addClass("is-valid");
		        }
		        
		        // 생년월일 정규식표현
		        const dateRegex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);

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
		    
		    $(".btn-next3").click(function (event) { 
		        let form = $('.validation-form');
		        let memberImg = form.find("input[name='member_img']").val();

		        let isValid = true; // 전체 유효성 체크용 변수

		        if (!memberImg) {
					let confirmImg = confirm('프로필이미지를 설정하지않으면 기본이미지가 설정됩니다.\n회원가입 이후 수정 가능합니다.');
					if(confirmImg == true) {
						$("#join3").hide();
				        $("#join4").show();
					} else {
						event.preventDefault();
			            event.stopPropagation();
			            memberImg.focus();
					}
				} else if(memberImg) {
					const val = memberImg;
					const idx = val.lastIndexOf('.');
					const type = val.substring(idx+1, val.length);
					if(type == 'png') {
						$("#join3").hide();
				        $("#join4").show();
				        form.find("input[name='member_img']").removeClass("is-invalid").addClass("is-valid");
					} else {
						event.preventDefault();
			            event.stopPropagation();
						alert('png 파일만 선택할 수 있습니다.');
						form.find("input[name='member_img']").addClass("is-invalid").removeClass("is-valid");
						memberImg = '';
					}
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
		    
		    $(".btn-prev4").click(function () {
		        $("#join4").hide();
		        $("#join3").show();
		    });
		    
		 });
		
		//////////////////////////////////////////////////////////////

    	$(document).ready(function () {
		    $('#joinButton').click(async function(event) {
		        event.preventDefault(); // 기본 이벤트 중단
		
		        let form = $('.validation-form');
		        let name = form.find("input[name='member_name']").val();
		        let email = form.find("input[name='member_email']").val();
		        let pwd = form.find("input[name='member_pwd']").val();
		        let personalAgree = document.getElementById('aggrement');
		
		        // 개인정보 수집 동의 체크 확인
		        if (!personalAgree.checked) {
		            alert('개인정보 수집 및 이용에 동의해주세요.');
		            personalAgree.classList.add("is-invalid");
		            return;
		        }
		
		        // 이메일 인증 확인
		        if (emailCheck === false) {
		            alert('이메일 인증이 필요합니다.');
		            $("#emailCode").addClass("is-invalid");
		            return;
		        }
		
		        try {
		            // 암호화 먼저 진행
		            let encryptResponse = await $.ajax({
		                url: "/encryptPassword",
		                type: "post",
		                data: { "member_pwd": pwd },
		                dataType: "JSON",
		                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            });
		
		            console.log("암호화된 비밀번호:", encryptResponse.member_pwd);
		
		            let sendData = new FormData(form.get(0));
		            sendData.set("member_pwd", encryptResponse.member_pwd); // 암호화된 비밀번호 적용
		
		            let registerResponse = await $.ajax({
		                url: "/memberCreate",
		                type: "post",
		                enctype: "multipart/form-data",
		                cache: false,
		                async: false,
		                contentType: false,
		                processData: false,
		                data: sendData,
		                dataType: "JSON",
		            });
		
		            alert(registerResponse.res_msg);
		            if (registerResponse.res_code === '200') {
		                location.href = "/memberLoginPass";
		            }
		
		        } catch (error) {
		            console.error("오류 발생", error);
		            alert("회원가입 중 오류가 발생했습니다.");
		        }
		    });
		});
	</script>
	
</body>
</html>