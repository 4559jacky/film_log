<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>자유 게시글 작성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body { background-color: #F0F0F0; }
        .review-box { background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); max-height: 1500px;}
        .btn-custom { background-color: #E9ECEF; color: #000; border-color: #CED4DA; }
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
	        background-color: #F8F9FA;
	        color: #007BFF;
	    }
	
	    /* 선택된 항목 강조 */
	    #movie_list .list-group-item.active {
	        background-color: #007BFF;
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
        <h2 class="text-center">자유 게시글 작성</h2><br><br>
        <hr class="my-2" id="hr"><br><br>
        <div class="review-box mx-auto mt-4 p-4" style="max-width: 1400px;">
            <form class="insert_board_form" novalidate>
            <div class="mb-3">
                <label class="form-label">제목</label>
                <div class="d-flex">
                    <input type="text" class="form-control" placeholder="제목 입력" name="free_board_title" id="boardTitle">
                </div>
                    <small id="comment_count1" class="form-text text-muted">0 / 30</small>
            </div>
            <div class="mb-3">
                <label class="form-label">내용</label>
                <textarea class="form-control" rows="6" placeholder="내용을 입력하세요" name="free_board_content" id="boardContent" style="height: 500px;"></textarea>
                 <small id="comment_count2" class="form-text text-muted">0 / 1000</small>
            </div>
            
            <input type="hidden" name="free_board_writer" id="boardWriter" value="<c:out value="${member.memberNo}"/>">
            <div class="text-end">
            	<input type="button" class="btn btn-custom" value="게시글 등록" id="insertButton"
            	style="background-color: #E9ECEF; color: #000; border-color: #CED4DA;">
            </div>
            </form>
        </div>
    </div>
    <script>
	    $(document).ready(function(){
	    	  $("#insertButton").click(function(event){
	    		  let boardTitle = $('#boardTitle').val();
	    		  let boardContent = $('#boardContent').val();
	    		  let boardWriter = $('#boardWriter').val();
	    		 if (!boardTitle || !boardContent){
	    		   alert("제목과 내용을 모두 입력해주세요.");
	    		 	return;
	    		 }
	    	    $.ajax({
	    		    url:"/freeBoardInsert",
	    		    type:"post",
	    	        data:{
	    	        	boardTitle : boardTitle,
	    	        	boardContent : boardContent,
	    	        	memberNo : boardWriter,
	    	        },
	    	        dataType:'JSON',
	    		    success:function(data){
	    			   alert(data.res_msg);
	    			   if(data.res_code==200){
	    				   location.href="/freeBoardList";
	    			   }else {
	    				   event.preventDefault();
	    				   event.stopPropagation();
	    			   }
	    		    }
	    	     });	
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
    })
	</script>
</body>
</html>