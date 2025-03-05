<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>리뷰 게시글 작성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body { background-color: #f0f0f0; }
        .review-box { background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-height: 1500px;}
        .btn-custom { background-color: #e9ecef; color: #000; border-color: #ced4da; }
        #search_movie {
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
   		 }

	    /* 검색 결과 리스트 스타일 */
	    #movie_list {
	        background-color: white;
	        border: 1px solid #ddd;
	        border-radius: 5px;
	        margin-top: 5px;
	        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	    }
	
	    /* 리스트 항목 스타일 */
	    #movie_list .list-group-item {
	        cursor: pointer;
	        padding: 8px 15px;
	        border: none;
	        border-bottom: 1px solid #eee;
	    }
	
	    /* 호버 효과 */
	    #movie_list .list-group-item:hover {
	        background-color: #f8f9fa;
	        color: #007bff;
	    }
	
	    /* 선택된 항목 강조 */
	    #movie_list .list-group-item.active {
	        background-color: #007bff;
	        color: white;
	    }
	    
		.position-relative {
		    min-height: 40px;
		}
		#movie_list {
		    top: 100%;
		    left: 0;
		}
		
    </style>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
    <div class="container mt-5">
        <h2 class="text-center">리뷰 게시글 작성</h2><br><br>
        <hr class="my-2" id="hr"><br><br>
        <div class="review-box mx-auto mt-4 p-4" style="max-width: 1400px;">
            <form action='reviewBoardInsert' name="insert_board_form" method="post"> 
            <div class="mb-3">
                <label class="form-label">제목</label>
                <div class="d-flex">
					<div class="position-relative" style="max-width: 300px;">
					    <input type="text" class="form-control" id="search_movie" placeholder="영화 선택" autocomplete="off">
					    <input type="hidden" name="movie_id" id="selected_movie_id"> <!-- 선택한 영화 ID 저장 -->
					    <ul class="list-group position-absolute w-100" id="movie_list" style="display: none; max-height: 200px; overflow-y: auto; z-index: 1000;"></ul>
					</div>
				
                    
                    <input type="text" class="form-control" placeholder="제목 입력" name="review_board_title">
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">내용</label>
                <textarea class="form-control" rows="6" placeholder="내용을 입력하세요" name="review_board_content" style="height: 500px;"></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">사진 추가</label>
                <div class="border p-3 text-center" style="border-radius: 5px;">
                    <input type="file" class="form-control" name="review_board_file" multiple>
                    <small class="text-muted">최대 5장 업로드 가능</small>
                </div>
            </div>
            <input type="hidden" name="review_board_writer" value="<c:out value="${member.memberNo}"/>">
            <div class="text-end">
            	<input type="button" class="btn btn-custom" value="게시글 등록" id="insertButton"
            	style="background-color: #e9ecef; color: #000; border-color: #ced4da;">
            </div>
            </form>
        </div>
    </div>
    <script>
		$(document).ready(function(){
			$('#search_movie').on('keyup',function(){
				const movieTitle = $(this).val().trim();
				
				if (movieTitle.length === 0) {
					$('#movie_list').hide().empty();
			        return;
			    }
				
				$.ajax({
					url:'/reviewBoardSelectMovieList',
					type: "post",
					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					data:{movieTitle : movieTitle},
					dataType:"json",
					success:function(data){
						$('#movie_list').empty();
							 if (!data.movieArray || data.movieArray.length === 0) {
						        $('#movie_list').append('<li class="list-group-item text-muted">검색 결과가 없습니다.</li>');
						    } else {
						    	let result = "";
						    	for(let i = 0 ; i < data.movieArray.length ; i++){
						    		result = '<li class="list-group-item" data-id='+data.movieArray[i].movieId+' data-title='+data.movieArray[i].movieTitle+'>'
						    				+data.movieArray[i].movieTitle+ '</li>'
							    	$('#movie_list').append(result);
						    	}
						    }
							$('#movie_list').show();
						
					}
				})	
			})
			
			$(document).on('click', '#movie_list .list-group-item', function() {
				const movieId = $(this).data('id');
		        const movieTitle = $(this).data('title');

		        $('#search_movie').val(movieTitle);
		        $('#selected_movie_id').val(movieId);
		        $('#movie_list').hide().empty();
			})
		})
		
	/* 제목 : 모든 글자 포함 30자 이하,
	내용 : 모든 글자 포함 1000자 이하, 
	사진 없을 시 or 다른 경로 추가 */
		$('#insertButton').click(function(){
			let form = document.insert_board_form;
			if(!$('#selected_movie_id').val()){
	        	alert("영화를 선택해주세요.");
	        	return;
	        }
			if (!form.movie_id.value||!form.review_board_title.value || !form.review_board_content.value) {
	            alert("제목과 내용을 모두 입력해주세요.");
	            return;
	        }
			if(form.review_board_file.value){
				const val = form.review_board_file.value;
				console.log(val);
				const idx = val.lastIndexOf('.');
				const type = val.substring(idx+1,val.length);
				if(type!='png'){
					alert('.png 파일만 선택할 수 있습니다.');
					form.review_board_file.value='';
					}
			}
			let sendData = new FormData(form);
			$.ajax({
				url:'/reviewBoardInsert',
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
						location.href="/reviewBoardList";
					}else {
				           alert("게시글 등록에 실패했습니다.");
				       }
				}
			})	
			
		})
		
	</script>
    
</body>
</html>
