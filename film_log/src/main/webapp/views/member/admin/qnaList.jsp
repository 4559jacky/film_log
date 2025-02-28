<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 목록 조회</title>
<link href="/resources/css/include/allpage.css" rel="stylesheet" type="text/css">
<link href="/resources/css/qna/showQna.css?after" rel="stylesheet" type="text/css">
<link href="/resources/css/include/paing.css?after" rel="stylesheet" type="text/css">
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
<div class="container-fulid d-flex justify-content-between">
<div class="container-fuild">
	<span>답변 상태 : </span>
	<form style="display : inline;" action="/qnaList" name="no_answer_qna_form" method="get">
<%-- 	<input type="hidden" name="qna_title" value="${paging.title}">
	<input type="hidden" name="qna_type" value="${paging.qnaType}"> --%>
    <select name="is_answer" onchange="this.form.submit()">
        <option value="0" ${isAnswer == 0 ? 'selected' : ''}>전체</option>
        <option value="1" ${isAnswer == 1 ? 'selected' : ''}>완료</option>
        <option value="2" ${isAnswer == 2 ? 'selected' : ''}>대기</option>
    </select>
	</form>
	<br>
	<br>
	<span>문의 종류 : </span>
	<form style="display : inline;" action="/qnaList" name="orderby_qna_form" method="get">
		<input type="hidden" name="is_answer" value="${isAnswer}">
		<input type="hidden" name="qna_title" value="${paging.title}">
		<input name="qna_type" id="AllQna" type="radio" value="0" ${qnaType == 0 ? 'checked' : ''} onchange="this.form.submit()">
		<label for="AllQna">전체</label>
		<input name="qna_type" id="movieQna" type="radio" value="1" ${qnaType == 1 ? 'checked' : ''} onchange="this.form.submit()">
		<label for="movieQna">영화 문의</label>
		<input name="qna_type" id="generalQna" type="radio" value="2" ${qnaType == 2 ? 'checked' : ''} onchange="this.form.submit()">
		<label for="generalQna">일반 문의</label>
	</form>
</div>
<!-- 검색 -->
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	<form action="/qnaList" name="search_board_form" method="get">
		<input type="hidden" name="qna_type" value="${paging.qnaType}">
		<input type="hidden" name="is_answer" value="${isAnswer}">
		<input type="text" name="qna_title" placeholder="제목을 입력해주세요."
		value="${paging.title}">
		<input type="submit" value="검색">
	</form>	
</div>
</div>
<br>
	<c:if test="${not empty qnaList}">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col" style="text-align: center;">답변 상태</th>
					<th scope="col">문의 종류</th>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="qna" items="${qnaList}" varStatus="vs">
					<tr onclick="window.location.href='/qna?qna_board_no=${qna.qnaBoardNo}'" style="cursor: pointer;">
						<th scope="row">
						 ${paging.totalData - (paging.numPerPage * (paging.nowPage - 1)) - vs.index}
						</th>
						<td align="center" style="vertical-align: middle;">
							<c:if test="${qna.qnaResponse.responseNo == 0}">
								<span class="badge bg-success">대기</span>
							</c:if>
							<c:if test="${qna.qnaResponse.responseNo != 0}">
								<span class="badge bg-secondary">완료</span>
							</c:if>
						</td>
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
					<td colspan="4" class="text-center">문의 내역이 없습니다.</td>
				</tr>
			</tbody>
		</table>
	</c:if>
<nav aria-label="Page navigation-sm">
  <ul class="pagination justify-content-center">
  	<c:if test="${not empty paging.title}">
  		<c:set var="titleParam" value="${'&qna_title='}${paging.title}"></c:set>
  	</c:if>
    <c:if test="${paging.prev}">
      <li>
        <a class="pagination-newer" href="/qnaList?nowPage=${paging.pageBarStart - 1}${'&qna_type='}${qnaType}${'&is_answer='}${isAnswer}${titleParam}" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
    </c:if>
    <c:forEach var="i" begin="${paging.pageBarStart}" end="${paging.pageBarEnd}">
      <li class="${i == paging.nowPage ? 'pagination-active' : ''}">
        <a href="/qnaList?nowPage=${i}${'&qna_type='}${qnaType}${'&is_answer='}${isAnswer}${titleParam}">${i}</a>
      </li>
    </c:forEach>
    <c:if test="${paging.next}">
      <li>
        <a class="pagination-older" href="/qnaList?nowPage=${paging.pageBarEnd + 1}${'&qna_type='}${qnaType}${'&is_answer='}${isAnswer}${titleParam}" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </c:if>
  </ul>
</nav>
</div>
</body>
</html>
