<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>

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
	    <p class="text-center fs-1">추천 영화</p>
	    <hr class="my-2" id="hr" style="width: 20%; margin: 0 auto; height: 2px; background-color: black;">
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
	<div class="container-fuild">
	<div style="background-color : black; color : white;">
		<div>
	    <p class="text-center fs-1">추천 리뷰</p>
	    <hr class="my-2" id="hr" style="width: 20%; margin: 0 auto; height: 2px; background-color: black;">
		</div>
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
					console.log("데이터 :", data.res_data);

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

					$('#cards-box').html(movieCards);
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
				data : {},
				dataType : "JSON",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
				success : function(data) {
					
				},
				error : function() {
					alert("에러");
				}
			});
		})
	</script>
</body>
</html>
