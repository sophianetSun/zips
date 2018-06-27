<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>중고 장터 물품 등록</title>
</head>
<body>
<h2 align="center"> 중고 장터 게시물 작성 </h2>
<div class="container">
    <form action="/insertProc" method="post">
      <div class="form-group">
        <label for="subject">제목</label>
        <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요.">
      </div>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" id="writer" name="writer" placeholder="내용을 입력하세요.">
      </div>
      <div class="form-group">
        <label for="content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="3"></textarea>
      </div>
      <button type="submit" class="btn btn-primary">작성</button>
    </form>
</div>

</body>
</html>

<%-- <form:form modelAttribute="item" action="register.zips" enctype="multipart/form-data">
	<h2>중고 장터 상품 등록 화면</h2>
	<table>
		<form:hidden path="shop_seller_id"/>
		<form:hidden path="shop_status"/>
		<form:hidden path="shop_regdate"/>
		<tr><td>제목</td>
			<td><form:input path="shop_subject" maxlength="20" /></td>
			<td><font color="red"><form:errors path="shop_subject" /></font></td>
			</tr>
		<tr><td>가격</td>
			<td><form:input path=shop_price" maxlength="6" /></td>
			<td><font color="red"><form:errors path="shop_price" /></font></td>
			</tr>
		<tr><td>상품이미지</td>
			<td colspan="2"><input type="file" name="shop_file" /></td>
			</tr>
		<tr><td>상품설명</td>
			<td><form:textarea path="shop_content" cols="20" rows="5" /></td>
			<td><font color="red"><form:errors path="shop_content" /></font>
			</td>
			<tr><td colspan="3">
				<input type="submit" value="상품 등록">&nbsp;
				<input type="button" value="상품 목록" onclick="location.href='list.zips'">
			</td></tr>
	</table>
</form:form> --%>