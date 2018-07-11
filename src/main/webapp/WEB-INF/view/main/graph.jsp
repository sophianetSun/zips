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
<div id="canvas-holder" style="width:70%">
	<canvas id="chart-area" width="200" height="200"></canvas>
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
	var config = {
		type : 'pie',
		data : {
			datasets : [{
					label: "",
					data: [
						'${map.carbohydrate}', '${map.fat}', '${map.protein}'
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