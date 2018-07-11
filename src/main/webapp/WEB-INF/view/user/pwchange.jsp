<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
	function inputcheck(f) {
		if(f.newpw.value != f.newpwch.value) {
			alert("사용하실 비밀번호를 다시 한 번 확인해 주세요")
			return false;
		}
	}
</script>
</head>
<body>

<form:form modelAttribute="user" method="post" action="pwchange.zips" onsubmit="return inputcheck(this)">
	<input type="hidden" name="name" value="${loginUser.name}">
	<input type="hidden" name="id" value="${loginUser.id}">
	<spring:hasBindErrors name="user">
	<font color="red">
		<c:forEach items = "${errors.globalErrors}" var="error">
		<spring:message code="${error.code}" />
		</c:forEach>
	</font>
	</spring:hasBindErrors>

<div class="container">
<br>
  <h2>비밀번호 변경하기</h2><br><br>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pw">기존 비밀번호:</label>
      <div class="col-sm-10">    
        <font color="red"><form:errors path="pw" /></font>      
        <input type="password" class="form-control" id="pw" placeholder="기존에 사용하시던 비밀번호를 입력해 주세요" name="pw">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="newpw">새로운 비밀번호:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="newpw" placeholder="새로 사용하실 비밀번호를 입력해 주세요" name="newpw">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="newpwch">비밀번호 확인:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="newpwch" placeholder="새로 사용하실 비밀번호를 다시 한 번 입력해 주세요" name="newpwch">
      </div>
    </div><br>
    <div class="form-group" align="center">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">비밀번호변경완료</button>
      </div><br>
    </div>
</div>
</form:form>
</body>
</html>