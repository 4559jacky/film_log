<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰</title>
<link href="/resources/css/include/allpage.css" rel="stylesheet" type="text/css">
<link href="/resources/css/my/myReview.css?after" rel="stylesheet" type="text/css">
<link href="/resources/css/include/paing.css?after" rel="stylesheet" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .table-dark { background-color: #f8f9fa !important; color: #000 !important; }
        .select_btn { background-color: #e9ecef !important; color: #000 !important; border-color: #ced4da !important; }
        .insert_btn { background-color: #e9ecef !important; color: #000 !important; border-color: #ced4da !important; }
    </style>
</head>
<body>
	<%@ include file="/views/include/myMenuNav.jsp" %>
	<br>
	<div class="container-sm">
	<p class="text-center fs-1">내가 작성한 리뷰</p>
	<br>
	<hr class="my-2" id="hr">
	</div>
	<br>
    <div class="container-sm" >
        <!-- <div style="display:flex; justify-content:between"> -->
        <div class="container-fulid d-flex justify-content-between">
        	<div class="container-fulid">
        		<div></div>
        	</div>
        	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	            <form name="search_board_form" action="/myReviewListPass" method="get" class="d-flex">
				    <div class="row g-2">
				        <div class="col-md-3">
				            <select class="form-select" id="searchFilter" name="search_filter">
				                <option value="0">선택</option>
				                <option value="1" ${paging.filter eq 'title'? 'selected':'' }>제목</option>
				                <option value="2" ${paging.filter eq 'movieName'? 'selected':'' }>영화 이름</option>
				            </select>
				        </div>
				        <div class="col-md-6">
				            <input type="text" id="selectWord" class="form-control" placeholder="검색어 입력" name="search_word"
				                   value="${paging.word == null? '' : paging.word}">
				        </div>
				        <div class="col-md-3">
				            <button class="btn select_btn w-100">검색</button>
				        </div>
				    </div>
				</form>
        	</div>
	    </div>
	    <br>
        <table class="table table-hover">
            <thead class="table-dark">
                <tr>
                    <th>게시글 번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>게시일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
				<c:when test="${not empty resultList }">
					<c:forEach var="r" items="${resultList }"  varStatus="vs">
						<tr data-board-no="${r.reviewBoardNo}">
							<td>${((paging.nowPage-1)*paging.numPerPage)+(vs.index+1)}</td>
							<td>${r.reviewBoardTitle }</td>
							<td>${r.memberNickname }</td>
							<fmt:parseDate value="${r.regDate }" pattern="yyyy-MM-dd'T'HH:mm" var="strRegDate"/>
							<td>
								<fmt:formatDate value="${strRegDate }" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td>${r.views }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
            </tbody>
        </table>
    </div>
    <c:if test="${not empty paging}">
		<div class="center">
			<div class="pagination justify-content-center">
				<c:if test="${paging.prev} ">
					<c:url var="testUrl" value="/myReviewListPass">
					<c:param name="nowPage" value="${paging.pageBarStart-1}"/>
					</c:url>
					<a class="page-link" href="${testUrl} ">&laquo;</a>
				</c:if>
				<c:forEach var="i" begin="${paging.pageBarStart}" end="${paging.pageBarEnd}">
					<a class="page-link" href="/myReviewListPass?nowPage=${i}">
						${i}
					</a>
				</c:forEach>
				<c:if test="${paging.next}">
					<a class="page-link" href="/myReviewListPass?nowPage=${(paging.pageBarEnd)+1}">&raquo;</a>
				</c:if>
			</div>
		</div>
	</c:if>
	<script>
		$('table.table-hover tbody tr').on('click',function(){
			const boardNo = $(this).data('board-no');
			console.log(boardNo);
			location.href='/reviewBoardDetail?review_board_no='+boardNo;
		})	
	</script>
</body>
</html>
