<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>게시글 수정화면</title>
	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body { background-color: #f0f0f0; }
        .review-box { background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-height: 1500px;}
    </style>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
    <div class="container mt-5">
         <h2 class="text-center">자유 게시글 수정</h2>
        <br><br><hr class="my-2" id="hr"><br><br>
        <div class="review-box mx-auto mt-4 p-4" style="max-width: 1400px;">
            <form class="update_board_form" novalidate>
            <div class="mb-3">
                <label class="form-label">제목</label>
                <div class="d-flex">
                    <input type="text" class="form-control" placeholder="제목 입력" 
                    name="free_board_title" id="boardTitle" value="${freeBoard.freeBoardTitle }">
                </div>
                    <small id="comment_count1" class="form-text text-muted">0 / 30</small>
            </div>
            <div class="mb-3">
                <label class="form-label">내용</label>
                <textarea class="form-control" rows="6" placeholder="내용을 입력하세요" name="free_board_content" 
                id="boardContent" style="height: 500px;">"${freeBoard.freeBoardContent}"</textarea>
                 <small id="comment_count2" class="form-text text-muted">0 / 1000</small>
            </div>
            <input type="hidden" name="free_board_no" id="boardNo" value="<c:out value="${freeBoard.freeBoardNo}"/>">
            <input type="hidden" name="free_board_writer" id="boardWriter" value="<c:out value="${member.memberNo}"/>">
            <div class="text-end">
            	<input type="button" class="btn btn-custom" value="게시글 수정" id="updateBtn"
            	style="background-color: #E9ECEF; color: #000; border-color: #CED4DA;">
            </div>
            </form>
        </div>
    </div>

	<script>
		// 수정화면에서 수정하기 버튼클릭시 동작
		$(document).ready(function(){
		  $("#updateBtn").click(function(event){
			  let boardTitle = $('#boardTitle').val();
			  let boardContent = $('#boardContent').val();
			  let boardWriter = $('#boardWriter').val();
			  let boardNo = $('#boardNo').val();
			  if (!boardTitle || !boardContent) {
			   	 alert("제목과 내용을 모두 입력해주세요.");
			 return;
		   }
		    $.ajax({
			    url:"/freeBoardUpdate",
			    type:"post",
		        dataType:'JSON',
				contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		        data:{
		        	boardNo : boardNo,
		        	boardWriter : boardWriter,
		        	boardTitle : boardTitle,
		        	boardContent : boardContent,
		        },
			    success:function(data){
				   alert(data.res_msg);
				   if(data.res_code==200){
					   location.href="/freeBoardList";
				   }else {
					   event.preventDefault();
					   event.stopPropagation();
					   }
				    }
			     })	
			  })
			});
		// 제목 글자 수 제한
		$('#boardTitle').on('input',function(){
			let content = $(this).val().trim();
	        let length = content.length;
	        $('#comment_count1').text(length + ' /30 ');
	       
			if(length>30){
				alert("30자 이하로 입려해주세요.");
				return;
			}
		})
		// 내용 글자 수 제한
		$('#boardContent').on('input',function(){
			let content = $(this).val().trim();
	        let length = content.length;
	        $('#comment_count2').text(length + ' /1000 ');
	       
			if(length>1000){
				alert("1000자 이하로 입려해주세요.");
				return;
			}
		});
	</script>
</body>
</html>