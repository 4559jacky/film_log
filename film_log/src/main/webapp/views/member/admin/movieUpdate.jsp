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
    <title>영화 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/include/paging.css" rel="stylesheet" type="text/css">
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
		<h2 class="text-center">영화 수정</h2><br><br>
		<hr class="my-2" id="hr"><br><br>
		<div class="d-flex justify-content-between my-3 review_board_list">
		<form class="row g-3" name="update_form" method="post">
		  <div class="col-md-4">
		    <label for="inputState" class="form-label">장르</label>
		    <select id="inputState" class="form-select">
		      		<option selected>장르선택</option>
		      		<option value="1">모험</option>
					<option value="2">판타지</option>
					<option value="3">애니메이션</option>
					<option value="4">드라마</option>
					<option value="5">공포</option>
					<option value="6">액션</option>
					<option value="7">코미디</option>
					<option value="8">역사</option>
					<option value="9">서부</option>
					<option value="10">스릴러</option>
					<option value="11">범죄</option>
					<option value="12">다큐멘터리</option>
					<option value="13">SF</option>
					<option value="14">미스터리</option>
					<option value="15">음악</option>
					<option value="16">로멘스</option>
					<option value="17">가족</option>
					<option value="18">전쟁</option>
					<option value="19">TV영화</option>
		    </select>
		  </div>
		  <div class="col-md-6">
		  	 <label for="inputState" class="form-label">영화제목</label>
			 <input type="text" class="form-control" id="title" value="${movie.title }"placeholder="영화제목을 입력해주세요">
		  </div>
		  <div class="col-md-12">
			 <label for="director" class="form-label">감독</label>
			 <input type="text" class="form-control" id="director"  placeholder="감독 이름을 입력해주세요">
		  </div>
		  <div class="col-md-12">
		     <label for="actor" class="form-label">출연</label>
			 <textarea class="form-control" id="actor" rows="3"  placeholder="출연자 이름을 입력해주세요."></textarea>
		  </div>
		  <div class="col-12">
		    <div class="textBox">
				<label for="overview" class="form-label">소개</label>
				<textarea class="form-control" id="overview" rows="3" maxlength="5"  placeholder="텍스트를 입력해주세요."></textarea>
				<div class="textCount"><span>0</span>/5</div>				
			</div>
		  </div>
		  <div class="col-12">
		      <label for="runtime" class="form-label">러닝타임(분)</label>
			  <input type="number" class="form-control" id="runtime" >
		  </div>
		  <div class="col-md-6">
		     <label for="releaseDate" class="form-label">개봉일</label>
			 <input type="date" class="form-control" id="releaseDate" >
		  </div>
		  <div class="col-md-6">
		      <label for="voteAverage" class="form-label">평점</label>
			  <input type="number" step="0.1" min="0" max="10" class="form-control" id="voteAverage" >
		  </div>
		  
		  <div class="col-12 text-end">
		    <button type="submit" class="btn btn-primary" id="updateBtn">수정</button>
		  </div>
		</form>
	</div>
</div>

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
			})
		});
		// 수정버튼 클릭시 동작
		$('#updateBtn').click(function(){
			let form = document.update_form;
			if(!form.title.value || !form.director.value){
				alert("영화제목과 감독이름을 입력해주세요.");
				return;
			}
			if(form.posterPath.value){
				const val = form.posterPath.value;
				const idx = val.lastIndexOf('.');
				const type = val.substring(idx+1,val.length);
				if(type !='png'){
					alert('.png 파일만 선택할 수 있습니다.');
					form.posterPath.value='';
				}
			}
			// 
			let sendData = new FormData(form);
			$.ajax({
				url:'/reviewBoardUpdate',
				type:'post',
				enctype:'multipart/form-data',
				cache:false,
				contentType:false,
				processData:false,
				data:sendData, 
				dataType:'json',
				success:function(data){
					alert(data.res_msg);
					if(data.res_code==200){
						location.href="/movieList";
					}else {
				           alert("영화 수정에 실패했습니다.");
				       }
				}
			})	
			
		})
	})
	</script>			
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>