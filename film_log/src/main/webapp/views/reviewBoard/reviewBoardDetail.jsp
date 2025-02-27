<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시글 상세 페이지</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	<div class="review_board_detail">
		<ul>
			<c:if test="${not empty ReviewBoard.imgNo}">
				<li>
					<img src="<%=request.getContextPath()%>/reviewFilePath?img_no=${ReviewBoard.imgNo}">
				</li> 
			</c:if> 
			<li>
				<table>
					<tr>
						<td>제목</td>
						<td>${ReviewBoard.reviewBoardTitle} </td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${ReviewBoard.reviewBoardContent} </td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${ReviewBoard.memberNickname} </td>
					</tr>
					<tr>
						<td>영화</td>
						<td>${ReviewBoard.movieTitle} </td>
					</tr>
					<tr>
						<td>작성일</td>
						<fmt:parseDate value="${ReviewBoard.regDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="strRegDate"/>
						<td><fmt:formatDate value="${strRegDate }" pattern="yyyy-MM-dd HH:mm"/> </td>
					</tr>
					<tr>
						<td>조회수</td>
						<td>${ReviewBoard.views} </td>
					</tr>
					
				</table>
			</li>
		</ul>
	</div>
	<div class="buttons">
		<a href="">수정</a>
		<a href="<c:url value='/reviewBoardDelete?review_board_no=${ReviewBoard.reviewBoardNo}'/>">삭제</a>			
	</div>
</body>
</html>