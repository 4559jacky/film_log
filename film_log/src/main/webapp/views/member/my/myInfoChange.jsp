<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/views/include/myMenuNav.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">개인정보 수정</h4>
        <form class="validation-form" novalidate>
        	<div id="memberInfo1" class="memberInfo1">
	          <div class="row">
	          	<input type="hidden" class="form-control" name="member_id" id="memberId" placeholder="아이디" value="${member.memberId}">
	            <div class="col-md-6 mb-3">
	              <label for="memberName">이름</label>
	              <input type="text" class="form-control" name="member_name" id="memberName" placeholder="" value="<c:out value="${member.memberName}"/>" required>
	              <div class="invalid-feedback">
	                이름을 입력해주세요. (2-10자 이내)
	              </div>
	            </div>
	            <div class="col-md-6 mb-3">
				    <label for="memberNickname">닉네임</label>
				    <input type="text" class="form-control" name="member_nickname" id="memberNickname" placeholder="특수기호 제외 8자 이내" value="<c:out value="${member.memberNickname}"/>" required>
				    <div class="invalid-feedback nickname-error">
				        중복된 닉네임 또는 형식에 맞지않는 닉네임입니다. (특수기호 제외 8자 이내)
				    </div>
				</div>
	          </div>
	
	          <div class="mb-3">
	            <label for="memberEmail">이메일</label>
	            <input type="email" class="form-control" name="member_email" id="memberEmail" placeholder="you@example.com" value="<c:out value="${member.memberEmail}"/>" required>
	            <div class="invalid-feedback">
	              이메일을 형식에 맞게 입력해주세요. ex) hogildong123@gmail.com
	            </div>
	          </div>
	          
	          <label for="membeAddress">주소</label><br>
				<div class="row">
		          <div class="col-md-6 mb-3">
		            <input type="text" class="form-control" name="postcode" id="sample6_postcode" placeholder="우편번호" value="<c:out value="${memberAddress.postcode}"/>" readonly><br>
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
					<input type="text" class="form-control" name="address" id="sample6_address" placeholder="주소" value="<c:out value="${memberAddress.address}"/>" readonly><br>
					<div class="invalid-feedback">
		              주소를 입력해주세요.
		            </div>
				  </div>
				  <div class="col-md-6 mb-3">
					<input type="text" class="form-control" name="detail_address" id="sample6_detailAddress" placeholder="상세주소" value="<c:out value="${memberAddress.detailAddress}"/>"><br>
				  </div>
				  <div class="col-md-6 mb-3">
					<input type="text" class="form-control" name="extra_address" id="sample6_extraAddress" placeholder="참고항목" value="<c:out value="${memberAddress.extraAddress}"/>" readonly>
				  </div>
		            <!-- <input type="text" class="form-control" name="member_address" id="membeAddress" placeholder="서울특별시 강남구" required> -->
		         </div>



	          <div class="row">
	            <div class="col-md-6 mb-3">
	              <label for="memberPhone">전화번호</label>
	              <input type="text" class="form-control" name="member_phone" id="memberPhone" placeholder="ex) 010-1111-1111" value="<c:out value="${member.memberPhone}"/>" required>
	              <div class="invalid-feedback phone-error">
	                전화번호를 형식에 맞게 입력해주세요.
	              </div>
	            </div>
	            <div class="col-md-6 mb-3">
	              <label for="memberBirth">생년월일</label>
	              <input type="date" class="form-control" name="member_birth" id="memberBirth" value="<c:out value="${member.memberBirth}"/>"
   					 min="1900-01-01" max="2025-03-12">
	              <!-- <input type="text" class="form-control" name="member_birth" id="memberBirth" placeholder="ex) 1998-12-07" value="" required> -->
	              <div class="invalid-feedback">
	                생년월일을 형식에 맞게 입력해주세요.
	              </div>
	            </div>
	          </div>
	          <div class="col-md-6 mb-3">
		          <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="member_gender" id="inlineRadio1" value="M" <c:if test="${member.memberGender == 'M'}">checked</c:if>>
					  <label class="form-check-label" for="inlineRadio1">남자</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="member_gender" id="inlineRadio2" value="F" <c:if test="${member.memberGender == 'F'}">checked</c:if>>
					  <label class="form-check-label" for="inlineRadio2">여자</label>
					</div>
					<div class="invalid-feedback">
		              성별을 선택해주세요.
		            </div>
				</div>
				<button class="btn btn-primary btn-lg btn-block btn-next1" type="button">다음</button>
			</div>
			<div id="memberInfo2" class="memberInfo2">
				<div class="row">
	            <div class="col-md-6 mb-3">
	              	<img src="<%=request.getContextPath()%>/memberImgUpdatePath?member_no=${member.getMemberNo() }" style="width:200px; height:200px; border: 2px solid black; border-radius: 50%; object-fit: cover;">
					<br><br>
					<label for="memberImg" style="font-size:20px;"><b>프로필 이미지 변경</b></label><br>
					<input type="file" name="member_img" id="memberImg" accept=".png,.jpg,.jpeg"><br><br>
					<div class="invalid-feedback file-error">
	                	형식에 맞지않는 파일입니다.(png만 가능)
	              	</div>
	              	<label style="font-size:20px;"><b>기본이미지로 변경 </b><input type="checkbox" name="default_img" id="defaultImg"></label><br>
	            </div>
	            <div class="mb-3">
	            </div>
	          </div>
	          <button class="btn btn-primary btn-lg btn-block btn-next2" type="button">다음</button>
			<button class="btn btn-secondary btn-lg btn-block btn-prev2" type="button">이전</button>
			</div>
			<div id="memberInfo3" class="memberInfo3">
			    <p>관심사 수정(필수선택 X)</p>
			    <c:set var="allGenres" value="10749,28,12,14,18,35,53,27,80,9648,16,10402,878,36,10752,37,99,10751" />

				<c:forEach var="genre" items="${fn:split(allGenres, ',')}" varStatus="vs">
				    <c:set var="checked" value="" />
				    <c:forEach var="userGenre" items="${genres}">
				        <c:if test="${userGenre == genre}">
				            <c:set var="checked" value="checked" />
				        </c:if>
				    </c:forEach>
				
				    <label>
				        <input type="checkbox" name="interest" value="${genre}" ${checked}>
				        <c:choose>
				            <c:when test="${genre == '10749'}"><b>로맨스</b></c:when>
				            <c:when test="${genre == '28'}"><b>액션</b></c:when>
				            <c:when test="${genre == '12'}"><b>어드벤처</b></c:when>
				            <c:when test="${genre == '14'}"><b>판타지</b></c:when>
				            <c:when test="${genre == '18'}"><b>드라마</b></c:when>
				            <c:when test="${genre == '35'}"><b>코미디</b></c:when>
				            <c:when test="${genre == '53'}"><b>스릴러</b></c:when>
				            <c:when test="${genre == '27'}"><b>공포</b></c:when>
				            <c:when test="${genre == '80'}"><b>범죄</b></c:when>
				            <c:when test="${genre == '9648'}"><b>미스터리</b></c:when>
				            <c:when test="${genre == '16'}"><b>애니메이션</b></c:when>
				            <c:when test="${genre == '10402'}"><b>뮤지컬</b></c:when>
				            <c:when test="${genre == '878'}"><b>SF</b></c:when>
				            <c:when test="${genre == '36'}"><b>역사</b></c:when>
				            <c:when test="${genre == '10752'}"><b>전쟁</b></c:when>
				            <c:when test="${genre == '37'}"><b>서부</b></c:when>
				            <c:when test="${genre == '99'}"><b>다큐</b></c:when>
				            <c:when test="${genre == '10751'}"><b>가족</b></c:when>
				        </c:choose>
				    </label>
				    <c:if test="${vs.count mod 4 == 0}">
				        	<br>
				    </c:if>
				</c:forEach>
				<br>
				<br>
			    <button class="btn btn-secondary btn-lg btn-block btn-prev3" type="button">이전</button>
			    <hr class="mb-4">
	            <div class="mb-4"></div>
	              <!-- <div class="custom-control custom-checkbox">
	                <input type="checkbox" class="custom-control-input" name="aggrement" id="aggrement" required>
	                <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
	              </div><br> -->
	            <button class="btn btn-primary btn-lg btn-block" type="button" id="updateButton">개인정보 수정하기</button>
				</div>
        </form>
      </div>
    </div>
    </div> 
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
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
	                document.getElementById("sample6_detailAddress").value = '';
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
		
 		// 버튼을 활용하여 div 전환 기능
		$(document).ready(function () {
			let memberId = "<c:out value='${member.memberId}'/>"
			console.log(memberId);
			// div 숨기기
			$("#memberInfo2, #memberInfo3").hide();
			
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
		            return;
		        }
	
		        $.ajax({
		            url: "/duplicateNickNameCheckForInfoChange",
		            type: 'post',
		            data: { 
		                "member_nickname": nickname,
		                "member_id": memberId
		            },
		            dataType: 'JSON',
		            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            success: function (data) {
		                if (data.res_code === '200') {
		                    inputField.addClass('is-valid').removeClass('is-invalid');
		                    $('.nickname-error').hide();
		                } else {
		                    inputField.addClass('is-invalid').removeClass('is-valid');
		                    $('.nickname-error').text(data.res_msg).show();
		                }
		            }
		        });
	    	});
	    
		 	// 닉네임 중복 검사 함수를 Promise 형태로 변경
		    function checkNickname(nickname, memberId) {
		        return new Promise((resolve, reject) => {
		            $.ajax({
		                url: "/duplicateNickNameCheckForInfoChange",
		                type: 'post',
		                data: { 
		                    "member_nickname": nickname,
		                    "member_id": memberId
		                },
		                dataType: 'JSON',
		                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		                success: function (data) {
		                    if (data.res_code === '200') {
		                        $("input[name='member_nickname']").addClass('is-valid').removeClass('is-invalid');
		                        $('.nickname-error').hide();
		                        resolve(true); // 닉네임 사용 가능
		                    } else {
		                        $("input[name='member_nickname']").addClass('is-invalid').removeClass('is-valid');
		                        $('.nickname-error').text(data.res_msg).show();
		                        resolve(false); // 닉네임 중복됨
		                    }
		                },
		                error: function () {
		                    reject(false);
		                }
		            });
		        });
		    }
		 	
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
		            url: "/duplicatePhoneCheckForInfoChange",
		            type: 'post',
		            data: { 
		                "member_phone": phone,
		                "member_id": memberId
		            },
		            dataType: 'JSON',
		            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            success: function (data) {
		                if (data.res_code === '200') {
		                    inputField.addClass('is-valid').removeClass('is-invalid');
		                    $('.phone-error').hide();
		                } else {
		                    inputField.addClass('is-invalid').removeClass('is-valid');
		                    $('.phone-error').text(data.res_msg).show();
		                }
		            }
		        });
	    	});
		 	
		 	// 번호 중복 검사 함수를 Promise 형태로 변경
		    function checkPhone(phone, memberId) {
		        return new Promise((resolve, reject) => {
		            $.ajax({
		                url: "/duplicatePhoneCheckForInfoChange",
		                type: 'post',
		                data: { 
		                    "member_phone": phone,
		                    "member_id": memberId
		                },
		                dataType: 'JSON',
		                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		                success: function (data) {
		                    if (data.res_code === '200') {
		                        $("input[name='member_phone']").addClass('is-valid').removeClass('is-invalid');
		                        $('.nickname-error').hide();
		                        resolve(true); // 번호 사용가능
		                    } else {
		                        $("input[name='member_phone']").addClass('is-invalid').removeClass('is-valid');
		                        $('.nickname-error').text(data.res_msg).show();
		                        resolve(false); // 번호 중복됨
		                    }
		                },
		                error: function () {
		                    reject(false);
		                }
		            });
		        });
		    }

		 	// "다음" 버튼 클릭 이벤트 수정
		    $(".btn-next1").click(async function (event) {
		        event.preventDefault(); // 기본 이벤트 방지
	
		        let form = $('.validation-form');
		        let name = form.find("input[name='member_name']").val();
		        let nickname = form.find("input[name='member_nickname']").val();
		        let email = form.find("input[name='member_email']")[0]; 
		        let postCode = form.find("input[name='postcode']").val();
		        let address = form.find("input[name='address']").val();
		        let detailAddress = form.find("input[name='detail_address']").val();
		        let extraAddress = form.find("input[name='extra_address']").val();
		        let phone = form.find("input[name='member_phone']").val();
		        let birth = form.find("input[name='member_birth']").val();
		        let gender = form.find("input[name='member_gender']").val();
	
		        let isValid = true;
	
		        // 이름 유효성 검사
		        if (!name || name.length < 2 || name.length > 10) {
		            $("#memberName").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#memberName").removeClass("is-invalid").addClass("is-valid");
		        }
	
		        // 이메일 유효성 검사
		        if (!email.checkValidity()) {
		            $("#memberEmail").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#memberEmail").removeClass("is-invalid").addClass("is-valid");
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
	
		        // 전화번호 유효성 검사
		        if (!phone || !/^\d{3}-\d{4}-\d{4}$/.test(phone)) {
		            $("#memberPhone").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#memberPhone").removeClass("is-invalid").addClass("is-valid");
		        }
	
		        // 생년월일 유효성 검사
		        const dateRegex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
		        if (!birth || dateRegex.test(birth) == false) {
		            $("#memberBirth").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $("#memberBirth").removeClass("is-invalid").addClass("is-valid");
		        }
	
		        // 성별 유효성 검사
		        if (!gender) {
		            $(".form-check-input").addClass("is-invalid");
		            isValid = false;
		        } else {
		            $(".form-check-input").removeClass("is-invalid").addClass("is-valid");
		        }
	
		        console.log("isValid(닉네임 검사 전) : " + isValid);
	
		        // 닉네임 중복 검사 (AJAX 응답을 기다림)
		        let nicknameValid = await checkNickname(nickname, memberId);
		        if (!nicknameValid) {
		            isValid = false;
		        }
		        
		        console.log("isValid(닉네임 검사 후) : " + isValid);
		        
		        console.log("isValid(번호 검사 전) : " + isValid);
		        
		     	// 번호 중복 검사 (AJAX 응답을 기다림)
		        let phoneValid = await checkPhone(phone, memberId);
		        if (!phoneValid) {
		            isValid = false;
		        }
	
		        console.log("isValid(번호 검사 후) : " + isValid);
	
		        // 모든 유효성 검사가 통과되었을 때만 페이지 이동
		        if (isValid) {
		            $("#memberInfo1").hide();
		            $("#memberInfo2").show();
		        } else {
		            alert('정확하지 않은 정보가 있습니다.');
		        }
		    });
	    
		    /* 정규식 무시하고 다음으로 이동 */
		    /* $(".btn-next2").click(function () {
		        $("#join2").hide();
		        $("#join3").show();
		    }); */
		    $('#memberImg').change(function(){
		    	console.log('이미지 확인');
		    	if($('#defaultImg').is(":checked")) {
		    		$('#defaultImg').prop("checked", false);
		    	}
		    })
	    
		    ///////////////////////////////////////
		    $('#defaultImg').change(function(){
		    	console.log('체크박스 확인');
		    	if($('#defaultImg').is(":checked")){
		    		$('#memberImg').val('');
		    	}
		    })
		    
		    // 두번째 버튼(이미지)
		    $(".btn-next2").click(function (event) { 
		    	$("#memberInfo2").hide();
		        $("#memberInfo3").show();
		        /* let form = $('.validation-form');
		        let memberImg = form.find("input[name='member_img']").val();
	
		        let isValid = true; // 전체 유효성 체크용 변수
	
		        if (!memberImg) {
					let confirmImg = confirm('프로필이미지 수정을 패스하시겠습니까?');
					if(confirmImg == true) {
						$("#memberInfo2").hide();
				        $("#memberInfo3").show();
					} else {
						event.preventDefault();
			            event.stopPropagation();
			            memberImg.focus();
					}
				} else if(memberImg) {
					
				} */
		    });
		    
		    ///////////////////////////
		    
		    $(".btn-prev2").click(function () {
		        $("#memberInfo2").hide();
		        $("#memberInfo1").show();
		    });
		
		    $(".btn-prev3").click(function () {
		        $("#memberInfo3").hide();
		        $("#memberInfo2").show();
		    });
		});
	
	//////////////////////////////////////////////////////////////

	// 수정완료 버튼
	$(document).ready(function () {
        $('#updateButton').click(function(event) {
        	let form = $('.validation-form');
        	let memberImg = form.find("input[name='member_img']").val();
            let sendData = new FormData(form.get(0));
            
            let defaultImgChecked = $('#defaultImg').is(':checked') ? 'Y' : 'N';
            sendData.append('default_img', defaultImgChecked);
           
            sendData.forEach((value, key) => {
                console.log(key, value);
            });

           	if(memberImg) {
           		const val = memberImg;
   				const idx = val.lastIndexOf('.');
   				const type = val.substring(idx+1, val.length);
   				if(type == 'png') {
   					// form.submit();
   					console.log(val);
   					$.ajax({
   						url : '/memberInfoChange',
   						type : 'post',
   						// 파일데이터를 보내기 위해 추가해야하는 속성들
   						// enctype이랑 cache, async, contentType, processData은 짝꿍이다.
   						enctype : 'multipart/form-data',
   						cache : false,
   						async : false,
   						contentType : false,
   						processData : false,
   						data : sendData,
   						dataType : 'JSON',
   						success : function(data){
   							alert(data.res_msg);
   							if(data.res_code == 200) {
   								location.href="/dashBoard";
   							}
   						}
   					})
   				} else {
      					alert('이미지 파일만 선택할 수 있습니다.');
      					memberImg = '';
               	}
           	} else {
				$.ajax({
					url : '/memberInfoChange',
					type : 'post',
					// 파일데이터를 보내기 위해 추가해야하는 속성들
					// enctype이랑 cache, async, contentType, processData은 짝꿍이다.
					enctype : 'multipart/form-data',
					cache : false,
					async : false,
					contentType : false,
					processData : false,
					data : sendData,
					dataType : 'JSON',
					success : function(data){
						alert(data.res_msg);
						if(data.res_code == 200) {
							location.href="/dashBoard";
						}
					}
					
				})
           	}
       	})
		});
    </script>
</body>
</html>