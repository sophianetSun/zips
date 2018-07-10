<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function allchkbox(chk) {
		var chks = documemt.getElementsByName("idchks")
		for(var i=0; i<chks.length; i++) {
		chks[i].checked = chk.checked;
		}	
	}
</script>
</head>
<body>

<div class="container" style="width:8000px">
  <h2>관리자페이지</h2>
<br>
  <table class="table table-bordered table">
    <thead>
      <tr>
      	<th>사진</th>
        <th>아이디</th>
        <th>이름/닉네임</th>
        <th>이메일</th>
        <th>연락처</th>
        <th>주소</th>
        <th>성별</th>
        <th>키/몸무게</th>
        <th>체지방/골격근</th>
        <th>포인트/코인</th>
        <th>가입날짜</th>
        <th>
        	<input type="checkbox" name="allchk" onchange="allchkbox(this)">
      	</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <c:forEach items="${userList}" var="user">
        <tr>
        	<td>
        	<c:if test="${empty dbuser.picture}"><img src="../img/join.png" width="100" height="100"></c:if>
   			<c:if test="${!empty dbuser.picture}"><img src="../img/${user.picture}"></c:if>
        	</td>
        	<td>${user.id}</td>
        	<td>${user.name}/${user.nickname}</td>
        	<td>${user.email}</td>
        	<td>${user.tel}</td>
        	<td>${user.address}</td>
       		<td>${user.gender}</td>
       	 	<td>${user.height}cm/${user.weight}kg</td>
        	<td>${user.bodyfat}kg/${user.muscle}kg</td>
        	<td>${user.point}포인트/${user.coin}코인</td>
        	<td><fmt:formatDate value="${user.regdate}" pattern="yyyy-MM-dd" /></td>
			<td><a href="../user/mypage.zips?id=${dbuser.id}">수정</a>
				<a href="../user/delete.zips?id=${dbuser.id}">삭제</a>
				<td><input type="checkbox" name="idchks" value="${dbuser.id}"></td>
        </c:forEach>
        	<tr><td colspan="7" align="center">
				<input type="submit" value="메일보내기">
      		</tr>
    </tbody>
  </table>
</div>

</body>
</html>
