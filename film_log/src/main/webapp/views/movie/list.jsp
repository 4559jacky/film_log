<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.filmlog.movie.model.vo.MovieDTO, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>영화 목록</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/resources/css/include/paging.css" rel="stylesheet" type="text/css">
    <style>
        .table-dark { background-color: #f8f9fa !important; color: #000 !important; }
        .select_btn { background-color: #e9ecef !important; color: #000 !important; border-color: #ced4da !important; }
        .insert_btn { background-color: #e9ecef !important; color: #000 !important; border-color: #ced4da !important; }
    </style>
</head>
<body>
	<c:set var="movies" value="${resultList}"/>
	<%@ include file="/views/include/nav.jsp" %>
	<div class="container mt=5"><br><br>
		<h2 class="text-center">영화 목록</h2><br><br>
		<div class="d-flex justify-content-center my-3">
            <div class="input-group w-50">
				<select class="form-select" id="searchFilter" placeholder="영화제목을 입력해주세요">
					<option value="1">장르선택</option>
					<option value="2">모험</option>
					<option value="3">판타지</option>
					<option value="4">애니메이션</option>
					<option value="5">드라마</option>
					<option value="6">공포</option>
					<option value="7">액션</option>
					<option value="8">코미디</option>
					<option value="9">역사</option>
					<option value="10">서부</option>
					<option value="11">스릴러</option>
					<option value="12">범죄</option>
					<option value="13">다큐멘터리</option>
					<option value="14">SF</option>
					<option value="15">미스터리</option>
					<option value="16">음악</option>
					<option value="17">로멘스</option>
					<option value="18">가족</option>
					<option value="19">전쟁</option>
					<option value="20">TV영화</option>
				</select>
				<input type="text" class="form-control">
				<button id="selectBtn">검색</button><br>
			<hr class="my-2" id="hr"><br>
			
				<c:choose>
					<c:when test="${empty resultList}">
						<p>영화 목록이 없습니다.</p>
					</c:when>
					<c:otherwise>
					<div class="table-responsive mx-auto" style="max-width: 100%;">
						<table class="table table-hover text-center" style="width: 100%;">
						  <thead class="table-dark">
						    <tr>
						   	  <th scope="col" style="width : 10%;">번호</th>
						      <th scope="col" style="width : 20%;">영화 포스터</th>
						      <th scope="col" style="width : 30%;">영화 제목</th>
						      <th scope="col" style="width : 15%;">러닝타임</th>
						      <th scope="col" style="width : 35%;">개봉일</th>
						      <th scope="col" style="width : 25%;">평점</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:forEach var="movie" items="${resultList }" varStatus="status">
							    <tr onclick="location.href='/updateMoviePass?id=${movie.id}'">
							      <th scope="row">${status.index +1}</th>
							      <td>
						             <img src="https://image.tmdb.org/t/p/w500${movie.posterPath}" alt="포스터" width="100">
						          </td>
							      <td>${movie.title}</td>
								  <td>${movie.runtime }분</td>
						          <td>${movie.releaseDate}</td>
						          <td>
						          	 <fmt:formatNumber value="${movie.voteAverage}" type="number" pattern="0.0" />
						          </td>
							    </tr>
						    </c:forEach>
						  </tbody>
						</table>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<c:if test="${not empty paging}">
		<div class="center">
			<div class="pagination justify-content-center">
				<c:if test="${paging.prev}">
					<c:url var="testUrl" value="/movieList">
						<c:param name="nowPage" value="${paging.pageBarStart > 1 ? paging.pageBarStart-1 : 1}"/>
					</c:url>
					<a class="page-link" href="${testUrl} ">&laquo;</a>
				</c:if>
				<c:forEach var="i" begin="${paging.pageBarStart}" end="${paging.pageBarEnd}">
					<a class="page-link" href="/movieList?nowPage=${i}">
						${i}
					</a>
				</c:forEach>
				<c:if test="${paging.next}">
					<a class="page-link" href="/movieList?nowPage=${paging.pageBarEnd < paging.totalPage ? (paging.pageBarEnd + 1) : paging.totalPage}">&raquo;</a>
				</c:if>
			</div>
		</div>
	</c:if>
	<!-- <script>
		$('table.table-hover tbody tr').on('click',function(){
			const movieId = $(this).data('id');
			console.log(movieId);
			location.href='/reviewBoardDetail?review_board_no='+movieId;
		})	
	</script> -->
	<!-- <a href="/movieAPI">영화 API 추가하기</a>
	<a href="/movieCastAndCrewAPI">감독 및 배우 API 추가하기</a>
	<script>
		const filterType = document.getElementById('filter_type')
		filterType.onchange = function(){
			document.getElementById('searchMovie').submit();
		}
	</script> -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>