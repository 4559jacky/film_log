<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.filmlog.member.model.vo.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value='/resources/js/jquery-3.7.1.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<c:set var="member" value="${member}"/>
<nav class="navbar navbar-expand-lg bg-light" data-bs-theme="light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">필름 로그</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor03">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">Home
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
            <li><a class="dropdown-item" href="#">1:1 문의 목록 조회</a></li>
            <li><a class="dropdown-item" href="#">회원 목록 조회</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">전체 영화 목록 조회</a></li>
            <li><a class="dropdown-item" href="#">영화 추가</a></li>
            <li><a class="dropdown-item" href="#">영화 수정</a></li>
            <li><a class="dropdown-item" href="#">영화 삭제</a></li>
          </ul>
        </li>
        	</c:when>
        	<c:when test="${member.adminWhether == 'F' }">
        		<li class="nav-item">
		          <a class="nav-link" href="/myPass">마이 페이지</a>
		        </li>
        	</c:when>
        </c:choose>
      </ul>
      <!-- <form class="d-flex">
        <input class="form-control me-sm-2" type="search" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form> -->
    </div>
  </div>
</nav>
<script src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>