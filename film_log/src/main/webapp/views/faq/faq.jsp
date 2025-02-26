<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/resources/css/include/allpage.css" rel="stylesheet" type="text/css">
<script src="<c:url value='/resuorces/js/jquery-3.7.1.js'/>"></script>
</head>
<body>
<%@ include file="/views/include/nav.jsp" %>
<br>
<div class="container-sm">
<p class="text-center fs-1">FAQ</p>
<br>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
<c:if test="${isAdmin == 'F'}">
<button type="button" class="btn btn-secondary" onclick="window.location.href='/writeQna'">1:1 문의하기</button>
</c:if>
</div>
<hr class="my-2" id="hr">
<br>
</div>
  <div class="container-sm">
<div class="accordion" id="accordionExample">
  <c:forEach var="faq" items="${faqList}" varStatus="status">
    <div class="accordion-item">
        <h2 class="accordion-header" id="heading${status.index}">
            <button class="accordion-button collapsed"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapse${status.index}"
                    aria-expanded="false"
                    aria-controls="collapse${status.index}">
                ${faq.title}
            </button>
        </h2>
        <div id="collapse${status.index}" class="accordion-collapse collapse"
             aria-labelledby="heading${status.index}" 
             data-bs-parent="#accordionExample">
            <div class="accordion-body">
                ${faq.content}
            </div>
        </div>
    </div>
  </c:forEach>
</div>

</div>
<script>
	$(function() {
		$('#personalQnA').click(function {
			$.ajax({
				
			})		
		})
	}
</script>
<script src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
</body>
</html>
