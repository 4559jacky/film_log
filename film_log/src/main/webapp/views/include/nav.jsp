<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="<c:url value='/resources/js/jquery-3.7.1.js'/>"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light" data-bs-theme="light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
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
          <a class="nav-link" href="#">리뷰게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">자유게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/faq">FAQ</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="/memberLoginPass">로그인</a>
        </li>
      </ul>
      <!-- <form class="d-flex">
        <input class="form-control me-sm-2" type="search" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form> -->
    </div>
  </div>
</nav>
<script src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
</body>
</html>