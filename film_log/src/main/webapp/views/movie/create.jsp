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
<title>Insert Movie</title>
</head>
<body>
	<c:set var="insertMovie" value="${movie }"/>
	<form action="<c:url value='/movieCreate'/>"method="post">
		<input type="hidden" name="movie_id"/>
		<textarea name="movie_overview"><c:out value="${movie.overview }"/></textarea>
		<input type="submit" value="추가">
	</form>
	
	
</body>
</html>