<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<form method="post" action="login.zips">
<input type="hidden" name="name" value="test">

<div class="container">
  <h1><strong>로그인</strong></h1><br><br>
  <div class="img" align="center">
  	<img src="../img/rock.png" width="200" height="200" name="rock"><br><br>
  </div>
  <div>
    <div class="form-group">
      <label for="id" id="id">아이디 :</label>
      <input type="text" class="form-control" name="id" id="id" placeholder="ID">
    </div>
    <div class="form-group">
      <label for="pw">비밀번호 :</label>
      <input type="password" class="form-control" id="pw" placeholder="Password" name="pw">
    </div><br>
    <div align="center">
    <button type="submit" class="btn btn-default">로그인</button>
	<input type="button" class="btn btn-default" value="회원가입" onclick="location.href='join.zips'">
    </div><br><br>
  </div>
</div>
</form>
</body>
</html>
