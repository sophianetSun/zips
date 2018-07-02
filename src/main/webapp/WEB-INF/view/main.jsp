<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="./jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>집스 메인 홈입니다</title>
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
<div class="jumbotron">
  <h1 style="height:350px;">그래프 들어감</h1> 
</div>

<!-- 중고장터, 우수회원 -->
<div id="shop" class="row">
	<div class="col-sm-8">
		<h4 class="main_title">중고장터</h4>
		<table>
		<tr><th>제목</th><th>글쓴이</th><th>날짜</th></tr>
		<c:forEach items="${shopList}" var="shop">
		<tr>
			<td><a href="detail.zips?shop_no=${shop.shop_no}&pageNum=${pageNum}">${shop.shop_subject}</a></td>	
			<td>${shop.shop_seller_id}</td>
			<td>${shop.shop_regdate}</td>
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
<div class="row" style="margin-top: 12px; background-color: #00ff00;">
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