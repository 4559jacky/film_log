<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>리뷰 게시글 작성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f0f0f0; }
        .review-box { background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-height: 1500px;}
        .btn-custom { background-color: #e9ecef; color: #000; border-color: #ced4da; }
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
                    <select class="form-select me-2" style="max-width: 200px;" name="movie_no" id="select_movie">
                        <option value="0">영화 선택</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
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
	/* 제목 : 모든 글자 포함 30자 이하,
	내용 : 모든 글자 포함 1000자 이하, 
	사진 없을 시 or 다른 경로 추가 */
		$('#insertButton').click(function(){
			let form = document.insert_board_form;
			if($('#select_movie').val()=="0"){
	        	alert("영화를 선택해주세요.");
	        	return;
	        }
			if (!form.movie_no.value||!form.review_board_title.value || !form.review_board_content.value) {
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
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	<div class="insert_board_form">
		<form action='reviewBoardInsert' name="insert_board_form" method="post"> 
			<input type="text" name="movie_no" placeholder="영화">
			<input type="text" name="review_board_title" placeholder="제목을 입력해주세요.">
			<input type="text" name="review_board_content" placeholder="내용을 입력해주세요.">
			<input type="file" name="review_board_file" accept=".png,.jpg,.jpeg"><br>
			<input type="hidden" name="review_board_writer" value="<c:out value="${member.memberNo}"/>">
			<input type="button" value="게시글 등록" id="insertButton"> 
		</form>
	</div>
	<script>
	/* 제목 : 모든 글자 포함 30자 이하,
	내용 : 모든 글자 포함 1000자 이하, */
		$('#insertButton').click(function(){
			let form = document.create_board_form;	
			if(!form.review_board_title.value || !form.review_board_content.value){
				alert("제목과 내용을 모두 입력해주세요.");
			}else{
				if(form.review_board_file.value){
					onst val = form.review_board_file.value;
					console.log(val);
					const idx = val.lastIndexOf('.');
					const type = val.substring(idx+1,val.length);
					if(type!='png'){
						alert('.png 파일만 선택할 수 있습니다.');
						form.board_file.value='';
					}
				}
				$.ajax({
					url:'/reviewBoardInsert',
					type:'post',
					enctype:'multipart/form-data',
					cache:false,
					async:false,
					contentType:false,
					processData:false,
					data:sendData, 
					dataType:'json',
					success:function(data){
						alert(data.res_msg);
						if(data.res_code==200){
							location.href="reviewBoardList";
						}
					}
				})	
			}
		})
	</script>
</body>
</html> --%>