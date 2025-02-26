<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<link href="/resources/css/include/allpage.css" rel="stylesheet" type="text/css">
</head>
<body id="body">
<%@ include file="/views/include/nav.jsp" %>
	${qna.qnaType }
	${qna.title }
	${qna.content }
	${qna.memberNo }
</body>
</html>