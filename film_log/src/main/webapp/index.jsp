<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<%-- <script src="<c:url value='/resources/js/jquery-3.7.1.js'/>"></script> --%>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/resources/css/include/allpage.css" rel="stylesheet" type="text/css">

</head>
<body id="body">
	<%@ include file="/views/include/nav.jsp" %>
	<input id="memberNo" type="hidden" value="${member.memberNo != null ? member.memberNo : 0}">
	<br>
	<br>
	<div class="container-sm">
		<div>
		    <p class="text-center fs-1"><strong>추천 영화</strong></p>
		    <hr class="my-2" id="hr" style="width: 20%; margin: 0 auto; height: 2px; background-color: black border-top: 2px solid white;">
		</div>
		<br>
		<br>
	</div>
	<div class="container-xxl">
        <div class="row row-cols-1 row-cols-md-5 g-5" id="cards-box">
			
        </div>
    </div>
    <br>
    <br>
	<div class="container-fulid" style="background-color : black; color : white;">
		<div>
		<br>
			<div>
		    	<p class="text-center fs-1"><strong>추천 리뷰</strong></p>
		    	<hr class="my-2" id="hr" style="width: 20%; margin: 0 auto; height: 2px; border-top: 2px solid white;">
			</div>
		</div>
		<br>
		<br>
		<div class="container-xxl">
        	<div class="row row-cols-1 row-cols-md-4 g-5" id="review-cards-box">
			
        	</div>
        	<br>
    	</div>
	</div>
	<script>
		$(function() {
			const memberNo = $('#memberNo').val();
			console.log(memberNo);
			$.ajax({
				url : "/indexMovieList",
				type : "post",
				data : {
					"member_no" : memberNo
				},
				dataType : "JSON",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
				success : function(data) {
					let movieCards = '';
					data.res_data.forEach(function(movie) {
					    movieCards += '<div class="col">';
					    movieCards += '  <div id="body" class="card" style="border: none;">';
					    movieCards += '    <img src="https://image.tmdb.org/t/p/w500' + movie.poster_path + '" class="card-img-top" alt="' + movie.title + '" width="230" height="340">';
					    movieCards += '    <div style="display: flex; margin-top: 10px;">';
					    movieCards += '      <div class="vr" style="margin-right: 5px"></div>';
					    movieCards += '      <div style="width: 95%">';
					    movieCards += '        <div style="display: flex; justify-content: space-between; width: 100%;">';
					    movieCards += '          <div class="text-truncate">' + movie.title + '</div>';
					    movieCards += '          <div style="display: flex;">';
					    movieCards += '            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20">';
					    movieCards += '              <path fill="gold" d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>';
					    movieCards += '            </svg>';
					    movieCards += '            <span>' + movie.voteAverage.toFixed(1) + '</span>';
					    movieCards += '          </div>';
					    movieCards += '        </div>';
					    movieCards += '        <div class="text-truncate">' + movie.actors + '</div>';
					    movieCards += '      </div>';
					    movieCards += '    </div>';
					    movieCards += '  </div>';
					    movieCards += '</div>';
					});

					$('#cards-box').html(movieCards);

					/* $('#cards-box').html(movieCards); */
				},
				error : function() {
					alert("에러");
				}
			});
		});
		$(function() {
			$.ajax({
				url : "/indexReviewList",
				type : "post",
				dataType : "JSON",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
				success : function(data) {
					let reviewCards = '';
					data.res_data.forEach(function(review) {
						reviewCards += '<div class="col" style="cursor: pointer;" onclick="location.href=\'/reviewBoardDetail?review_board_no=' + review.id + '\'">'; 
						reviewCards += '  <div class="card" style="border: none; background-color : black;">';
						reviewCards += '    <img src="<%=request.getContextPath()%>/reviewFilePath?img_no=' + review.imgNo +'" class="card-img-top" alt="' + review.title + '" width="230" height="340">';
						
						reviewCards += '    <div style="display: flex; margin-top: 10px;">';
						reviewCards += '      <div class="vr" style="margin-right: 5px"></div>';
						reviewCards += '      <div style="width: 95%">';
						reviewCards += '        <div style="display: flex; justify-content: space-between; width: 100%;">';
						reviewCards += '          <div class="text-truncate text-white">' + review.title + '</div>';
						reviewCards += '        </div>';
						reviewCards += '        <div class="text-truncate text-light">' + review.nickname + '</div>';
						reviewCards += '      </div>';
						reviewCards += '    </div>';
						reviewCards += '  </div>';
						reviewCards += '</div>';
					});

					$('#review-cards-box').html(reviewCards);

					/* $('#review-cards-box').html(movieCards); */
				},
				error : function() {
					alert("에러");
				}
			});
		})
	</script>
</body>
</html>
