<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 삭제 화면</title>
</head>
<body>
<h2 align="center">중고 장터 상품 삭제 하기</h2>
<div class="container" align="center"> 
	<div class="alert alert-warning">
    	<strong> Warning! </strong> 정말로 ${sessionScope.loginUser.id} 회원님의 글 [ ${shop.shop_subject} ]을(를) 삭제하시겠습니까?
  	</div>	
<div align="center"></div>
	<form action="delete.zips?shop_no=${shop.shop_no}" method="post">
	<button type="submit" class="btn btn-primary">상품 삭제</button> 
	<input type="button" class="btn btn-primary" value="취소 하기" onclick="javascript:history.go(-1)">
	</form>
</div>	
</body>
</html>
