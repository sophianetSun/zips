<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<form method="post" action="delete.zips">
<input type="hidden" name="name" value="test1">
<input type="hidden" name="id" value="test2">
<div class="container">
  <h2>회원탈퇴</h2><br>     
  <div class="form-group">
      <label for="inputdefault">본인확인을 위해 한 번 더 비밀번호를 입력해 주세요.</label>
      <input class="form-control" id="pw" name="pw" type="text">
    </div><br>
    <div class="container" align="center">
    <button type="button" class="btn">탈퇴하기</button>
</div>
</div>
</form>

</body>
</html>