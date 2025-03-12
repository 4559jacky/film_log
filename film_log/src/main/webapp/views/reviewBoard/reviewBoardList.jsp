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
    <style>
        
        .table thead th {
		    background-color: #e9ecef !important; /* 연한 회색 배경 */
		    color: #000 !important;
		}

        
        .select_btn, .insert_btn { 
            background-color: #e9ecef !important; 
            color: #000 !important; 
            border-color: #ced4da !important; 
        }
        
        /* 테이블 모서리 둥글게 */
        .table {
            border-radius: 10px;
            overflow: hidden;
        }
        
        /* 테이블 헤더 둥글게 */
        thead tr:first-child th:first-child {
            border-top-left-radius: 10px;
        }
        thead tr:first-child th:last-child {
            border-top-right-radius: 10px;
        }

        /* 테이블 하단 둥글게 */
        tbody tr:last-child td:first-child {
            border-bottom-left-radius: 10px;
        }
        tbody tr:last-child td:last-child {
            border-bottom-right-radius: 10px;
        }
    </style>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
    <div class="container mt-5">
        <h2 class="text-center">리뷰 게시판</h2><br><br>
        <hr class="my-2" id="hr"><br><br>
        
        <div class="d-flex justify-content-between my-3 review_board_list">
        	<form action="/reviewBoardList" method="get">
			    <div class="row g-2">
			        <div class="col-md-3">
			            <select class="form-select" id="selectNo" name="selectNo">
			                <option value="0">선택</option>
			                <option value="1" ${paging.filter eq '1'? 'selected':'' }>제목</option>
			                <option value="2" ${paging.filter eq '2'? 'selected':'' }>영화</option>
			                <option value="3" ${paging.filter eq '3'? 'selected':'' }>작성자</option>
			            </select>
			        </div>
			        <div class="col-md-6">
			            <input type="text" id="selectWord" class="form-control" placeholder="검색어 입력" name="selectWord"
			                   value="${paging.word == null? '' : paging.word}">
			        </div>
			        <div class="col-md-3">
			            <button class="btn select_btn">검색</button>
			        </div>
			    </div>
			</form>
            <button class="btn insert_btn">게시글 작성</button>
        </div>
        <table class="table table-hover">
            <thead>
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
						<td colspan="5" style="pointer-events: none;">게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
            </tbody>
        </table>
    </div>
    <c:if test="${not empty paging}">
		<div class="center">
			<div class="pagination justify-content-center">
				<c:if test="${paging.pageBarStart > 1}">
					<c:url var="testUrl" value="/reviewBoardList">
					<c:param name="nowPage" value="${paging.pageBarStart-1}"/>
					</c:url>
					<a class="page-link" href="${testUrl} ">&laquo;</a>
				</c:if>
				<c:forEach var="i" begin="${paging.pageBarStart}" end="${paging.pageBarEnd}">
					<a class="page-link" href="/reviewBoardList?nowPage=${i}&selectNo=${param.selectNo}&selectWord=${param.selectWord}">
						${i}
					</a>
				</c:forEach>
				<c:if test="${paging.next}">
					<a class="page-link" href="/reviewBoardList?nowPage=${(paging.pageBarEnd)+1}&selectNo=${param.selectNo}&selectWord=${param.selectWord}">&raquo;</a>
				</c:if>
			</div>
		</div>
	</c:if>
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
		
		$('table.table-hover tbody tr').on('click',function(){
			const boardNo = $(this).data('board-no');
			console.log(boardNo);
			location.href='/reviewBoardDetail?review_board_no='+boardNo;
		})	
	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
