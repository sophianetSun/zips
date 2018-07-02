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
<h2 align="center">중고 장터 상품 상세 보기</h2>
<div class="container">
<table>
	<tr><td>상품 제목</td><td>${shop.shop_subject}</td></tr>
	<tr><td>등록일</td><td>${shop.shop_regdate}</td></tr>
	<tr><td>판매 회원 정보</td><td>${shop.shop_seller_id}</td></tr>
	<tr><td>상품 내용</td>
		<td><table border="0" width="490" height="250">
			<tr><td>${shop.shop_content}</td></tr>
			</table>
		</td>
	</tr>
	<tr>
	<td colspan="2" align="center">
	<form action="delete.zips?shop_no=${shop.shop_no}&pageNum=${param.pageNum}" method="post">
		<input type="hidden" name="shop_no" value="${param.shop_no}" />
		<input type="hidden" name="pageNum" value="${param.pageNum}"/>
	<button type="submit" class="btn btn-primary">상품 삭제</button> 
	<input type="button" class="btn btn-primary" value="취소 하기" onclick="javascript:history.go(-1)">
	</form>
	</td></tr>
</table>
</div>
</body>
</html>
