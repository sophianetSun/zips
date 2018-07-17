<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색 결과 뷰</title>
<script src="${pageContext.request.contextPath }/js/jquery.awesomeCloud-0.2.js"></script>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<style>
	.wordcloud {
		border : 1px solid #036;
		width : 6in;
		height : 6in;
		margin : 0.5in auto;
		padding : 0;
		page-break-after : always;
		page-break-inside : avoid;
	}
</style>
</head>
<body>
<c:if test="${empty pageNum }"><c:set var="pageNum" value="1" /></c:if>
<div id="wordcloud1" class="wordcloud">
	<c:forEach items="${map}" var="m">
		<span data-weight="${m.value }">${m.key }</span>
	</c:forEach>
</div>
<script>
		$(document).ready(function() {
			$("#wordcloud1").awesomeCloud({
				"size" : {"grid" : 9,"factor" : 0},
				"options" : {"color" : "random-dark",
					"rotationRatio" : 0.35},
				"font" : "'Times New Roman', Times, serif", 
				"shape" : "circle"	
			})
		});
</script>
<!-- 검색결과 보드 -->
<div class="container mt-3">
<table class="table table-dark table-hover">
	<thead>
		<tr>
			<th>카테고리</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${boardSearchResult }" var="bodRes">
			<tr onclick="location.href='board/totallistForm.zips?num=${bodRes.num
				}&pageNum=${pageNum }&board_type=${bodRes.board_type}'" style="cursor:pointer">
				<td>
					<c:choose>
					<c:when test="${bodRes.board_type == 1 }">홈트레이닝</c:when>
					<c:when test="${bodRes.board_type == 2 }">질문게시판</c:when>
					<c:when test="${bodRes.board_type == 3 }">자유게시판</c:when>
					<c:when test="${bodRes.board_type == 4 }">비포앤에프터</c:when>
					<c:otherwise></c:otherwise>
					</c:choose>
				</td>
				<td class="searchResult">${bodRes.subject }</td>
				<td class="searchResult">${bodRes.content }</td>
				<td class="searchResult">${bodRes.board_userid }</td>
				<td><fmt:formatDate value="${bodRes.regdate }" pattern="yyyy-MM-dd HH:mm"/></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<!-- 장터 검색 결과 -->
<div class="card bg-primary text-white">
   	<div class="card-body"><h4>장터 검색 결과</h4></div>
</div>
<table class="table table-dark table-hover mt-3">
	<thead>
		<tr>
			<th>카테고리</th>
			<th>제목</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${shopSearchResult }" var="shopRes">
			<tr onclick="location.href='shop/detail.zips?shop_no=${shopRes.shop_no}&pageNum=${pageNum }'" 
				style="cursor:pointer">
				<td>중고장터</td>
				<td class="searchResult">${shopRes.shop_subject }</td>
				<td class="searchResult">${shopRes.shop_content}
				<c:choose>
					<c:when test="${shopRes.shop_status == 0}">
						<span class="badge badge-primary float-right">판매중</span></c:when>
					<c:when test="${shopRes.shop_status == 1}">
						<span class="badge badge-info float-right">거래중</span></c:when>
					<c:otherwise>
						<span class="badge badge-danger float-right">판매완료</span></c:otherwise>
				</c:choose>
				</td>
				<td><fmt:formatDate value="${shopRes.shop_regdate }" pattern="yyyy-MM-dd HH:mm"/></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<script>
	var contents = document.getElementsByClassName("searchResult");
	for (var idx in contents) {
		var content = contents[idx].innerHTML;
		if (typeof(content) == 'string' && content.search("${param.query }") >= 0) {
			contents[idx].innerHTML = content.replace("${param.query }", 
					"<span style='background-color:tomato;'>${param.query }</span>");
		} 
	}
	
</script>

</body>
</html>