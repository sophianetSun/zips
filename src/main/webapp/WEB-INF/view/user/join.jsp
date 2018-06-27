<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Join Page</h2><br>
  <form:form modelAttribute="user" method="post" action="userEntry.zips" enctype="multipart/form-data">
	<spring:hasBindErrors name="user">
		<font color = "red">
			<c:forEach items = "${errors.globalErrors}" var="error">
				<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	

  <div class="img" align="center">
				<img src="../img/join_pic.png" width="400" height="400" id="picture"><br>
				<font size="2"><a href="javascript:win_open()">사진</a></font></div>
    
    <div class="mb-3">
              <label for="id">아이디</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="id" /></font>
              <input type="text" class="form-control" name="id" placeholder="아이디를 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="ps">비밀번호</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="pw" /></font>
              <input type="password" class="form-control" name="pw" placeholder="비밀번호를 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="name">이름</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="name" /></font>
              <input type="text" class="form-control" id="name" placeholder="이름을 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="nickname">닉네임</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="nickname" /></font>
              <input type="text" class="form-control" id="nickname" placeholder="닉네임을 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="tel">연락처</label>
              <input type="text" class="form-control" id="tel" placeholder="연락처를 '010-0000-0000'형식으로 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="email">이메일</label>
              <input type="text" class="form-control" id="email" placeholder="이메일을  'zips@zips.com'형식으로 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="address">주소</label>
              <input type="text" class="form-control" id="address" placeholder="주소를 입력해 주세요">
            </div>
    <div class="row">
    <div class="col-md-6 mb-3">
                <label for="height">키</label>
                <input type="text" class="form-control" id="height" placeholder="cm"><!--  value="" required="" -->
              </div>
              <div class="col-md-6 mb-3">
                <label for="weight">몸무게</label>
                <input type="text" class="form-control" id="weight" placeholder="kg">
              </div>
            </div>
    <div class="mb-3">
              <label for="bodyfat">체지방</label>
              <input type="text" class="form-control" id="bodyfat" placeholder="체지방을 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="muscle">골격근량</label>
              <input type="text" class="form-control" id="muscle" placeholder="골격근량을 입력해 주세요">
            </div>
    <label for="gender">성별</label><br>
    <label class="radio-inline">
      <input type="radio" name="gender" value="1" checked>남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </label>
    <label class="radio-inline">
      <input type="radio" name="gender" value="2">여자
    </label>
    

    
    
    
 	<br><br>
    <input type="submit" class="btn btn-default btn-lg btn-block" value="join">
    <br><br>

  </form:form>
</div>
</body>
</html>