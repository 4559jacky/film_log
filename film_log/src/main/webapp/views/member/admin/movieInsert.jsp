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
    <title>리뷰 게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table-dark { background-color: #f8f9fa !important; color: #000 !important; }
        .select_btn { background-color: #e9ecef !important; color: #000 !important; border-color: #ced4da !important; }
        .insert_btn { background-color: #e9ecef !important; color: #000 !important; border-color: #ced4da !important; }
    </style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>	
	<%@ include file="/views/include/nav.jsp" %>
	<div class="container mt=5"><br><br>
		<h2 class="text-center">영화 추가</h2><br><br>
		<hr class="my-2" id="hr"><br><br>
		<div class="d-flex justify-content-between my-3 review_board_list">
            <div class="input-group w-50">
				<select class="form-select" id="searchFilter">
					<option value="1">장르선택</option>
					<option value="2"></option>
					<option value="3"></option>
				</select> 
				<input type="text" class="form-control">
				
				<lable for="director">감독</lable>
				<input type="text" id="director">
				<lable>소개</lable>
				<textarea></textarea><br>
				<lable>출연</lable>
				<textarea></textarea><br>
				<lable>러닝타임</lable>
				<input type="text" id="runtime"><br>
				<lable>개봉일</lable>
				<input type="text" id="releaseDate">
				<lable>포스터</lable>
				<input type="text" id="posterPath"><br>
				
				<input type="button" value="영화 추가">
				<script>
					$(document).ready(function(){
						
					})
				</script>
			</div>
		</div>
	</div>
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>