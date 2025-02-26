<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
</head>
<body>
	<div class="review_board_list">
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>게시일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty resultList }">
					<c:forEach var="r" items="${resultList }">
						<tr data-board-no="${r.reviewBoardNo }">
							<td>${r.reviewBoardNo }</td>
							<td>${r.reviewBoardTitle }</td>
							<td>${r.reviewBoardContent }</td>
							<td>${r.memberName }</td>
							<fmt:parseDate value="${r.regDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="strRegDate"/>
							<td>
								<fmt:formatDate value="${strRegDate }" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td>${r.views }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	</div>
	<c:if test="${not empty paging}">
		<div class="center">
			<div class="pagination">
				<c:if test="${paging.prev} ">
				</c:if>
			</div>
		</div>
	</c:if>
	<script>
		$('.review_board_list tbody tr').on('click',function(){
			const boardNo = $(this).data('board-no');
			location.href='/reviewBoardDetail?board_no='+boardNo;
		})	
	</script>
	<a href="/reviewBoardInsertPass">게시글 작성하기</a>
</body>
</html>