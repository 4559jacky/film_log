<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.filmlog.movie.model.vo.MovieDTO, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>영화 상세</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0; /* 회색 바탕 */
        }
        .content-box, .comment-box {
            background-color: #fff; /* 하얀 박스 */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: #d3d3d3; /* 회색 버튼 */
            color: #000;
            border: none;
        }
        .btn-custom:hover {
            background-color: #c0c0c0;
        }
        .comment-item {
            border-bottom: 1px solid #e9ecef;
            padding: 10px 0;
        }
        .comment-item:last-child {
            border-bottom: none;
        }
        #commentList {
   			 min-height: 20px; /* 최소 높이 보장 */
		}
    </style>
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<!-- 첫 번째 박스: 영화 상세 -->
        <%@ include file="/views/include/nav.jsp" %>
	<!-- 첫 번째 박스: 영화 상세 -->
        <div class="content-box mx-auto p-4" style="max-width: 1400px;">
            <h3 class="mb-3 text-center">영화 상세</h3>
            <hr>
            <div class="d-flex justify-content-between mb-3">
                <div>
                	<!-- 영화 포스터 -->
                	<div class="post">
                		<img src="https://image.tmdb.org/t/p/w500${movie.posterPath}" alt="포스터" width="200">
                	</div>
                	<p><b>장르</b>: ${genre.name }</p>
                	<p><b>영화제목</b>: ${movie.title }</p>
                	<p><b>감독</b>: ${director.name }</p>
                	<p><b>출연</b>: ${actor.name }</p>
					<p><b>소개</b>: ${movie.overview }</p>
					<p><b>러닝타임(분)</b>: ${movie.runtime }</p>
					<p><b>개봉일</b>: ${movie.releaseDate }</p>
					<p><b>평점</b>: <fmt:formatNumber value="${movie.voteAverage}" type="number" pattern="0.0" /></p>
					
                </div>
            </div>
            <hr>
        </div>

		  <%-- <form>
			  <div class="col-md-6">
			  	 <label for="genre" class="form-label">장르</label>
				 <input type="text" class="form-control" id="genre" value="${genre.name }">
			  </div> 		
			  <div class="col-md-12">
			     <label for="actors" class="form-label">출연</label>
			     <textarea class="form-control" id="actors" rows="3" placeholder="출연자 이름을 입력해주세요.">
			     <c:forEach var="actor" items="${actors}" varStatus="status">
			        ${actor.name}<c:if test="${!status.last}">, </c:if>
			     </c:forEach>
			     </textarea>
			  </div>
		</form> --%>
	<script>
		// 소개 글자수 설정
		$('#overview').keyup(function(){
			var content = $(this).val();
			// 글자수 세기
			if(content.length == 0 || content == ''){
				$('.textCount').text('0자');
			}else{
				$('.textCount').text(content.length+'자');
			}
			// 글자수 제한
			if(content.length > 5){
				$(this).val($(this).val().substring(0,5));
				alert('글자수는 5자까지 입력 가능합니다.')
			}
		});
	</script>			
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>