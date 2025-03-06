<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 영화 관람 기록</title>
</head>
<body>
	<%@ include file="/views/include/myMenuNav.jsp" %>
	<div class="container-sm">
		<br>
		<p class="text-center fs-1">영화 관람 기록</p>
		<br>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
				기록하기
			</button>
		</div>
		<!-- 모달 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">기록 추가</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <label for="memberBirth">관람일</label>
	              <input type="date" class="form-control" name="member_birth" id="memberBirth" value="yyyy-MM-dd"
   					 min="1920-01-01">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">저장</button>
		      </div>
		    </div>
		  </div>
		</div>

		<hr class="my-2" id="hr">
		
		<div class="container-sm" style="display : flex; justify-content: space-between;">
			<form style="display : inline;" action="#" name="select_genre" method="get">
    		<select name="is_answer" onchange="this.form.submit()">
        		<option value="0">전체</option>
				<c:forEach var="genre" items="${genres}">
        			<option value="${genre.id}">${genre.name}</option>
    			</c:forEach>	
    		</select>
		</form>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<form action="#" name="search_myMovielog_form" method="get">
				<%-- <input type="hidden" name="qna_type" value="${paging.qnaType}"> --%>
				<%-- <input type="hidden" name="is_answer" value="${isAnswer}"> --%>
				<input type="text" name="movie_title" placeholder="영화를 입력해주세요."
				value="${paging.title}">
				<input type="submit" value="검색">
			</form>	
		</div>
		</div>
		<br>
			<c:if test="${not empty qnaList}">
		<table class="table">
			<tbody>
				<c:forEach var="qna" items="${qnaList}" varStatus="vs">
					<tr onclick="" style="cursor: pointer;">
						<td>${qna.qnaTypeStr}</td>
						<td>${qna.title}</td>
						<fmt:parseDate value="${qna.regDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="strRedDate" />
						<td>
							<fmt:formatDate value="${strRedDate}" pattern="yy-MM-dd HH:mm" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${empty qnaList}">
		<table class="table">
			<tbody>
				<tr>
					<td colspan="4" class="text-center">기록이 없습니다. 새로 기록해보세요!</td>
				</tr>
			</tbody>
		</table>
	</c:if>
	</div>
	<script>
  		const today = new Date().toISOString().split('T')[0];
  		document.getElementById("memberBirth").setAttribute("max", today);
	</script>
</body>
</html>
