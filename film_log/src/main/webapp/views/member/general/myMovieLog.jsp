<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 영화 관람 기록</title>
<link href="/resources/css/include/allpage.css" rel="stylesheet" type="text/css">
<link href="/resources/css/include/paing.css?after" rel="stylesheet" type="text/css">
</head>
<body id="body">
	<%@ include file="/views/include/myMenuNav.jsp" %>
	<div class="container-sm">
		<br>
		<p class="text-center fs-1">영화 관람 기록</p>
		<br>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="">
				기록하기
			</button>
		</div>
		<!-- 모달 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">기록 추가</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<div class="position-relative" style="max-width: 300px;">
					<input type="text" class="form-control" id="search_movie" placeholder="영화 선택" autocomplete="off">
					<input type="hidden" name="movie_id" id="selected_movie_id"> <!-- 선택한 영화 ID 저장 -->
					<ul class="list-group position-absolute w-100" id="movie_list" style="display: none; max-height: 200px; overflow-y: auto; z-index: 1000;"></ul>
				</div>
		      <form name="create_record_form">
		        <label for="watched_date">관람일</label>
				<input type="datetime-local" class="form-control" name="watched_date" id="watched_date" value="yyyy-MM-ddTHH:mm" min="1920-01-01T00:00">
   				
   				<label for="memo">메모</label>
	              <input type="text" class="form-control" name="memo" id="memo">
	          </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" onclick="insertRecord();">저장</button>
		        <button type="button" class="btn btn-primary" onclick="updateRecord();" style="display : none;">수정</button>
		      </div>
		    </div>
		  </div>
		</div>

		<hr class="my-2" id="hr">
		
		<div class="container-sm" style="display : flex; justify-content: space-between;">
			<form style="display : inline;" action="#" name="select_genre" method="get">
	    		<select name="genre_type" onchange="this.form.submit()">
	        		<option value="0">전체</option>
					<c:forEach var="genre" items="${genres}">
	        			<option value="${genre.id}" ${genre.id == paging.genreType ? 'selected' : ''}>${genre.name}</option>
	    			</c:forEach>	
	    		</select>
			</form>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<form action="/myMovieLog" name="search_myMovielog_form" method="get">
				<input type="hidden" name="qna_type" value="${paging.genreType}">
				<input type="text" name="movie_title" placeholder="영화를 입력해주세요."
				value="${paging.movieTitle}">
				<input type="submit" value="검색">
			</form>	
		</div>
		</div>
		<br>
			<c:if test="${not empty records}">
		<table class="table">
			<tbody>
    <c:forEach var="record" items="${records}" varStatus="vs">
        <tr onclick="" style="cursor: pointer;">
            <fmt:parseDate value="${record.watchedDate}" pattern="yyyy-MM-dd'T'HH:mm" var="strWatchedDate" />
            <td style="text-align: center; width:300px">
                <img src="https://image.tmdb.org/t/p/w500/${record.posterPath}'" class="" alt="${record.movieTitle}" width="300" height="340">
            </td>
            <td>
                ${record.movieTitle}<br><br>${record.memo}<br><br>
                관람일 : <fmt:formatDate value="${strWatchedDate}" pattern="yyyy-MM-dd HH:mm" /><br>
                <!-- 수정 버튼 -->
                <input type="hidden" id="record_no" name="recordNo" value="${record.recordNo}">
                <button type="button" onclick="loadRecord(${record.recordNo});">수정</button>
                <!-- 삭제 버튼 -->
                    <input id="delete_record_no" type="hidden" name="recordNo" value="${record.recordNo}">
                    <button type="button" onclick="deleteRecord();">삭제</button>
            </td>
        </tr>
    </c:forEach>
</tbody>

		</table>
	</c:if>
	<c:if test="${empty records}">
		<table class="table">
			<tbody>
				<tr>
					<td colspan="4" class="text-center">기록이 없습니다. 새로 기록해보세요!</td>
				</tr>
			</tbody>
		</table>
	</c:if>
	<nav aria-label="Page navigation-sm">
  <ul class="pagination justify-content-center">
  	<c:if test="${not empty paging.movieTitle}">
  		<c:set var="titleParam" value="${'&movie_title='}${paging.movieTitle}"></c:set>
  	</c:if>
    <c:if test="${paging.prev}">
      <li>
        <a class="pagination-newer" href="/myMovieLog?nowPage=${paging.pageBarStart - 1}${'&genre_type='}${paging.genreType}${titleParam}" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
    </c:if>
    <c:forEach var="i" begin="${paging.pageBarStart}" end="${paging.pageBarEnd}">
      <li class="${i == paging.nowPage ? 'pagination-active' : ''}">
        <a href="/myMovieLog?nowPage=${i}${'&genre_type='}${paging.genreType}${titleParam}">${i}</a>
      </li>
    </c:forEach>
    <c:if test="${paging.next}">
      <li>
        <a class="pagination-older" href="/myMovieLog?nowPage=${paging.pageBarEnd + 1}${'&genre_type='}${paging.genreType}${titleParam}" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </c:if>
  </ul>
