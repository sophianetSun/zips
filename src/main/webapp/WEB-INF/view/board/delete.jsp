<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>게시물 삭제</title>
</head>
<body>
	<form name="f" method="post" action="delete.zips?pageNum=${param.pageNum}">
		<input type="hidden" name="num" value="${param.num}">
		
		 <div class="alert alert-warning">
    <strong>Warning!</strong> 정말로 회원님의 글 [ ${board.subject } ]을(를) 삭제하시겠습니까?
  </div>
  <br>
  <div align="center">
		<a href="javascript:document.f.submit()"><button type="button" class="btn btn-outline-success" onclick="javascript:alert('게시물 삭제 완료');return true;">게시글 삭제하기</button></a>
</div>
<br>	
	</form>
</body>
</html>