<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
<link href="/resources/css/sideBar/sideBar.css" rel="stylesheet" type="text/css">
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
<%@ include file="/views/include/nav.jsp" %>

<div class="offcanvas offcanvas-start bg-dark text-white" tabindex="-1" id="sidebar" style="width: 250px;">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title">관리자 메뉴</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body d-flex flex-column">
        <ul class="nav flex-column flex-grow-1">
            <li class="nav-item"><a class="nav-link text-white" href="#">1:1 문의 목록 조회</a></li>
            <li class="nav-item"><a class="nav-link text-white" href="#">회원 목록 조회</a></li>
            <li class="nav-item"><a class="nav-link text-white" href="#">전체 영화 목록 조회</a></li>
            <li class="nav-item"><a class="nav-link text-white" href="#">영화 추가</a></li>
            <li class="nav-item"><a class="nav-link text-white" href="#">영화 수정</a></li>
            <li class="nav-item"><a class="nav-link text-white" href="#">영화 삭제</a></li>
        </ul>
        
        <a href="/memberLogout">로그아웃</a>
    </div>
</div>

<div class="position-fixed bottom-0 start-0 p-2">
    <button id="sidebar_button" class="btn btn-secondary" data-bs-toggle="offcanvas" data-bs-target="#sidebar">
        <i class="fa-solid fa-arrow-right fa-lg"></i>
    </button>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<script src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
</body>
</html>
