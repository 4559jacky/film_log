<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<link href="/resources/css/include/allpage.css" rel="stylesheet" type="text/css">
<link href="/resources/css/qna/showQna.css?after" rel="stylesheet" type="text/css">
</head>
<body id="body">
<%@ include file="/views/include/nav.jsp" %>
<br>
<div class="container-sm">
<p class="text-center fs-1">1:1 문의 내역</p>
<br>
<hr class="my-2" id="hr">
<br>
</div>
<div id="qna_over_div" class="container-sm">
	<br>
	<input id="qna_board_no" type="hidden" value="${qna.qnaBoardNo}">
	<div class="container-sm">
		<p class="fs-6">${qnaType }</p>
	</div>
	<br>
	<div id="qna_title" class="container-sm">
		<p class="fs-2">${qna.title }</p>
	</div>
	<br>
	<br>
	<div id="qna_content" class="container-sm">
		<p class="fs-5">${qna.content }</p>
	</div>
	<br>
	<br>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<c:if test="${qna.memberNo == member.memberNo}">
		<button type="button" class="btn btn-secondary" onclick="location.href='/updateQnaPass?qna_board_no=${qna.qnaBoardNo}'">수정</button>
		<button type="button" class="btn btn-light" onclick="deleteQna(${qna.qnaBoardNo});">삭제</button>
	</c:if>
	<c:if test="${member.adminWhether == 'T' and qnaResponse.responseNo == 0}">
		<button id="createButton" type="button" class="btn btn-secondary" onclick="createResponseDiv();">답변 달기</button>
	</c:if>
	</div>
	<br>
</div>
<br>
<div id="create_response_div" class="container-sm" style="display: none;">
	<br>
	<div class="container-sm">
		<p class="fs-6">답변</p>
		<hr class="my-2" id="hr">
	</div>
	<br>
	<div id="qna_content" class="container-sm">
		<textarea id="response_content" rows="10"></textarea>
	</div>
	<br>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<button type="button" class="btn btn-light" onclick="cancleCreateResponse();">취소</button>
		<button type="button" class="btn btn-secondary" onclick="createResponse();">등록</button>
	</div>
	<br>
</div>

<c:if test="${qnaResponse.responseNo != 0}">
<div id="qna_over_div" class="container-sm">
	<br>
	<div class="container-sm">
		<p class="fs-6">답변</p>
		<br>
		<hr class="my-2" id="hr">
	</div>
	<br>
<div id="qna_content" class="container-sm">
    	<p id="responseText" class="fs-5">${qnaResponse.responseContent}</p>
    	<textarea id="responseInput" rows="10" style="display: none;">${qnaResponse.responseContent}</textarea>
	</div>
	<br>
	<br>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<c:if test="${member.adminWhether == 'T'}">
		<input id="responseNo" type="hidden" value="${qnaResponse.responseNo}">
		<button type="button" class="btn btn-secondary" onclick="showEditMode();">수정</button>
		<button type="button" class="btn btn-light" id="cancleUpdateButton" style="display: none;" onclick="cancleUpdateResponse();">취소</button>
		<button type="button" class="btn btn-secondary" id="saveButton" style="display: none;" onclick="updateResponse();">수정 완료</button>
		<button type="button" class="btn btn-light" onclick="deleteResponse();">삭제</button>
	</c:if>
	</div>
	<br>
</div>
<br>
</c:if>
<script>
	const cancleCreateResponse = function() {
		document.getElementById("createButton").style.display = "block";
		document.getElementById("create_response_div").style.display = "none";
	}
	const createResponse = function() {
		let qnaBoardNo = document.getElementById("qna_board_no").value;
		let responseContent = document.getElementById("response_content").value.trim();
		
		if (responseContent === "") {
	        alert("내용을 입력해주세요");
	    } else {
	    	$.ajax({
			url:"/insertResponse",
			type : "post",
			dataType : "JSON",
			data : {
				"qna_board_no" : qnaBoardNo,
				"response_content" : responseContent
			},
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				alert(data.res_msg);
				if(data.res_code == "200") {
					location.reload();
				}
			}
		})
	   }
	}
	const createResponseDiv = function() {
		document.getElementById("createButton").style.display = "none";
		document.getElementById("create_response_div").style.display = "block";
	}
	const deleteResponse = function() {
		let responseNo = document.getElementById("responseNo").value;
		if(confirm("정말 삭제하시겠습니까?")) {
			$.ajax({
				url:"/deleteResponse",
				type : "post",
				dataType : "JSON",
				data : {
					"response_no" : responseNo
				},
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
					alert(data.res_msg);
					if(data.res_code == "200") {
						location.reload();
					}
				}
			})
		}
	}
	const showEditMode = function() {
	    document.getElementById("responseText").style.display = "none";
	    document.getElementById("responseInput").style.display = "block";
	    document.querySelector("button[onclick='showEditMode();']").style.display = "none";
	    document.querySelector("button[onclick='deleteResponse();']").style.display = "none";
	    document.getElementById("saveButton").style.display = "inline-block";
	    document.getElementById("cancleUpdateButton").style.display = "inline-block";
	}
	const cancleUpdateResponse = function() {
		document.getElementById("responseText").style.display = "block";
	    document.getElementById("responseInput").style.display = "none";
	    document.querySelector("button[onclick='showEditMode();']").style.display = "block";
	    document.querySelector("button[onclick='deleteResponse();']").style.display = "block";
	    document.getElementById("saveButton").style.display = "none";
	    document.getElementById("cancleUpdateButton").style.display = "none";
	}
 	const updateResponse = function() {
 		let responseNo = document.getElementById("responseNo").value;
		let responseInput = document.getElementById("responseInput").value.trim();

	     if (responseInput === "") {
	        alert("내용을 입력해주세요");
	    } else {
	    	$.ajax({
				url:"/updateResponse",
				type : "post",
				dataType : "JSON",
				data : {
					"response_no" : responseNo,
					"response_content" : responseInput
				},
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
					alert(data.res_msg);
					if(data.res_code == "200") {
						location.reload();
					}
				}
			})
	    }
	}
	const deleteQna = function(qnaBoardNo) {
		if(confirm("정말 삭제하시겠습니까?")) {
			$.ajax({
				url:"/deleteQna",
				type : "post",
				dataType : "JSON",
				data : {
					"qna_board_no" : qnaBoardNo
				},
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
					alert(data.res_msg);
					if(data.res_code == "200") {
						location.href="/";
						// 나중에 마이페이지 내 문의 내역 보기로 이동
					}
				}
			})
		}
	}
</script>
</body>
</html>