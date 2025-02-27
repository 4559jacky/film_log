<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 목록 조회</title>
<link href="/resources/css/include/allpage.css" rel="stylesheet" type="text/css">
<link href="/resources/css/qna/showQna.css?after" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
<br>
<div class="container-sm">
<p class="text-center fs-1">1:1 문의 목록 조회</p>
<br>
<hr class="my-2" id="hr">
</div>
<br>
<div class="container-sm">
	<c:if test="${not empty qnaList}">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col" style="text-align: center;">답변 상태</th>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="qna" items="${qnaList}" varStatus="vs">
					<tr onclick="window.location.href='/qna?qna_board_no=${qna.qnaBoardNo}'" style="cursor: pointer;">
						<th scope="row">${vs.index + 1}</th>
						
						<td align="center" style="vertical-align: middle;">
							<c:if test="${qna.qnaResponse.responseNo == 0}">
								<span class="badge bg-success">New</span>
							</c:if>
							<c:if test="${qna.qnaResponse.responseNo != 0}">
								<span class="badge bg-secondary">Done</span>
							</c:if>
						</td>
						<td>${qna.title}</td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

	<c:if test="${empty qnaList}">
		<table class="table">
			<tbody>
				<tr>
					<td colspan="4" class="text-center">게시물이 없습니다.</td>
				</tr>
			</tbody>
		</table>
	</c:if>

</div>

<script>
</script>
</body>
</html>
