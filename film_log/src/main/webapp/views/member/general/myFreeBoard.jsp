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
	<title>내가 쓴 자유 게시글</title>
	<style>
	    .table thead th {
		    background-color: #e9ecef !important;
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<c:set var="freeBoard" value="${freeBoardList}"/>
	<%@ include file="/views/include/nav.jsp" %>
    <div class="container mt-5">
        <h2 class="text-center">자유 게시판</h2><br><br>
        <hr class="my-2" id="hr"><br><br>
        
		<div class="d-flex justify-content-between my-3 review_board_list">
			<form>
				<!-- <div class="row g-2">
					<div class="col-md-3">
						<select class="form-select" id="searchFilter">
							<option value="0">선택</option>
							<option value="1">제목</option>
							<option value="2">작성자</option>
						</select>
					</div>
					<input type="text" class="form-control" placeholder="검색어를 입력해주세요.">
					<div class="col-md-3">
				         <button class="btn select_btn">검색</button>
				    </div>
				</div> -->
			</form>
			<button class="btn insert_btn">게시글 작성</button>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>게시글번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
		   </thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty freeBoardList}">
						<c:forEach var="board" items="${freeBoardList}" varStatus="vs">
						    <tr data-board-no="${board.freeBoardNo}">
						        <td>${vs.index + 1}</td>
						        <td>${board.freeBoardTitle}</td>
						        <td>
						            <c:choose>
						                <c:when test="${fn:length(board.freeBoardContent) > 100}">
						                    ${fn:substring(board.freeBoardContent, 0, 100)}...
						                </c:when>
						                <c:otherwise>
						                    ${board.freeBoardContent}
						                </c:otherwise>
						            </c:choose>
						        </td>
						        <td>${board.memberNickname}</td>
						        <td>${board.regDateStr}</td>
						    </tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan=5 style="pointer-events: none;">게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<script>
		// 게시글 하나 클릭시 상세페이지로 이동
		$('table.table-hover tbody tr').on('click',function(){
			const boardNo = $(this).data('board-no');
			console.log(boardNo);
			location.href="/freeBoardDetail?boardNo="+boardNo;
		})
		
		$(document).ready(function(){
						$(".insert_btn").click(function(){
							var memberNo = "${member.memberNo}"
							if(memberNo){
								location.href="/freeBoardInsertPass";
							}else{
								if(confirm("로그인 후 작성 가능합니다. 로그인 하시겠습니까?")){
									location.href="/memberLoginPass";
								}
							}
						})
					})
	</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>