<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
	<script type="text/javascript"
		src="//cdn.ckeditor.com/4.5.7/full/cheditor.js"></script>
</head>
<body>
<div class="container">
  <h2>메일 전송하기</h2><br>
  <form name="mailform" method="post" action="mail.zips" enctype="multipart/form-data">
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">관리자</span>
      </div>
      <input type="text" class="form-control" name="gmailId" placeholder="Gmail ID를 입력해 주세요" value="winnerzips">
      <input type="password" class="form-control" name="gmailPw" placeholder="Gmail PW를 입력해 주세요" value="winnerzips!">
</div>
  <table class="table table-bordered">
    <tbody>
      <tr>
        <td><strong>보내는 사람</strong></td>
        <td>${sessionScope.loginUser.email}</td>
        <td><strong>받는사람</strong></td>
         <td><input type="text" class="w3-input" name="recipient" value='${sender}'></td>
      </tr>
      <tr>
        <td><strong>제목</strong></td>
        <td colspan="3"><input type="text" name="title" class="w3-input" value='${sendersub}'></td>
	  </tr>
      <tr>
      	<td><strong>메세지형식</strong></td>
        <td>
  			<select class="w3-select w3-border" name="mtype">
    		  <option value="text/html;charset=euc-kr">HTML</option>
  			  <option value="text/plain;charset=euc-kr">TEXT</option>
  			</select>
        </td>
        <td><strong>첨부파일</strong></td>
        <td><input type="file" name="file1">
      </tr>
    </tbody>
  </table>
  <textarea class="form-control" rows="10" name="contents" placeholder="내용을 입력해 주세요"></textarea><br>
  <script type="text/javascript">CKEDITOR.replace('contents');</script>
  <div align="center">
  <input type="submit" class="w3-bar-item w3-button w3-teal" style="width:33.3%" value="메일전송하기"></div>
	<br>
</form>
</div>
</body>
</html>
