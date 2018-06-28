<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<html lang="en"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="floating-labels.css" rel="stylesheet">
  </head>

  <body>
  <form:form modelAttribute="user" method="post" action="login.zips">
  <spring:hasBindErrors name="user">
		<font color = "red">
			<c:forEach items = "${errors.globalErrors}" var="error">
				<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<br><br>
    <div class="form-signin">
      <div class="text-center mb-4">
        <img class="mb-4" src="../img/team.png" alt="" width="120" height="100">
      </div><br>

      <div class="form-label-group">
        <input type="text" id="id" name="id" class="form-control" placeholder="ID">
        <font color="red"><form:errors path="id" /></font>
      </div><br>

      <div class="form-label-group">
        <input type="password" id="pw" name="pw" class="form-control" placeholder="Password">
     	<font color="red"><form:errors path="pw" /></font>
      </div><br>

      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      <input type="button" value="Join" onclick="location.href='join.zips'"><!-- 하이퍼링크(url)를 userForm.shop로 요청을 하면 UserController에서 찾아줌 -->
      <p class="mt-5 mb-3 text-muted text-center">© ZIPS</p>
    </div><br>

</form:form>
</body></html>