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
    <title>게시글 상세</title>
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
	 <h2 class="text-center">리뷰 게시글</h2><br><br>
    <div class="container mt-5">
    <hr class="my-2" id="hr">
    <br><br>
        <!-- 첫 번째 박스: 게시글 상세 -->
        <div class="content-box mx-auto p-4" style="max-width: 1400px;">
            <h3 class="mb-3">${ReviewBoard.reviewBoardTitle}</h3>
            <div class="d-flex justify-content-between mb-3">
                <div>
                    <span>작성자: ${ReviewBoard.memberNickname}</span> |
                    <span>영화명: ${ReviewBoard.movieTitle}</span> |
                    <fmt:parseDate value="${ReviewBoard.regDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="strRegDate"/>
                    <span>작성일: <fmt:formatDate value="${strRegDate }" pattern="yyyy-MM-dd HH:mm:ss"/></span> |
                    <span>조회수: </span><span id="countViews">${ReviewBoard.views}</span>
                </div>
            </div>
            <hr>
            <div class="post-content mb-4">
            	<c:if test="${ReviewBoard.imgNo ne 0}">
					<img src="<%=request.getContextPath()%>/reviewFilePath?img_no=${ReviewBoard.imgNo}" class="img-fluid mb-3">
				</c:if> 
                <p>
                   ${ReviewBoard.reviewBoardContent}
                </p>
            </div>
            <div class="text-end">
            	<c:if test="${member.memberNo eq ReviewBoard.reviewBoardWriter}">
	                <button class="btn btn-custom me-2" id="update_btn" style=" background-color: #d3d3d3; color: #000; border: none;"
	                 data-reviewboardno="${ReviewBoard.reviewBoardNo}">
	                게시글 수정</button>
	                <button class="btn btn-custom" id="delete_btn" style=" background-color: #d3d3d3; color: #000; border: none;"
	                data-reviewboardno="${ReviewBoard.reviewBoardNo}">
	                게시글 삭제</button>
            	</c:if>
            </div>
        </div>

        <!-- 두 번째 박스: 댓글 영역 -->
        <div class="comment-box mx-auto p-4" style="max-width: 1400px;">
            <h4 class="mb-3">댓글</h4>
            <div>
                <div class="comment-item" id="">
                    <div class="d-flex justify-content-between">
                        <div id="commentList" >
                        	<c:choose>
								<c:when test="${not empty commentList}">
									<c:forEach var="c" items="${commentList}"  varStatus="vs">
									<div class="comment-item">
										<span><strong>${c.commentWriter}</strong></span>
										<fmt:parseDate value="${c.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="strRegDate"/>
										<span><small class="text-muted"><fmt:formatDate value="${strRegDate }" pattern="yyyy-MM-dd HH:mm"/></small></span>
        								<p class="mt-2" >${c.comment}</p>
        								
        								<c:if test="${member.memberNo eq c.memberNo}">
								            <button style=" background-color: #d3d3d3; color: #000; border: none;" data-comment-no="${c.reviewBoardCommentNo}" class="deleteComment_btn">삭제</button>
								        </c:if>
								     </div>
									</c:forEach>
								</c:when>
								<c:otherwise>
										<p>댓글이 없습니다.<p>
								</c:otherwise>
							</c:choose>
                        </div>
                    </div>
                 
                </div>
            </div>
            <!-- 댓글 작성 폼 -->
            <form id="comment_form" class="mb-4">
                <div class="mb-3">
                    <textarea class="form-control" rows="3" placeholder="댓글을 입력하세요" id="comment" required></textarea>
                </div>
                <div class="text-end">
                    <button type="button" class="btn btn-custom" id="comment_btn" style=" background-color: #d3d3d3; color: #000; border: none;">
                    댓글 등록</button>
                </div>
            </form>
            
        </div>
    </div>
	<script>
	// 게시물 삭제
		$(document).ready(function(){
			$('#delete_btn').click(function(){
				if(confirm("정말 게시물을 삭제하시겠습니까?")){
					const reviewBoardNo = $(this).data('reviewboardno');
					$.ajax({
						url:"/reviewBoardDelete",
						type: "post",
						contentType:"application/x-www-form-urlencoded; charset=UTF-8",
						data:{reviewBoardNo : reviewBoardNo},
						dataType:"JSON",
						success:function(data){
							alert(data.res_msg);
							if(data.res_code === "200") {
								location.href="/reviewBoardList";
							}
						}
					})				
				}
			})
		})
		
		// 조회수 증가
		$(document).ready(function(){
			const reviewBoardNo = ${ReviewBoard.reviewBoardNo};
			const views = ${ReviewBoard.views};
			
			updateViewCount(reviewBoardNo, views);
		})
		
		function updateViewCount(reviewBoardNo, views){
			$.ajax({
				url:"/updateViews",
				type: "post",
				contentType:"application/x-www-form-urlencoded; charset=UTF-8",
				data:{reviewBoardNo : reviewBoardNo,
					views : views},
				dataType:"JSON",
				success:function(data){
					if(data.res_code === "200") {
						console.log(data.updateViews);
	                    $("#countViews").text(data.updateViews);
	               
	                }
				}
			})
		
		}
		
		// 게시물 수정
		$(document).ready(function(){
			$('#update_btn').click(function(){
				const reviewBoardNo = $(this).data('reviewboardno');
				console.log(reviewBoardNo);
				location.href='/reviewBoardUpdatePass?reviewBoardNo='+reviewBoardNo;
			})
		})
		
		// 댓글 등록
		$(document).ready(function(){
			
			$('#comment_btn').click(function(){
				const reviewBoardNo = "${ReviewBoard.reviewBoardNo}";
				const memberNo = "${member.memberNo}";
				const commentContent = $('#comment').val();
				console.log("reviewBoardNo:"+ reviewBoardNo);
				console.log("memberNo:" + memberNo);
				console.log("commentContent:" +commentContent);
            	if(memberNo){
            		
        			$.ajax({
        				url:'/insertReviewComment',
        				type:'post',
        				contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        				data:{reviewBoardNo : reviewBoardNo,
        					memberNo : memberNo,
        					commentContent : commentContent},
        				dataType:'json',
        				success:function(data){
        					alert(data.res_msg);
        					if(data.res_code==="200"){
        						$('#comment').val("");
        						let newComment = '<span><strong>'+data.commentWriter   
        							+'</strong></span> <span><small class="text-muted">'
        							+data.regDate+'</small></span>'
        							+'<p class="mt-2" >'+data.comment+'</p>'
        							+ '<button style=" background-color: #d3d3d3; color: #000; border: none;" data-comment-no='+ data.commentNo +' class="deleteComment_btn">삭제</button>';	
                                $('#commentList').append(newComment);
                             
        				
        					}
        				}
        			});		
            	}else{
            		if(confirm("로그인 후 작성 가능합니다. 로그인 하시겠습니까?")){
            			location.href = "/memberLoginPass";       
            		}	
            	}
			})
		})
		
		
		// 댓글 삭제 
		$(document).ready(function(){
			// append한 코드에 강제 이벤트 발생 
			$(document).on('click','.deleteComment_btn',function(e){
				if(confirm("정말 댓글을 삭제하시겠습니까?")){
					const commentNo = $(this).data("comment-no");
					//window.location = window.location;
					$.ajax({
						url:"/reviewBoardCommentDelete",
						type: "post",
						contentType:"application/x-www-form-urlencoded; charset=UTF-8",
						data:{commentNo : commentNo},
						dataType:"JSON",
						success:function(data){
							alert(data.res_msg);
							if(data.res_code === "200") {
								location.reload();
							}
						}
					})				
				}
			});
			
		})
		
	
	</script>