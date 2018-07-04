<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>

<form:form modelAttribute="user" method="post" action="delete.zips">
	<input type="hidden" name="name" value="name">
	<input type="hidden" name="id" value="${loginUser.id}">
	<spring:hasBindErrors name="user">
	<font color="red">
		<c:forEach items = "${errors.globalErrors}" var="error">
		<spring:message code="${error.code}" />
		</c:forEach>
	</font>
	</spring:hasBindErrors>

<div class="container">

  <h1><strong>회원탈퇴</strong></h1><br><br>
   <div class="img" align="center">
	  	<img src="../img/라이언눈물.gif" width="250" height="250" name="delete"><br><br>
	  </div> 
	  <br><br>
  <div class="form-group" align="center">
      <h5><label for="inputdefault">본인확인을 위해 한 번 더 비밀번호를 입력해 주세요.</label></h5>
      <font color="red"><form:errors path="pw" /></font>
      <input class="form-control" id="pw" name="pw" type="password" style="width:50%">
    </div><br>
    <div class="container" align="center">
    <button type="submit" class="btn" id="delete">탈퇴하기</button>
    <br><br><br>
</div>
</div>
</form:form>
</body>
</html>