</nav>
	</div>
	<script>
	$(document).ready(function(){
		$('#search_movie').on('keyup',function(){
			const movieTitle = $(this).val().trim();
			
			if (movieTitle.length === 0) {
				$('#movie_list').hide().empty();
		        return;
		    }
			
			$.ajax({
				url:'/reviewBoardSelectMovieList',
				type: "post",
				contentType:"application/x-www-form-urlencoded; charset=UTF-8",
				data:{movieTitle : movieTitle},
				dataType:"json",
				success:function(data){
					$('#movie_list').empty();
						 if (!data.movieArray || data.movieArray.length === 0) {
					        $('#movie_list').append('<li class="list-group-item text-muted">검색 결과가 없습니다.</li>');
					    } else {
					    	let result = "";
					    	for(let i = 0 ; i < data.movieArray.length ; i++){
					    		result = '<li class="list-group-item" data-id='+data.movieArray[i].movieId+' data-title='+data.movieArray[i].movieTitle+'>'
					    				+data.movieArray[i].movieTitle+ '</li>'
						    	$('#movie_list').append(result);
					    	}
					    }
						$('#movie_list').show();
					
				}
			})	
		})
		
		$(document).on('click', '#movie_list .list-group-item', function() {
			const movieId = $(this).data('id');
	        const movieTitle = $(this).data('title');
	        $('#search_movie').val(movieTitle);
	        $('#selected_movie_id').val(movieId);
	        $('#movie_list').hide().empty();
		})
	})
	
		const insertRecord = function() {
			const form = document.create_record_form;
			if(!document.getElementById("selected_movie_id").value) {
				alert("영화를 선택해주세요");
				form.create_record_form.focus();
			} else {
				$.ajax({
					url : "/insertRecord",
					type : "post",
					data : {
						"movie_id" : document.getElementById("selected_movie_id").value,
						"watched_date" : form.watched_date.value,
						"memo" : form.memo.value
					},
					dataType : "JSON",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {
						alert(data.res_msg);
						if(data.res_code == "200") {
							location.reload();
						}
					}
				})
			}
		}
	
  		const today = new Date().toISOString().split('T')[0];
  		document.getElementById("watched_date").setAttribute("max", today);
  		
  		$('#exampleModal').on('hidden.bs.modal', function () {
  		    $('#search_movie').val('');
  		    $('#selected_movie_id').val('');
  		    $('#watched_date').val('');
  		    $('#memo').val('');
  		});
  		
  		const updateRecord = function() {
  			const form = document.create_record_form;
			if(!document.getElementById("selected_movie_id").value) {
				alert("영화를 선택해주세요");
				form.create_record_form.focus();
			} else {
				$.ajax({
					url : "/updateRecord",
					type : "post",
					data : {
						"movie_id" : document.getElementById("selected_movie_id").value,
						"watched_date" : form.watched_date.value,
						"memo" : form.memo.value,
						"recordNo" : document.getElementById("record_no").value
					},
					dataType : "JSON",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {
						alert(data.res_msg);
						if(data.res_code == "200") {
							location.reload();
						}
					}
				})
			}
  		};
  		
  		const loadRecord = function(recordNo) {
  		    $.ajax({
  		        url: "/selectRecordOne",
  		        type: "post",
  		        data: { record_no: recordNo },
  		        dataType : "json",
  		      	contentType : "application/x-www-form-urlencoded; charset=UTF-8",
  		        success: function(data) {
  		            if (data.res_code == "200") {
  		                $('#search_movie').val(data.movieTitle);
  		                $('#selected_movie_id').val(data.movieNo);
  		                $('#watched_date').val(data.watchedDate);
  		                $('#memo').val(data.memo);
  		                
  		              	$('#exampleModalLabel').text('기록 수정');
  		              	$('#exampleModal .btn-primary').hide();  // 저장 버튼 숨기기
  	                	$('#exampleModal .btn-primary').next('button').show();  // 수정 버튼 표시
  	                	
  		                $('#exampleModal').modal('show');
  		                
  		            }
  		        },
  		        error: function(xhr) {
  		        	alert(xhr.responseText);
  		        }
  		    });
  		};
		
  		const deleteRecord = function() {
  			if(confirm("정말 삭제하시겠습니까?")) {
  				const deleteRecordNo = document.getElementById("delete_record_no");
  	  			$.ajax({
  	  				url : "/deleteRecord",
  	  				type : "post",
  	  				data : {"record_no" : deleteRecordNo.value},
  	  				dataType : "JSON",
  	  				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
  	  				success : function(data) {
  	  					alert(data.res_msg);
  	  					if(data.res_code == "200") {
  	  						location.reload();
  	  					}
  	  				},
  	  				error : function() {
  	  					alert("에러");
  	  				}
  	  			})
  			}
  		};
  		
  		$('#recordButton').click(function() {
  		    $('#exampleModalLabel').text('기록하기');
  		    
  		    $('#exampleModal .btn-primary').show();
  		    $('#exampleModal .btn-primary').next('button').hide();
  		    
  		    $('#search_movie').val('');
  		    $('#selected_movie_id').val('');
  		    $('#watched_date').val('');
  		    $('#memo').val('');
  		    
  		    $('#exampleModal').modal('show');
  		});
  		
	</script>
</body>
</html>
