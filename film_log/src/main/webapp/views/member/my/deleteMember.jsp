<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/views/include/myMenuNav.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
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
	            <div class="mb-3">
	              <label><b style="font-size:20px; color : crimson;">※주의사항※</b></label><br>
	              <label>회원탈퇴시 작성한 리뷰 및 게시글과 영화기록, 좋아요 등 회원님의 데이터가 모두 삭제됩니다.</label>
	              <p>그래도 탈퇴하시겠습니까?</p>
	            </div>
	          </div>
			</div>
		    <hr class="mb-4">
            <div class="mb-4">
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="aggrement" id="aggrement" required>
                <label class="custom-control-label" for="aggrement">주의사항을 확인하였습니다.</label>
                <div class="invalid-feedback nickname-error">
					주의사항을 확인해주세요.
				</div>
              </div><br>
            <button class="btn btn-primary btn-lg btn-block" type="button" id="delete_btn">회원탈퇴</button>
			</div>
        </form>
      </div>
    </div>
    </div> 
    
	<script type="text/javascript">
		$(document).ready(function () {
			let memberId = "<c:out value='${member.memberId}'/>"
			console.log(memberId);
			
	        $('#delete_btn').click(function(event) {
	        	let form = $('.validation-form');
	            
	            let personalAgree = document.getElementById('aggrement');
	            console.log(personalAgree.checked);
	            
	            if (personalAgree.checked == false) { // ✅ 체크 여부 확인
	                event.preventDefault();
	                event.stopPropagation();
	                alert('주의사항을 읽고 동의해주세요.');
	                personalAgree.classList.add("is-invalid");
	            } else {
	            	let checkAgree = confirm('정말 회원탈퇴를 하시겠습니까?');
		            if(checkAgree == false) {
		            	event.preventDefault();
		                event.stopPropagation();
		            } else {
		            	$.ajax({
							url : '/memberDelete',
							type : 'post',
							data : {member_id : memberId},
							dataType : 'JSON',
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data){
								alert(data.res_msg);
								if(data.res_code == 200) {
									location.href="/";
								}
							}
						})
		            }
	            }
	       	})
		});
    </script>
</body>
</html>