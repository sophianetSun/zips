<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 영양 정보 그래프</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
</head>
<body>
<div class="card">
<div class="card-header">${sessionScope.loginUser.nickname } 님의 
	<fmt:parseDate value="${param.regdate }" pattern="yyyy-MM-dd" var="selectedDate"/>
	<fmt:formatDate value="${selectedDate }" pattern="yyyy년 MM월 dd일"/>
	영양 섭취 정보입니다.</div>
	<div id="canvas-holder" class="mx-auto" style="width:70%">
		<canvas id="chart-area" width="200" height="200"></canvas>
	</div>
<div class="card-footer">
	<c:forEach items="${words }" var="word">
		<p class="card-text">${word }</p>
	</c:forEach>
</div>
</div>
<script>
	var randomColorFactor = function() {
		return Math.round(Math.random() * 255);
	};
	var randomColor = function(opacity) {
		return "rgba(" + randomColorFactor() + "," 
		 					+ randomColorFactor() + ","
		 					+ randomColorFactor() + ","
		 					+ (opacity || '.3') + ")";
	};
	var carbohydrate = ${map.carbohydrate}.toFixed(1);
	var fat = ${map.fat}.toFixed(1);
	var protein = ${map.protein}.toFixed(1);
	var config = {
		type : 'pie',
		data : {
			datasets : [{
					label: "",
					data: [
						carbohydrate, fat, protein
						],
					backgroundColor: [
						randomColor(1), randomColor(1), randomColor(1)
						],
				}],
			labels: [
				'탄수화물', '지방', '단백질'
			]
		},
		options: {
			responsive: true,
			title: {
		            display: true,
		            fontSize: 16,
		            text: '총 칼로리 : ' + '${map.calorie} kcal'
		    }
		}
	};
	
	window.onload = function() {
		var ctx = document.getElementById("chart-area").getContext("2d");
		window.myPid = new Chart(ctx, config);
	}
</script>
</body>
</html>