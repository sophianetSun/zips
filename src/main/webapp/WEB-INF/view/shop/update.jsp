<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 수정 하기</title>
</head>
<body>
<h2 align="center"> 중고 장터 게시물 수정 </h2>
<div class="container">
    <form:form modelAttribute="shop" action="update.zips?shop_no=${param.shop_no}&pageNum=${param.pageNum}" method="post">
      <div class="form-group">
        <label for="subject">제목 <font color="red"><form:errors path="shop_subject" /></font> </label>
        <input type="text" class="form-control" id="subject" name="shop_subject" value="${shop.shop_subject}">
      </div>
      <div class="form-group">
        <label for="writer">작성자 <font color="red"><form:errors path="shop_seller_id" /></font> </label>
        <input type="text" class="form-control" id="writer" name="shop_seller_id" value="${loginUser.nickname}" readonly="readonly">
      </div>
      <div class="form-group">
        <label for="content">내용 <font color="red"><form:errors path="shop_content" /></font></label>
        <textarea class="form-control" id="content" name="shop_content" rows="3">${shop.shop_content}</textarea>
      </div>
      <div class="form-group">
        <label for="price">상품 가격 <font color="red"><form:errors path="shop_price" /></font></label>
        <input type="text" class="form-control" id="writer" name="shop_price" value="${shop.shop_price }">
      </div>
      <div class="form-group">
        <label for="file">상품 사진 첨부</label>
        <input type="file" class="form-control" id="file" name="file" multiple>
      </div>
 	<div id="preview"></div>
    </form:form>
	<input type="button" class="btn btn-primary" value="상품 수정" onclick="location.href='update.zips?pageNum=${pageNum}'">
	<input type="button" class="btn btn-primary" value="취소 하기" onclick="javascript:history.go(-1)">
</div>
</body>
</html>