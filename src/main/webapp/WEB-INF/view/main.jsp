<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="./jspHeader.jsp" %>
<!DOCTYPE html>
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

function parseGraph() {
	console.log("그래프 실행");
	$.get('parsegraph.zips', {
		
	}, function(res) {
		console.log(res);
	})	
}

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
								(data.carbohydrate).toFixed(1), (data.fat).toFixed(1), (data.protein).toFixed(1)
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
<ul><li><p class="testred test"><I><span>Best Hot 동영상&nbsp;3&nbsp;&nbsp;</span></I></p></li></ul>
<div id="bestTraining" class="row">
	<!-- Best Top 3 -->
	<c:forEach items="${bestTraining}" var="best">
	<div class="col-sm-4 test">
	<div class="card mb-4 box-shadow">
		<video width="docWidth" height="174" class="video-js" controls>
 	 	<source src="${pageContext.request.contextPath }/img/${best.fileurl}" type="video/mp4"></video>
		<div class="card-body">
        	<p class="card-text">&nbsp;&nbsp;<a href="board/homeTraininglistForm.zips?num=${best.num}&pageNum=${pageNum}&board_type=${best.board_type}">
                   ${best.subject }</a></p>
			<hr>
            <div class="d-flex justify-content-between align-items-center">
				<small class="text-muted"><c:if test="${best.moddate != null }">등록일 :<fmt:formatDate value="${best.moddate}" pattern="yyyy-MM-dd-HH:mm"/></c:if>
				<c:if test="${best.moddate == null }"><fmt:formatDate value="${best.regdate}" pattern="yyyy-MM-dd-HH:mm"/></c:if>
				<br>
				작성자 :${best.board_userid}
				<br>
				조회수 :${best.board_count} 
				<br></small>
			</div>
			<div class="btn-group">
            	<button type="submit" class="best btn btn-sm btn-outline-primary" style="width: 72px;height: 27px;" disabled="disabled"><small>추천 <font color="red">♥
                <span class="badge badge-light">&nbsp;${best.recommand}</span></font></small></button>
				<button type="button" class="btn btn-sm btn-outline-danger" style="width: 72px;height: 27px;" disabled="disabled"><small>▶ 구독 <font color="red"></font></small></button>
			</div>
		</div>
	</div>
	</div>
	</c:forEach>
</div>
<div class="card bg-info text-white mt-3">
   	<div class="card-body"><h4>최신 홈트 영상</h4></div>
</div>
<div id="homeTraining" class="row" style="margin-top:16px;">
	<!-- Training Board -->
	<c:forEach items="${homeTraining}" var="homeT">
	<div class="col-sm-4">
	<div class="card mb-4 box-shadow">
		<video width="docWidth" height="174" class="video-js" controls>
 	 	<source src="${pageContext.request.contextPath }/img/${homeT.fileurl}" type="video/mp4"></video>
		<div class="card-body">
        	<p class="card-text">&nbsp;&nbsp;<a href="board/homeTraininglistForm.zips?num=${homeT.num}&pageNum=${pageNum}&board_type=${homeT.board_type}">
                   ${homeT.subject }</a></p>
			<hr>
            <div class="d-flex justify-content-between align-items-center">
				<small class="text-muted"><c:if test="${homeT.moddate != null }">등록일 :<fmt:formatDate value="${homeT.moddate}" pattern="yyyy-MM-dd-HH:mm"/></c:if>
				<c:if test="${homeT.moddate == null }"><fmt:formatDate value="${homeT.regdate}" pattern="yyyy-MM-dd-HH:mm"/></c:if>
				<br>
				작성자 :${homeT.board_userid}
				<br>
				조회수 :${homeT.board_count} 
				<br></small>
			</div>
			<div class="btn-group">
            	<button type="submit" class="homeT btn btn-sm btn-outline-primary" style="width: 72px;height: 27px;" disabled="disabled"><small>추천 <font color="red">♥
                <span class="badge badge-light">&nbsp;${homeT.recommand}</span></font></small></button>
				<button type="button" class="btn btn-sm btn-outline-danger" style="width: 72px;height: 27px;" disabled="disabled"><small>▶ 구독 <font color="red"></font></small></button>
			</div>
		</div>
	</div>
	</div>
	</c:forEach>
</div>
<!-- 그래프 -->
<div id="main_graph" class="carousel slide bg-light border" data-ride="carousel"> 
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <div id="canvas-holder">
		<canvas id="chart-area" class="mx-auto" width="500" height="500"></canvas>
	  </div>
    </div>
  </div>
</div>

