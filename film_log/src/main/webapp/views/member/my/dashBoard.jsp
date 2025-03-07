<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include/myMenuNav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.7.1.js"></script>
</head>
<body>
	<div class="container-sm">
		<br>
		<p class="text-center fs-1">대시보드</p>
		<p class="text-center fs-5">내가 관람한 영화 기록 통계</p>
		<br>
		<hr class="my-2" id="hr">
		<br>
	</div>
	<div class="container-sm">
    <!-- 첫 번째 그룹 (장르별 텍스트 + 차트) -->
    <div class="row text-center justify-content-between flex-md-row flex-column">
	    <div class="col-6 col-md-6">
	    	<div class="d-grid gap-2 d-md-flex justify-content-md-start">
	      		<div class="text-center fs-5">장르별</div>
	    	</div>
	      	<canvas id="myChart"></canvas>
	    </div>
	    <div class="col-6 col-md-6">
	    	<div class="d-grid gap-2 d-md-flex justify-content-md-start">
            	<div class="text-center fs-5">연도별</div>
        	</div>
        	<div class="d-flex align-items-center justify-content-center" style="height: 65vh;">
        	<canvas id="myBarChart"></canvas>
        	</div>
	    </div>
    </div> 
</div>

	<br>
	
	
	<script>
	
	$(function() {
		$.ajax({
			url : "/genreChart",
			type : "post",
			data : {},
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				const genres = data.genres;
			    
			    const labels = [];
			    const chartData = [];
			    
			    genres.forEach((genre, index) => {
			        labels.push(genre.name);
			        chartData.push(genre.count);
			    });
				
				const ctx = document.getElementById('myChart').getContext('2d');
				const myChart = new Chart(ctx, {
				    type: 'pie',  // 차트 종류 ('bar', 'line', 'pie' 등)
				    data: {
				        labels: labels,
				        datasets: [{
				            label: '갯수',
				            data: chartData,
				            backgroundColor: [
				            	'rgba(255, 99, 132, 0.5)',   // 빨강
				                'rgba(54, 162, 235, 0.5)',   // 파랑
				                'rgba(255, 206, 86, 0.5)',   // 노랑
				                'rgba(75, 192, 192, 0.5)',   // 청록
				                'rgba(153, 102, 255, 0.5)',  // 보라
				                'rgba(255, 159, 64, 0.5)',   // 주황
				                'rgba(255, 99, 255, 0.5)',   // 핑크
				                'rgba(54, 255, 99, 0.5)',    // 연두
				                'rgba(255, 186, 99, 0.5)',   // 연한 주황
				                'rgba(99, 132, 255, 0.5)',   // 연한 파랑
				                'rgba(192, 75, 192, 0.5)',   // 연한 청록
				                'rgba(255, 102, 204, 0.5)',  // 연한 핑크
				                'rgba(102, 255, 204, 0.5)',  // 연한 민트
				                'rgba(153, 204, 255, 0.5)',  // 연한 하늘색
				                'rgba(255, 102, 102, 0.5)',  // 연한 빨강
				                'rgba(255, 99, 64, 0.5)',    // 연한 주황2
				                'rgba(102, 204, 255, 0.5)',  // 연한 파랑2
				                'rgba(75, 255, 192, 0.5)',   // 연한 청록2
				                'rgba(255, 255, 102, 0.5)'   // 연한 노랑
				            ],
				            borderColor: [
				            	'rgba(255, 99, 132, 1)',   // 빨강
				                'rgba(54, 162, 235, 1)',   // 파랑
				                'rgba(255, 206, 86, 1)',   // 노랑
				                'rgba(75, 192, 192, 1)',   // 청록
				                'rgba(153, 102, 255, 1)',  // 보라
				                'rgba(255, 159, 64, 1)',   // 주황
				                'rgba(255, 99, 255, 1)',   // 핑크
				                'rgba(54, 255, 99, 1)',    // 연두
				                'rgba(255, 186, 99, 1)',   // 연한 주황
				                'rgba(99, 132, 255, 1)',   // 연한 파랑
				                'rgba(192, 75, 192, 1)',   // 연한 청록
				                'rgba(255, 102, 204, 1)',  // 연한 핑크
				                'rgba(102, 255, 204, 1)',  // 연한 민트
				                'rgba(153, 204, 255, 1)',  // 연한 하늘색
				                'rgba(255, 102, 102, 1)',  // 연한 빨강
				                'rgba(255, 99, 64, 1)',    // 연한 주황2
				                'rgba(102, 204, 255, 1)',  // 연한 파랑2
				                'rgba(75, 255, 192, 1)',   // 연한 청록2
				                'rgba(255, 255, 102, 1)'   // 연한 노랑
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				        responsive: true,  // 반응형 설정
				        scales: {
				        	x : {
				        		display : false,
				        	},
				            y: {
				                beginAtZero: true,
				                display : false
				            }
				        }
				    }
				});
				
				
			}
		})
	})
	
	$(function() {
		$.ajax({
			url : "/yearChart",
			type : "post",
			data : {},
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				
			}

		})
	})

const ctx2 = document.getElementById('myBarChart').getContext('2d');
const myBarChart = new Chart(ctx2, {
    type: 'bar',
    data: {
        labels: ['2020', '2021'],
        datasets: [{
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.5)',   // 빨강
                'rgba(54, 162, 235, 0.5)',   // 파랑
                'rgba(255, 206, 86, 0.5)',   // 노랑
                'rgba(75, 192, 192, 0.5)',   // 청록
                'rgba(153, 102, 255, 0.5)',  // 보라
                'rgba(255, 159, 64, 0.5)'    // 주황
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',   // 빨강
                'rgba(54, 162, 235, 1)',   // 파랑
                'rgba(255, 206, 86, 1)',   // 노랑
                'rgba(75, 192, 192, 1)',   // 청록
                'rgba(153, 102, 255, 1)',  // 보라
                'rgba(255, 159, 64, 1)'    // 주황
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                display: false  // 레전드 숨기기
            }
        },
        scales: {
            x: {
                beginAtZero: true
            },
            y: {
                beginAtZero: true
            }
        }
    }
});

	</script>
</body>
</html>