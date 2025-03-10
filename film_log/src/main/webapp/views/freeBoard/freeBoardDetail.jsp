<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시글 상세페이지</title>
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
	        width: 100%; /* 부모 너비를 모두 사용 */
	        min-width: 600px; /* 최소 너비 설정 (필요에 따라 조정) */
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
<body>
	<%@ include file="/views/include/nav.jsp" %>
	<br><br>
	 <h2 class="text-center">자유 게시글</h2><br><br>
    <div class="container mt-5">
    <hr class="my-2" id="hr">
    <br><br>
		<!-- 첫 번째 박스: 게시글 상세 -->
		<div class="content-box mx-auto p-4" style="max-width: 1400px;">
			<h3 class="mb-3">${freeBoard.freeBoardTitle}</h3>
			<div class="d-flex justify-content-between mb-3">
				<div>
			    	<input type="hidden" id="boardNo" name="board_no" value="<c:out value='${freeBoard.freeBoardNo }'/>"/>
                    <span><b>작성자</b>: ${freeBoard.memberNickname}</span> |
                    <fmt:parseDate value="${freeBoard.regDate }" pattern="yyyy-MM-dd'T'HH:mm" var="strRegDate"/>
                    <span><b>작성일</b>: <fmt:formatDate value="${strRegDate }" pattern="yyyy-MM-dd HH:mm"/></span>
                </div>
			</div>
			<hr>
				<div class="post-content mb-4">
					<p>
						${freeBoard.freeBoardContent }
					</p>
				</div>
	    	<div class="text-end">
	           <c:if test="${member.memberNo eq freeBoard.memberNo}">
		           <button class="btn btn-custom" id="updateBtn" data-freeBoardno="${freeBoard.freeBoardNo}" style=" background-color: #d3d3d3; color: #000; border: none;">수정</button>
		           <button class="btn btn-custom" id="deleteBtn" data-freeBoardno="${freeBoard.freeBoardNo}" style=" background-color: #d3d3d3; color: #000; border: none;">삭제</button>
			   </c:if>	        
	        </div>
		</div>
	 </div>    
        <script>
		  //수정버튼 클릭시 작동
		   $(function(){
		      $('#updateBtn').click(function(){
		         const boardNo = $('#boardNo').val();
		         console.log(boardNo);
		         location.href="/freeBoardUpdatePass?freeBoardNo="+boardNo;
			  })
			})
		  //삭제버튼 클릭시 작동
		   $(function(){
		      $('#deleteBtn').click(function(){
		         if(confirm("정말 게시물을 삭제하시겠습니까?")){
		            const freeBoardNo = $('#boardNo').val();
		            console.log(freeBoardNo);
		           $.ajax({
		              url:"/freeBoardDelete",
		              type:"POST",
		              dataType:"JSON",
		              data:{freeBoardNo:freeBoardNo},
		              success:function(data){
		                  alert(data.res_msg);
		                  if(data.res_code == 200){
		                      location.href="/freeBoardList";
		                 }
		              },
		              error:function(xhr,status,error){
		                  alert("삭제 요청 중 오류가 발생했습니다.");
		                  console.error("Error : "+error);
			              }
			           });
			         }
			      })
			   })
		</script>
</body>
</html>