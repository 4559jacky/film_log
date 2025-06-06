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
	 <h2 class="text-center">리뷰 게시글</h2><br><br>
    <div class="container mt-5">
    <hr class="my-2" id="hr">
    <br><br>
        <!-- 첫 번째 박스: 게시글 상세 -->
        <div class="content-box mx-auto p-4" style="max-width: 1400px;">
            <h3 class="mb-3">${ReviewBoard.reviewBoardTitle}</h3>
            <div class="d-flex justify-content-between mb-3">
                <div>
                    <span><b>작성자</b>: ${ReviewBoard.memberNickname}</span> |
                    <span><b>영화명</b>: ${ReviewBoard.movieTitle}</span> |
                    <fmt:parseDate value="${ReviewBoard.regDate }" pattern="yyyy-MM-dd'T'HH:mm" var="strRegDate"/>
                    <span><b>작성일</b>: <fmt:formatDate value="${strRegDate }" pattern="yyyy-MM-dd HH:mm"/></span> |
                    <span><b>조회수</b>: </span><span id="countViews">${ReviewBoard.views}</span>
                </div>
            </div>
            <hr>
            <div class="post-content mb-4">
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
        <div class="comment-box mx-auto p-4" style="max-width: 1600px;">
            <h4 class="mb-3">댓글</h4>
            <div>
                <div class="comment-item" id="">
                    <div class="d-flex justify-content-between">
                        <div id="commentList" >
                        	<c:choose>
								<c:when test="${not empty commentList}">
									<c:forEach var="c" items="${commentList}"  varStatus="vs">
										<div class="comment-item">
											<span class="comment-writer"><strong>${c.commentWriter}</strong></span>
										    <fmt:parseDate value="${c.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="strRegDate"/>
										    <span class="comment-date"><small class="text-muted"><fmt:formatDate value="${strRegDate }" pattern="yyyy-MM-dd HH:mm"/></small></span>
										    <p class="mt-2 comment-content">${c.comment}</p>
										    <textarea class="form-control update-comment" id="new_comment" data-comment-no="${c.reviewBoardCommentNo}" rows="3" style="width: 400px; display: none;" required>${c.comment}</textarea>
	        								<c:if test="${member.memberNo eq c.memberNo}">
									            <button class= "btn btn-sm btn-custom me-1 deleteComment_btn" style=" background-color: #d3d3d3; color: #000; border: none;" data-comment-no="${c.reviewBoardCommentNo}" >삭제</button>
									            <button class= "btn btn-sm btn-custom me-1 updateComment_btn" style=" background-color: #d3d3d3; color: #000; border: none;" data-comment-no="${c.reviewBoardCommentNo}" >수정</button>
									            <button class= "btn btn-sm btn-custom me-1 update_btn" style="display: none; background-color: #d3d3d3; color: #000; border: none;" data-comment-no="${c.reviewBoardCommentNo}" >수정 완료</button>
									        </c:if>
									     </div>
									</c:forEach>
								</c:when>
								<c:otherwise>
										<p id="commentNull">댓글이 없습니다.<p>
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
			        <div class="d-flex justify-content-between mt-2">
			            <small id="comment_count" class="form-text text-muted">0 / 50</small>
			            <button type="button" class="btn btn-custom" id="comment_btn" style="background-color: #d3d3d3; color: #000; border: none;">
			            댓글 등록</button>
			        </div>
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
        						let newComment = '<div class="comment-item"><span class="comment-writer"><strong>'+data.commentWriter   
        							+'</strong></span> <span class="comment-date"><small class="text-muted">'
        							+data.regDate+'</small></span>'
        							+'<p class="mt-2 comment-content" >'+data.comment+'</p>'
        							+' <textarea class="form-control update-comment" rows="3" style="width: 400px; display: none;" data-comment-no='+ data.commentNo +' required>'+data.comment+'</textarea>'
        							+ '<button class= "btn btn-sm btn-custom me-1 deleteComment_btn" style=" background-color: #d3d3d3; color: #000; border: none;" data-comment-no='+ data.commentNo +'>삭제</button>'
        							+ '<button class= "btn btn-sm btn-custom me-1 updateComment_btn" style=" background-color: #d3d3d3; color: #000; border: none;" data-comment-no='+ data.commentNo +'>수정</button>'
        							+ '<button class= "btn btn-sm btn-custom me-1 update_btn" style="display: none; background-color: #d3d3d3; color: #000; border: none;" data-comment-no='+ data.commentNo +'>수정 완료</button>'
        							+'</div>';
                                $('#commentList').append(newComment);
                                $('#commentNull').hide();
                          
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
			$(document).on('click', '.deleteComment_btn', function() {
			    if (confirm("정말 댓글을 삭제하시겠습니까?")) {
			        const commentNo = $(this).data("comment-no");

			        $.ajax({
			            url: "/reviewBoardCommentDelete",
			            type: "post",
			            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			            data: { commentNo: commentNo },
			            dataType: "JSON",
			            success: function(data) {
			                alert(data.res_msg);
			                if (data.res_code === "200") {
			                    location.reload();
			                }
			            }
			        });
			    }
			});
		});
		
		$(document).ready(function(){
		    $(document).on('click', '.updateComment_btn', function(){
		        const commentItem = $(this).closest('.comment-item'); 
		       
		        commentItem.find('.comment-writer').hide();
		        commentItem.find('.comment-date').hide();
		        commentItem.find('.comment-content').hide();
		        commentItem.find('.update-comment').show();
		        
		        // 버튼 숨기기 
		        commentItem.find('.update_btn').show();
		        commentItem.find('.deleteComment_btn').hide();
		        commentItem.find('.updateComment_btn').hide();
		        
		    });
		});
		
		$(document).ready(function(){
		    $(document).on('click', '.update_btn', function(){
		    	const commentItem = $(this).closest('.comment-item'); 
		        const commentNo = $(this).data("comment-no");
		        const commentContent = commentItem.find('.update-comment').val();
		        console.log(commentContent);
		        console.log(commentNo);
		    	
		        $.ajax({
		            url: "/reviewBoardCommentUpdate",
		            type: "post",
		            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            data: { commentNo: commentNo,
		            	commentContent : commentContent
		             	 },
		            dataType: "JSON",
		            success: function(data) {
		                alert(data.res_msg);
		                if (data.res_code === "200") {
		                    location.reload();
		                }
		            }
		        });		        
		    });
		});
		
		// 댓글 글자 수 제한 
		$('#comment').on('input',function(){
			let content = $(this).val().trim();
	        let length = content.length;

	        $('#comment_count').text(length + ' /50 ');
	        
			if(length>50){
				$(this).val(content.substring(0, 50));
				alert("50자 이하로 입력해주세요.");
				return;
			}
		})
	
	</script>