<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>

<form:form modelAttribute="user" method="post" action="login.zips">
	<form:hidden path="name" value="의미없음" />
	<spring:hasBindErrors name="user">
	<font color="red">
		<c:forEach items = "${errors.globalErrors}" var="error">
		<spring:message code="${error.code}" />
		</c:forEach>
	</font>
	</spring:hasBindErrors>
	<div>
	  <h1><strong>로그인</strong></h1><br><br>
	  <div class="img" align="center">
	  	<img src="../img/rock.png" width="200" height="200" name="rock"><br><br>
	  </div>
	  <div>
	  		<br>
	  		
	    <div class="form-group" align="center">
	      <font color="red"><form:errors path="id" /></font>
	      <form:input path="id" class="form-control" name="id" id="id" placeholder="아이디" style="width:400px"/>
	    </div>
	    	    	
	    <div class="form-group"  align="center">
	      <font color="red"><form:errors path="pw" /></font>
	      <form:password path="pw" class="form-control" name="pw" id="pw" placeholder="비밀번호" style="width:400px"/>
	    </div>
	    
	    <br>
	    <div align="center">
	    <button type="submit" class="btn btn-default">로그인</button>
		<input type="button" class="btn btn-default" value="회원가입" onclick="location.href='join.zips'">
	    </div><br><br>
	  </div>
	</div>
</form:form>
</body>
</html>
