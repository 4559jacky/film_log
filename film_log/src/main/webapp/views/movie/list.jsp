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
<title>영화 목록</title>

</head>
<body>
	<c:set var="movies" value="${movies}"/>
	<form action="<c:url value='/movie'/>" id="searchMovie">
		<fieldset>
			<legend>필터</legend>
			<select name="filter_type" id="filter_type">
				<option value="1">선택</option>
				<option value="2">액션</option>
				<option value="3">로맨스</option>
			</select>
		</fieldset>
		<fieldset>
			<legend>검색하기</legend>
				<input type="text" name="movie_title" placeholder="영화제목을 입력해주세요">
				<input type="submit" value="검색">
		</fieldset>
	</form>
	<a href="/movieAPI">영화 API 추가하기</a>
	<a href="/movieCastAndCrewAPI">감독 및 배우 API 추가하기</a>
	<script>
		const filterType = document.getElementById('filter_type')
		filterType.onchange = function(){
			document.getElementById('searchMovie').submit();
		}
	</script>
	<c:choose>
		<c:when test="${empty movies}">
			<p>영화 목록이 없습니다.</p>
		</c:when>
		<c:otherwise>
			<c:forEach var="movie" items="${movies}">
            <tr>
            	<td>${movie.id }</td>
                <td>${movie.title}</td>
                <td>${movie.overview}</td>
                <td>${movie.releaseDate}</td>
                <td>${movie.voteCount }</td>
                <td>${movie.voteAverage }</td>
                <td>${movie.posterPath }</td>
            </tr>
        </c:forEach>
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>