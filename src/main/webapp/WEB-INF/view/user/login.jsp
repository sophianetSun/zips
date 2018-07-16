<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script>
function sendCheckId() {
	$.ajax({
	    url: "findid.zips",
	    data: { email: $("#findid").val() }, 
	    type: "POST",
	    success : function(result) {
	    	alert("ID를 Email로 보내드렸습니다. 확인해 주세요");
	    	}
	    })
}

function sendCheckPW() {
	$.ajax({
	    url: "findpw.zips",
	    data: { id: $("#findidpw").val() }, 
	    type: "POST",
	    success : function(result) {
	    	alert("인증번호를 이메일로 보내드렸습니다.확인해 주세요");
	    	}
	    })
}

$(document).ready(function() {

}) 
</script>
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
	      <form:input path="id" class="form-control" name="id" id="id" placeholder="아이디" style="width:500px"/>
	    </div>
	    <div class="form-group"  align="center">
	      <font color="red"><form:errors path="pw" /></font>
	      <form:password path="pw" class="form-control" name="pw" id="pw" placeholder="비밀번호" style="width:500px"/>
	    </div>
	    <br>
	    <div align="center">
	    <button type="submit" class="btn btn-default">로그인</button>
		<input type="button" class="btn btn-default" value="회원가입" onclick="location.href='join.zips'">
  		<button type="button" class="btn btn-link" data-toggle="modal" data-target="#myModal">ID찾기</button>
  		<button type="button" class="btn btn-link" data-toggle="modal" data-target="#myModal2">PW찾기</button><br><br>
	    </div><br>
	    <!-- Button to Open the Modal -->

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><strong>ID찾기</strong></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <p>&nbsp;&nbsp;&nbsp;회원가입시 등록했던 이메일을 입력해주세요</p><br>
  				<div align="center">
  				<input class="w3-input" style="width:50%" type="text" name="findid" id="findid" placeholder="이메일"><br></div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="sendCheckId()">보내기</button>
        </div>
      </div>
    </div>
  </div>
  
	    <br>
	  </div>
	</div>
  <!-- The Modal -->
  <div class="modal fade" id="myModal2">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><strong>비밀번호 찾기</strong></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <p>&nbsp;&nbsp;&nbsp;회원가입시 등록했던 이메일과 아이디를 입력해 주세요</p><br>
  				<div align="center">
  				<input class="w3-input" style="width:50%" type="text" name="findidpw" id="findidpw" placeholder="아이디"><br></div>
  				
  				<div align="center">
  				<input class="w3-input" style="width:50%" type="text" name="findpw" id="findpw" placeholder="이메일"><br></div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="sendCheckPW()">보내기</button>
        </div>
      </div>
    </div>
  </div>
</form:form>
</body>
</html>
