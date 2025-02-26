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
		<button type="button" class="btn btn-secondary">수정</button>
		<button type="button" class="btn btn-light">삭제</button>
	</c:if>
	</div>
	<br>
</div>
</body>
</html>