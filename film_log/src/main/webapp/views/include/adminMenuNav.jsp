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
    <a class="navbar-brand" href="/">
    <img src="<c:url value='/resources/images/filmLog.png'/>" alt="필름 로그" height="50">
	</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor03">
      <div class="justify-content-center">
      <ul class="navbar-nav me-auto">
        <!-- <li class="nav-item"><a class="nav-link active" href="/">홈<span class="visually-hidden">(current)</span></a></li> -->
        <li class="nav-item"><a class="nav-link" href="/qnaList">1:1 문의 목록 조회</a></li>
        <li class="nav-item"><a class="nav-link" href="#">회원 목록 조회</a></li>
        <li class="nav-item"><a class="nav-link" href="/selectMovieList">전체 영화 목록 조회</a></li>
        <li class="nav-item"><a class="nav-link active" href="/memberLogout">로그아웃</a></li>
        <li></li>
        <li class="nav-item">
        </li>
        <li class="nav-item">
        </li>
      </ul>
      </div>
    </div>
  </div>
</nav>
<script src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>