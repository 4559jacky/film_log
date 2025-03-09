<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>자유 게시판</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
	   .table-dark { background-color: #f8f9fa !important; color: #000 !important; }
	   .select_btn { background-color: #e9ecef !important; color: #000 !important; border-color: #ced4da !important; }
	   .insert_btn { background-color: #e9ecef !important; color: #000 !important; border-color: #ced4da !important; }
	</style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<c:set var="freeBoard" value="${freeBoardList}"/>
	<%@ include file="/views/include/nav.jsp" %>
    <div class="container mt-5">
        <h2 class="text-center">자유 게시판</h2><br><br>
        <hr class="my-2" id="hr"><br><br>
		<div class=""d-flex justify-content-between my-3 review_board_list"">
			<div class="input-group w-50">
				<select class="form-select" id="searchFilter">
					<option value="0">선택</option>
					<option value="1">제목</option>
					<option value="2">작성자</option>
				</select>
				<input type="text" class="form-control" placeholder="검색어를 입력해주세요.">
				<button class="select_btn">검색</button>
				<button class="insert_btn">게시글 작성</button>
				<script>
					$(document).ready(function(){
						$(".insert_btn").click(function(){
							var memberNo = "${member.memberNo}"
							if(memberNo){
								location.href="/freeBoardInsertPass";
							}else{
								if(confirm("로그인 후 작성 가능합니다. 로그인 하시겠습니까?")){
									location.href="/memberLoginPass";
								}
							}
						})
					})
				</script>
			</div>
		</div>
		<table class="table table-hover">
			<thead class="table-dark">
				<tr>
					<th>게시글번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty freeBoardList}">
						<c:forEach var="board" items="${freeBoardList }" varStatus="vs">
							<tr>
								<td>${board.freeBoardNo }</td>
								<td>${board.freeBoardTitle }</td>
								<td>${board.freeBoardContent }</td>
								<td>${board.memberNickname }</td>
								<td>${board.regDateStr }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan=6>게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>