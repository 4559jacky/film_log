<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<link href="/resources/css/include/allpage.css" rel="stylesheet" type="text/css">
<link href="/resources/css/qna/showQna.css" rel="stylesheet" type="text/css">
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
	</div>
	<br>
</div>
<script>
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