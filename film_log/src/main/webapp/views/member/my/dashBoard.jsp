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
    <!-- 첫 번째 그룹 (장르별 차트 + 년도별 차트, 월별 차트) -->
    <div class="row text-center justify-content-between flex-md-row flex-column">
        <div class="col-12 col-md-6"> <!-- 장르별 차트 -->
            <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                <div class="text-center fs-5">장르별</div>
            </div>
            <canvas id="myChart" class="w-100"></canvas>
        </div>

        <!-- 두 번째 그룹 (년도별 차트 + 월별 차트) -->
        <div class="col-12 col-md-6">
            <!-- 년도별과 월별 차트를 세로로 배치 -->
            <div class="row">
                <div class="col-12">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                        <div class="text-center fs-5">연도별</div>
                    </div>
                    <div class="d-flex align-items-center justify-content-center">
                        <canvas id="myBarChart" class="w-100"></canvas>
                    </div>
                <div class="col-12">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                        <div class="text-center fs-5">월별</div>
                    </div>
                    <div class="d-flex align-items-center justify-content-center">
                        <canvas id="myLineChart" class="w-100" height="200"></canvas>
                    </div>
                </div>
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
				    type: 'pie',
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
				        responsive: true,
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
				const years = data.years;
			    
			    const labels = [];
			    const chartData = [];
			    
			    years.forEach((year, index) => {
			        labels.push(year.year);
			        chartData.push(year.count);
			    });
			    
			    const ctx2 = document.getElementById('myBarChart').getContext('2d');
			    const myBarChart = new Chart(ctx2, {
			        type: 'bar',
			        data: {
			            labels: labels,
			            datasets: [{
			                data: chartData,
			                backgroundColor: [
			                	'rgba(255, 50, 80, 0.7)',    // 진한 빨강
			                    'rgba(0, 102, 204, 0.7)',    // 짙은 파랑
			                    'rgba(255, 140, 40, 0.7)',   // 진한 노랑
			                    'rgba(30, 150, 110, 0.7)',   // 짙은 민트
			                    'rgba(120, 30, 200, 0.7)',   // 진한 보라
			                    'rgba(255, 80, 0, 0.7)',     // 진한 주황
			                    'rgba(255, 50, 120, 0.7)',   // 진한 핑크
			                    'rgba(0, 150, 50, 0.7)',     // 짙은 연두
			                    'rgba(255, 100, 0, 0.7)',    // 짙은 주황
			                    'rgba(0, 80, 200, 0.7)'      // 짙은 파랑2
			                ],
			                borderColor: [
			                	'rgba(255, 50, 80, 1)',    // 진한 빨강
			                    'rgba(0, 102, 204, 1)',    // 짙은 파랑
			                    'rgba(255, 140, 40, 1)',   // 진한 노랑
			                    'rgba(30, 150, 110, 1)',   // 짙은 민트
			                    'rgba(120, 30, 200, 1)',   // 진한 보라
			                    'rgba(255, 80, 0, 1)',     // 진한 주황
			                    'rgba(255, 50, 120, 1)',   // 진한 핑크
			                    'rgba(0, 150, 50, 1)',     // 짙은 연두
			                    'rgba(255, 100, 0, 1)',    // 짙은 주황
			                    'rgba(0, 80, 200, 1)'      // 짙은 파랑2
			                ],
			                borderWidth: 1
			            }]
			        },
			        options: {
			            responsive: true,
			            plugins: {
			                legend: {
			                    display: false
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
			},
			error : function() {
				alert("에러");
			}

		})
	})
	
$(function() {
    $.ajax({
        url: "/monthChart",
        type: "post",
        data: {},
        dataType: "json",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        success: function(data) {
            const months = data.month;

            const labels = [];
            const chartData = [];

            months.forEach((month) => {
                labels.push(month.month);
                console.log(month.month);
                chartData.push(month.count);
                console.log(month.count);
            });

            const ctx3 = document.getElementById('myLineChart').getContext('2d');
            const myLineChart = new Chart(ctx3, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: '관람한 영화 수',
                        data: chartData,
                        borderColor: 'rgba(75, 192, 192, 1)',
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        fill: true,
                        tension: 0.1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false
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
        },
        error: function() {
            alert("차트 데이터 로딩에 실패했습니다.");
        }
    });
})

	</script>
</body>
</html>