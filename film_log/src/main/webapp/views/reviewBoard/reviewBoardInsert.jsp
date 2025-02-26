<%@ page language="java" contentType="text/html; charset=UTF-8"
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
			let form = $(this);
			let reviewBoardTitle = form.find("input[name='review_board_title']").val();
			if(!reviewBoardTitle || !form.review_board_content.value){
				alert("제목과 내용을 모두 입력해주세요.");
			}else if(form.review_board_file.value){
				const val = form.review_board_file.value;
				console.log(val);
				const idx = val.lastIndexOf('.');
				const type = val.substring(idx+1,val.length);
				if(type=='png'){
					// 크기 1024*1024*10(byte), 5개 이하
				 const sendData = new FormData(form); 
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
     			}else{
					alert('.png 파일만 선택할 수 있습니다.');
					form.board_file.value='';
				}
			}
		})
	</script>
</body>
</html>