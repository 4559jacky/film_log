<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>리뷰 게시글 작성</title>

    <!-- ✅ Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
      
        body { background-color: #f0f0f0; }
        .review-box { background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-height: 1500px;}
         
    </style>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>
    
    <div class="container mt-5">
        <h2 class="text-center">리뷰 게시글 작성</h2>
        <br><br><hr class="my-2" id="hr"><br><br>
        <div class="review-box mx-auto mt-4 p-4" style="max-width: 1400px;">
            <form action='reviewBoardInsert' name="insert_board_form" method="post">
               <div class="mb-3">
				    <label class="form-label">제목</label>
				    <div class="d-flex">
				        <!-- 영화 선택 입력란 -->
				        <div class="position-relative" style="max-width: 300px;">
				            <input type="text" class="form-control" id="search_movie" placeholder="영화 선택" autocomplete="off" size="30">
				            <input type="hidden" name="movie_id" id="selected_movie_id"> <!-- 선택한 영화 ID 저장 -->
				            <ul class="list-group position-absolute w-100" id="movie_list" style="display: none; max-height: 200px; overflow-y: auto; z-index: 1000;"></ul>
				        </div>
				        <!-- 제목 입력란 -->
				        <div class="position-relative flex-grow-1 ms-4">
				            <input type="text" class="form-control" placeholder="제목 입력" name="review_board_title" id="boardTitle" maxlength="50">
				        </div>
				    </div>
				    <!-- 글자 수 표시 (제목 아래로 간격 넓게 설정) -->
				    <div class="mt-2 text-end">
				        <small id="comment_count" class="form-text text-muted">0 / 30</small>
				    </div>
				</div>

                <!-- ✅ Summernote 적용 -->
                <textarea id="summernote" name="review_board_content"></textarea><br>
				<div class="mt-1 text-end">
			       <small id="content_count" class="form-text text-muted">0 / 1000</small>
				</div><br>
                <input type="hidden" name="review_board_writer" value="<c:out value='${member.memberNo}'/>">
                <div class="text-end">
                    <input type="button" class="btn btn-custom" value="게시글 등록" id="insertButton"
                    style="background-color: #e9ecef; color: #000; border-color: #ced4da;">
                </div>
            </form>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            // ✅ Summernote 초기화
            
            $('#summernote').summernote({
                height: 400,
                minHeight: 200,
                maxHeight: 600,
                lang: 'ko-KR',
                placeholder: '여기에 내용을 입력하세요...',
                toolbar: [
                    ['style', ['bold', 'italic', 'underline', 'clear']],
                    ['font', ['strikethrough', 'superscript', 'subscript']],
                    ['fontsize', ['fontsize']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['insert', ['picture', 'link', 'video']],
                    ['view', ['fullscreen', 'codeview', 'help']]
                ]
            });
             
        });
        
        
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
						    		result = '<li class="list-group-item" data-id="' + data.movieArray[i].movieId + '" data-title="' + data.movieArray[i].movieTitle + '">'
						            + data.movieArray[i].movieTitle + '</li>';
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

		// 제목 글자 수 제한
		$('#boardTitle').on('input',function(){
			let content = $(this).val().trim();
	        let length = content.length;

	        $('#comment_count').text(length + ' /30 ');
	        
			if(length>30){
				alert("제목을 30자 이하로 입력해주세요.");
			    $(this).val(content.substring(0, 30));
				return;
			}
		})
		
		// 내용 글자 수 제한
		$('#summernote').on('summernote.change', function() {
		    let content = $(this).summernote('code').replace(/<[^>]+>/g, '').trim();  // HTML 태그를 제거하고 텍스트만 추출
		    let length = content.length;
		
		    $('#content_count').text(length + ' /1000');
		
		    if (length > 1000) {
		        alert("1000자 이하로 입력해주세요.");
		        let truncatedContent = content.substring(0, 1000);
		        return;
		    }
		});
		

    </script>

</body>
</html>