<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>운동 정보 그래프</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
</head>
<body>
<div class="card">
<div class="card-header">${sessionScope.loginUser.nickname } 님의 
	<fmt:parseDate value="${param.regdate }" pattern="yyyy-MM-dd" var="selectedDate"/>
	<fmt:formatDate value="${selectedDate }" pattern="yyyy년 MM월 dd일"/>
	운동 정보입니다.</div>
	<div id="canvas-holder" class="mx-auto" style="width:75%">
		<canvas id="canvas"></canvas>
	</div>
<div class="card-footer">
	<c:forEach items="${words }" var="word">
		<p class="card-text">${word }</p>
	</c:forEach>
</div>
</div>
<script>
	var regdateList = [<c:forEach items="${list}" var='info'>'${info.regdate}',</c:forEach>];
	console.log(regdateList);
	var dataList = [<c:forEach items="${list}" var='info'>'${info.calorie}',</c:forEach>];
	console.log(dataList);
	var randomScalingFactor = function() {
		return Math.round(Math.random() * 100);
	};
	
	var randomColorFactor = function() {
		return Math.round(Math.random() * 255);
	};
	var randomColor = function(opacity) {
		return "rgba(" + randomColorFactor() + "," 
		 					+ randomColorFactor() + ","
		 					+ randomColorFactor() + ","
		 					+ (opacity || '.3') + ")";
	};
	
	var config = {
		type : 'line',
		data : {
			labels: regdateList,
			datasets: [{
				label : "나의 운동량",
				backgroundColor: randomColor(1),
				borderColor: randomColor(1),
				data : dataList,
				fill : false
			}]
		},
		options : {
			responsive: true,
			title: {
				display: true,
				text: '운동량 그래프'
			},
			tooltips: {
				mode: 'index',
				intersect: false,
			},
			hover: {
				mode: 'nearest',
				intersect: true
			},
			scales: {
				xAxes: [{
					display: true,
					scaleLabel: {
						display: true,
						labelString: '날짜'
					}
				}],
				yAxes: [{
					display: true,
					scaleLabel: {
						display: true,
						labelString: 'Value'
					},
					/* ticks: {
						min: 0,
						max: 2000,

						// forces step size to be units
						stepSize: 500
					} */
				}]
			}	
		}
	};
	
	window.onload = function() {
		var ctx = document.getElementById('canvas').getContext('2d');
		window.myLine = new Chart(ctx, config);
	};
</script>
</body>
</html>