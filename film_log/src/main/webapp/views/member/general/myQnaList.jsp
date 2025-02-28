<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의 내역</title>
<link href="/resources/css/include/allpage.css" rel="stylesheet" type="text/css">
<link href="/resources/css/qna/showQna.css?after" rel="stylesheet" type="text/css">
<link href="/resources/css/include/paing.css?after" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
<br>
<div class="container-sm">
<p class="text-center fs-1">내 문의 내역</p>
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
						<th scope="row">
						 ${paging.totalData - (paging.numPerPage * (paging.nowPage - 1)) - vs.index}
				<%-- 		${qnaList.size() - vs.index} --%>
						</th>
						<td align="center" style="vertical-align: middle;">
							<c:if test="${qna.qnaResponse.responseNo == 0}">
								<span class="badge bg-secondary">대기</span>
							</c:if>
							<c:if test="${qna.qnaResponse.responseNo != 0}">
								<span class="badge bg-success">완료</span>
							</c:if>
						</td>
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
    <!-- 이전 버튼 -->
    <c:if test="${paging.prev}">
      <li>
        <a class="pagination-newer" href="/myQnaList?nowPage=${paging.pageBarStart - 1}" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
    </c:if>

    <!-- 페이지 번호 -->
    <c:forEach var="i" begin="${paging.pageBarStart}" end="${paging.pageBarEnd}">
      <li class="${i == paging.nowPage ? 'pagination-active' : ''}">
        <a href="/myQnaList?nowPage=${i}">${i}</a>
      </li>
    </c:forEach>

    <!-- 다음 버튼 -->
    <c:if test="${paging.next}">
      <li>
        <a class="pagination-older" href="/myQnaList?nowPage=${paging.pageBarEnd + 1}" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </c:if>
  </ul>
</nav>
</div>
<script>
</script>
</body>
</html>
