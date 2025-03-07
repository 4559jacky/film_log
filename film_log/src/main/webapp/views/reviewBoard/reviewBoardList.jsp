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
    <title>리뷰 게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table-dark { background-color: #f8f9fa !important; color: #000 !important; }
        .select_btn { background-color: #e9ecef !important; color: #000 !important; border-color: #ced4da !important; }
        .insert_btn { background-color: #e9ecef !important; color: #000 !important; border-color: #ced4da !important; }

    </style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<%@ include file="/views/include/nav.jsp" %>
    <div class="container mt-5">
        <h2 class="text-center">리뷰 게시판</h2><br><br>
        <hr class="my-2" id="hr"><br><br>
        
        <div class="d-flex justify-content-between my-3 review_board_list">
            <div class="input-group w-50">
                <select class="form-select" id="searchFilter">
                	<option value="0">선택</option>
                    <option value="1">제목</option>
                    <option value="2">영화</option>
                    <option value="3">작성자</option>
                </select>
                <input type="text" id="" class="form-control" placeholder="검색어 입력">
                <button class="btn select_btn">검색</button>
                <script>
	                $(document).ready(function () {
	                    $(".insert_btn").click(function () {
	                    	var memberNo = "${member.memberNo}";
	                    	if(memberNo){
	                        	location.href = "/reviewBoardInsertPass";               		
	                    	}else{
	                    		if(confirm("로그인 후 작성 가능합니다. 로그인 하시겠습니까?")){
	                    			location.href = "/memberLoginPass";       
	                    		}	
	                    	}
	                    });
	                });
                </script>
            </div>
            <button class="btn insert_btn">리뷰 작성</button>
        </div>
        <table class="table table-hover">
            <thead class="table-dark">
                <tr>
                    <th>게시글 번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>게시일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
				<c:when test="${not empty resultList }">
					<c:forEach var="r" items="${resultList }"  varStatus="vs">
						<tr data-board-no="${r.reviewBoardNo}">
							<td>${((paging.nowPage-1)*paging.numPerPage)+(vs.index+1)}</td>
							<td><b>[${r.movieTitle }]</b> ${r.reviewBoardTitle }</td>
							<td>${r.memberNickname }</td>
							<fmt:parseDate value="${r.regDate }" pattern="yyyy-MM-dd'T'HH:mm" var="strRegDate"/>
							<td>
								<fmt:formatDate value="${strRegDate }" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td>${r.views }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
            </tbody>
        </table>
    </div>
    <c:if test="${not empty paging}">
		<div class="center">
			<div class="pagination justify-content-center">
				<c:if test="${paging.prev} ">
					<c:url var="testUrl" value="/reviewBoardList">
					<c:param name="nowPage" value="${paging.pageBarStart-1}"/>
					</c:url>
					<a class="page-link" href="${testUrl} ">&laquo;</a>
				</c:if>
				<c:forEach var="i" begin="${paging.pageBarStart}" end="${paging.pageBarEnd}">
					<a class="page-link" href="/reviewBoardList?nowPage=${i}">
						${i}
					</a>
				</c:forEach>
				<c:if test="${paging.next}">
					<a class="page-link" href="/reviewBoardList?nowPage=${(paging.pageBarEnd)+1}">&raquo;</a>
				</c:if>
			</div>
		</div>
	</c:if>
	<script>
		$('table.table-hover tbody tr').on('click',function(){
			const boardNo = $(this).data('board-no');
			console.log(boardNo);
			location.href='/reviewBoardDetail?review_board_no='+boardNo;
		})	
	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
