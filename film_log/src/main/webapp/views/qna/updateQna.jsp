<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 작성</title>
<link href="/resources/css/qna/writeQna.css" rel="stylesheet" type="text/css">
<link href="/resources/css/include/allpage.css" rel="stylesheet" type="text/css">
</head>
<body id="body">
<%@ include file="/views/include/nav.jsp" %>
<div class="container-sm">
<p class="text-center fs-1">1:1 문의 수정</p>
<br>
<hr class="my-2" id="hr">
<br>
</div>
	<form name="qnaForm" method="post">
	<div class="container">
		<div class="mb-3">
		<input type="hidden" name="qna_board_no" value="${qna.qnaBoardNo}">
		<input type="hidden" name="member_no" value="${member.memberNo}">
			<select class="form-select" name="qna_type" aria-label="Default select example">
    			<option value="0" ${qna.qnaType == 0 ? 'selected' : ''}>문의 종류</option>
    			<option value="1" ${qna.qnaType == 1 ? 'selected' : ''}>영화 문의</option>
    			<option value="2" ${qna.qnaType == 2 ? 'selected' : ''}>일반 문의</option>
			</select>
			<br>
  			<label for="exampleFormControlInput1" class="form-label">제목</label>
  			<input name="title" type="text" class="form-control" id="exampleFormControlInput1" value="${qna.title }">
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlTextarea1" class="form-label">내용</label>
  			<textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="15">${qna.title }</textarea>
		</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button type="button" class="btn btn-secondary" onclick="clickUpdateQna();">수정하기</button>
		</div>
	</div>
	</form>
	<script>
	const clickUpdateQna = function() {
		let form = document.qnaForm;
		    if (form.qna_type.value === "0") {
		        alert("문의 종류를 선택해주세요.");
		        form.qna_type.focus();
		    } else if (!form.exampleFormControlInput1.value.trim()) {
		        alert("제목을 입력해주세요.");
		        form.exampleFormControlInput1.focus();
		    } else if (!form.exampleFormControlTextarea1.value.trim()) {
		        alert("내용을 입력해주세요.");
		        form.exampleFormControlTextarea1.focus();
		    } else {
		    	$.ajax({
		    		url : "/updateQna",
			    	type : "post",
			    	data : {
			    		"member_no" : form.member_no.value,
			    		"qna_type" : form.qna_type.value,
			    		"title" : form.title.value,
			    		"content" : form.content.value,
			    		"qna_board_no" : form.qna_board_no.value
			    	},
			    	dataType : "JSON",
			    	contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			    	success : function(data) {
			    		alert(data.res_msg);
			    		if(data.res_code == "200") {
			    			location.href="/qna?qna_board_no="+data.qna_board_no;		    		
			    		}
			    	},
			    	error : function() {
			    		
			    	}
		    	})
		    }
		};
</script>
</body>
</html>