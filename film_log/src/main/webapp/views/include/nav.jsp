<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.filmlog.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value='/resources/js/jquery-3.7.1.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<c:set var="member" value="${member}"/>
<nav class="navbar navbar-expand-lg bg-light" data-bs-theme="light" style="height : 80px;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">필름 로그</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor03">
      <div class="justify-content-center">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/">홈
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/movieList">영화목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/reviewBoardList">리뷰게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">자유게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/faq">FAQ</a>
        </li>
        <c:choose>
        	<c:when test="${empty member}">
        		<li class="nav-item">
		          <a class="nav-link" href="/memberLoginPass">로그인</a>
		        </li>
        	</c:when>
        	<c:when test="${member.adminWhether == 'T' }">
        		 <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            관리자 메뉴
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="/qnaList">1:1 문의 목록 조회</a></li>
		            <li><a class="dropdown-item" href="#">회원 목록 조회</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="/selectMovieList">전체 영화 목록 조회</a></li>
		            <li><a class="dropdown-item" href="/MovieInsertPass">영화 추가</a></li>
		            <li><a class="dropdown-item" href="#">영화 수정</a></li>
		            <li><a class="dropdown-item" href="#">영화 삭제</a></li>
		            <li><a class="dropdown-item" href="/memberLogout">로그아웃</a></li>
		          </ul>
		        </li>
        	</c:when>
        	<c:when test="${member.adminWhether == 'F' }">
        		<li class="nav-item dropdown">
				  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMyMenu" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				    My 메뉴
				  </a>
				  <ul class="dropdown-menu" aria-labelledby="navbarDropdownMyMenu">
				    <li><a class="dropdown-item" href="#">대시보드</a></li>
				    <li><a class="dropdown-item" href="#">내가 쓴 리뷰</a></li>
				    <li><a class="dropdown-item" href="#">내가 쓴 게시물</a></li>
				    <li><a class="dropdown-item" href="#">영화 관람 기록하기</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item" href="#">좋아요한 리뷰</a></li>
				    <li><a class="dropdown-item" href="#">좋아요한 게시글</a></li>
				    <li><a class="dropdown-item" href="#">좋아요한 영화</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item" href="/memberPwdChangePass?memberNo=${member.memberNo}">비밀번호 변경</a></li>
				    <li><a class="dropdown-item" id="memberInfo" href="/memberInfoChangePass?memberNo=${member.memberNo}">개인정보 수정</a></li>
				    <li><a class="dropdown-item" href="/myQnaList">문의 내역</a></li>
				    <li><a class="dropdown-item" href="/memberDeletePass">회원 탈퇴</a></li>
				    <li><a class="dropdown-item" href="/memberLogout">로그아웃</a></li>
				  </ul>
				</li>
        	</c:when>
        </c:choose>
      </ul>
      </div>
    </div>
  </div>
</nav>
<script src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