<!-- 중고장터, 우수회원 -->
<div id="shop" class="row" style="margin-top: 12px;">
	<div class="col-sm-8">
		 <div class="card bg-dark text-white">
   		 	<div class="card-body"><b>중고장터</b></div>
  		 </div>
		<table class="table table-striped table-hover border">
		<tr><th>글쓴이</th><th>제목</th><th>날짜</th></tr>
		<c:forEach items="${shopList}" var="shop">
		<tr onclick="location.href = 'shop/detail.zips?shop_no=${shop.shop_no}&pageNum=1'"
			style="cursor:pointer">
			<td class="w-25">${shop.shop_seller_id}</td>
			<td class="w-50">${shop.shop_subject}
			<c:choose>
				<c:when test="${shop.shop_status == 0}">
					<span class="badge badge-primary float-right">판매중</span></c:when>
				<c:when test="${shop.shop_status == 1}">
					<span class="badge badge-info float-right">거래중</span></c:when>
				<c:otherwise>
					<span class="badge badge-danger float-right">판매완료</span></c:otherwise>
			</c:choose>
			</td>	
			<td class="w-25"><fmt:formatDate value="${shop.shop_regdate}" pattern="MM월dd일 HH시mm분"/></td>
		</tr>
		</c:forEach>
		</table>
	</div>
	<div class="col-sm-4">
		<ul class="list-group">
		<li class="list-group-item">우수회원</li>
		<c:forEach items="${topUserList}" var="topUser" varStatus="stat">
		<c:choose>
		<c:when test="${stat.index == 0}">
			<li class="list-group-item list-group-item-success">
				<span class="float-left">${topUser.nickname }</span>
				<span class="float-right">${topUser.point }</span></li>
		</c:when>
		<c:when test="${stat.index == 1}">
			<li class="list-group-item list-group-item-primary">
				<span class="float-left">${topUser.nickname }</span>
				<span class="float-right">${topUser.point }</span></li></c:when>
		<c:when test="${stat.index == 2}">
			<li class="list-group-item list-group-item-info">
				<span class="float-left">${topUser.nickname }</span>
				<span class="float-right">${topUser.point }</span></li></c:when>
		<c:when test="${stat.index == 3}">
			<li class="list-group-item list-group-item-warning">
				<span class="float-left">${topUser.nickname }</span>
				<span class="float-right">${topUser.point }</span></li></c:when>
		<c:otherwise><li class="list-group-item list-group-item-danger">
				<span class="float-left">${topUser.nickname }</span>
				<span class="float-right">${topUser.point }</span></li></c:otherwise>
		</c:choose>
		</c:forEach>
		</ul>
	</div>
</div>

<!-- Before and After -->
<div>
<div class="card bg-primary text-white">
    <div class="card-body"><h4>Before &amp; After</h4></div>
</div>
   	<table class="table table-bordered table-hover mt-2">
    	<thead>
    		<tr>
    			<th class="w-50">제목</th>
    			<th class="w-10">글쓴이</th>
    			<th class="w-20">날짜</th>
    			<th class="w-10">조회수</th>
    			<th class="w-10">추천수</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${beforeAndAfter }" var="bna">
    		<tr onclick="location.href='board/totallistForm.zips?num=${bna.num}&pageNum=1&board_type=${bna.board_type}'"
				style="cursor:pointer">
    			<td>${bna.subject }</td>
    			<td>${bna.board_userid }</td>
    			<td><fmt:formatDate value="${bna.regdate }" pattern="yyyy-MM-dd HH:mm"/></td>
    			<td>${bna.board_count }</td>
    			<td>${bna.recommand }</td>
    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
</div>

<!-- Etc Boards -->
<div class="row">
	<div class="col-sm-6">
		<div class="list-group list-group-flush">
		<a class="list-group-item list-group-item-primary"><h5>질문/답변</h5></a>
			<c:forEach items="${qna}" var="q">
				<a href="board/totallistForm.zips?num=${q.num}&pageNum=1&board_type=${q.board_type}" 
					class="list-group-item list-group-item-action">${q.subject }
					<c:if test="${q.board_apply == 0}">
					<span class="badge badge-danger float-right">고민중</span></c:if>
					<c:if test="${q.board_apply == 1}">
					<span class="badge badge-primary float-right">고민해결</span></c:if>
					</a>
			</c:forEach>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="list-group list-group-flush">
			<a class="list-group-item list-group-item-warning"><h5>자유게시판</h5></a>
			<c:forEach items="${freeboard }" var="f">
				<a href="board/totallistForm.zips?num=${f.num}&pageNum=1&board_type=${f.board_type}" 
					class="list-group-item list-group-item-action">${f.subject }
					<span class="badge badge-info float-right">${f.board_count }</span></a>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>