<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 보기</title>
</head>
<body>

	<div class="blog-post">
		<h2 class="blog-post-title">${shop.shop_subject}</h2>
		<p class="blog-post-meta">
			<fmt:formatDate value="${shop.shop_regdate}"
				pattern="yyyy-MM-dd HH:mm" />
		</p>
		<hr>
		<div align="right">
			<small>작성자 :${shop.shop_seller_id}</small>
			<br>
			<br> 
			<br>
		</div>
		<blockquote>
			<div align="center">&nbsp;
				<c:forEach var="file" items="${uploadFileList}">
					<div>
						<img src="../shopfile/${file.filename}" width="500px" height="250px">
					</div>
				</c:forEach>
			</div>
		</blockquote>
		<br> <br>
		<h3>상품 설명</h3>
		<br>
		<p>구매 포인트 : ${shop.shop_price}</p>
		<p>${shop.shop_content}</p>
		
		<div align="center" style="height: 100px;">
			<!-- 판매자 아이디 != 로그인 유저 아이디 -->
			<c:if test="${shop.shop_seller_id != loginUser.id }">
				<c:if test="${empty shop.shop_buyer_id}">
					<button type="button" class="btn btn-sm btn-outline-primary"
						style="width: 100px; height: 50px; font-weight: bold;"
						onclick="location.href='deal.zips?shop_no=${shop.shop_no}'">
						구매 신청
					</button>
				</c:if>
			</c:if>
		</div>
		<hr>
		<div align="right">
			<c:if test="${shop.shop_seller_id == loginUser.id }">
				<button type="button" class="btn btn-sm btn-outline-danger"
					style="width: 100px; height: 50px;"
					onclick="location.href='update.zips?shop_no=${shop.shop_no}'">
					상품 수정
				</button>
				<button type="button" class="btn btn-primary" 
					onclick="location.href='delete.zips?shop_no=${shop.shop_no}'">
					상품 삭제
				</button>
			</c:if>
			<button type="button" class="btn btn-primary"
				onclick="location.href='list.zips'">
				상품 목록
			</button>
			<br> 
			<br>
		</div>
	</div>
	
</body>
</html>
