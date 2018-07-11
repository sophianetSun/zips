<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="./jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>집스 메인 홈입니다</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
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

	$(document).ready(function() {
		var id = '${userId}';
		if (id) {
			$.get('graphapi.zips', {
				id: id
			},
			function(data, status) {
				var ctx = document.getElementById("chart-area").getContext("2d");
				var chart = new Chart(ctx, {
					type : 'pie',
					data : {
						datasets : [{
								label: "",
								data: [
									data.carbohydrate, data.fat, data.protein
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
						responsive: false,
						title: {
					            display: true,
					            fontSize: 16,
					            text: '총 칼로리 : ' + data.calorie + ' kcal'
					    }
					}
				});
			});
		} else {
			$('#main_graph').html(
					'<div class="jumbotron"><h1>로그인 해주세요!</h1></div>'
			);
		}
		
		
	});
</script>
</head>
<body>
<!-- 홈트 -->
<div id="homeTraining" class="row">
	<div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
	<div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
	<div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
	<div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
	<div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
	<div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
</div>
<!-- 그래프 -->
<div id="main_graph" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#main_graph" data-slide-to="0" class="active"></li>
    <!--<li data-target="#main_graph" data-slide-to="1"></li>
    <li data-target="#main_graph" data-slide-to="2"></li>-->
  </ul>
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div id="canvas-holder">
		<canvas id="chart-area" class="mx-auto" width="500" height="500"></canvas>
	  </div>
    </div>
  </div>
	
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#main_graph" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#main_graph" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

<!-- 중고장터, 우수회원 -->
<div id="shop" class="row">
	<div class="col-sm-8">
		<h4 class="main_title">중고장터</h4>
		<table class="table table-striped">
		<tr><th>글쓴이</th><th>제목</th><th>날짜</th></tr>
		<c:forEach items="${shopList}" var="shop">
		<tr>
			<td>${shop.shop_seller_id}</td>
			<td><a href="shop/detail.zips?shop_no=${shop.shop_no}&pageNum=1">${shop.shop_subject}</a></td>	
			<td><fmt:formatDate value="${shop.shop_regdate}" pattern="YY/MM/dd"/></td>
		</tr>
		</c:forEach>
		</table>
	</div>
	<div class="col-sm-4">
		<ul class="list-group">
		<li class="list-group-item">우수회원</li>
		<li class="list-group-item list-group-item-success">
			별주부전 27000pt</li>
		<li class="list-group-item list-group-item-secondary">
			허주환 13722pt</li>
		<li class="list-group-item list-group-item-info">
			운동계의 집스 6729pt</li>
		<li class="list-group-item list-group-item-warning">
			운동계의 집스 6729pt</li>							
		<li class="list-group-item list-group-item-danger">
			운동계의 집스 6729pt</li>
		</ul>
	</div>
</div>

<!-- Before and After -->
<div class="row" style="margin-top: 18px;">
  <div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
	<div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
	<div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
	<div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
	<div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
	<div class="col-sm-4">
		<div class="fakeimg">Fake Image</div>
		<h5>오늘의 스쿼트</h5>
		<p>작성자 : 홍길동</p>
		<p>추천수 : 55</p>
	</div>
</div>

<!-- Etc Boards -->
<div class="row">
	<div class="col-sm-6">
		<h4 class="main_title">질문/답변</h4>
		<p>헬린이 입니다. 운동 3개월 제 몸매 어떤가요?</p>
		<p>닭가슴살 얼마나 먹어야 되나요?</p>
		<p>헬스 보충제 잘 모르겠네요. 뭐 먹어야 되죠?</p>
	</div>
	<div class="col-sm-6">
		<h4 class="main_title">자유게시판</h4>
		<p>오늘 멕시코 전...</p>
		<p>흥민이 불쌍함...</p>
		<p>신태용 지구를 떠나라!!</p>
	</div>
</div>

</body>
</html>