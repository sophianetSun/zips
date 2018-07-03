<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 보기</title>
</head>
<body> 
<h2 align="center">중고 장터 상품 보기</h2>
<div class="container" align="center">
<div>
	<h2>판매자 정보</h2>
	<hr>
	${shop.shop_seller_id }
</div>
<div>
	<h2>구매자 정보</h2>
	<hr>
	${loginUser.id }
</div>


	<form action="dealpage.zips?shop_no=${shop.shop_no}&pageNum=${param.pageNum}" method="post">
<div>
	<h2>가격</h2>
	<hr>
	${shop.shop_price }
	<br>
	<div class="form-group">
        <label for="coin">입력 가격</label>
        <input type="text" class="form-control" style="width: 20%" id="coin" name="coin" placeholder="가격을 입력하세요.">
    </div>
</div>
<div>
	<input type="submit" class="btn btn-primary" value="구매 신청">
	<input type="button" class="btn btn-primary" value="취소 하기" onclick="javascript:history.go(-1)">
</div>
	</form>
<div>
	<input type="button" class="btn btn-primary" value="상품 목록" onclick="location.href='list.zips?pageNum=${pageNum}'">
</div>	
</div>
</body>
</html>
