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
<table border="1" cellpadding="0" cellspacing="0">
	<tr><td rowspan="2">중고 장터</td><td colspan="2">${shop.shop_subject}</td><td>${shop.shop_regdate}</td></tr>
	<tr><td>${shop.shop_seller_id}</td><td>${shop.shop_price}</td><td>${shop.shop_status}</td></tr>
	<tr><td colspan="4"><table border="0" width="490" height="250">
			<tr><td>${shop.shop_content}</td></tr>
			</table>
		</td>
	</tr> 
	<tr>
		<td colspan="4" align="center" height="200px">
			<input type="button" class="btn btn-primary" value="구매 신청" onclick="location.href='deal.zips?shop_no=${shop.shop_no}&pageNum=${param.pageNum}'">
		</td>
	</tr>
	<tr>
	<td colspan="4" align="right">
	<c:if test="${shop.shop_seller_id == loginUser.id }">
	<input type="button" class="btn btn-primary" value="상품 수정" onclick="location.href='update.zips?shop_no=${shop.shop_no}&pageNum=${param.pageNum}'">
	<input type="button" class="btn btn-primary" value="상품 삭제" onclick="location.href='delete.zips?shop_no=${shop.shop_no}&pageNum=${param.pageNum}'">
	</c:if>
	<input type="button" class="btn btn-primary" value="상품 목록" onclick="location.href='list.zips?pageNum=${pageNum}'">
	</td></tr>
</table>
</div>
</body>
</html>
