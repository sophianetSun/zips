<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구독 리스트</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script>
	$(document).ready(function() {
		if ('${param.subType}' == 'user') {
			$('#nav1').addClass('active');
			$('#nav2').removeClass('active');
		} else {
			$('#nav1').removeClass('active');
			$('#nav2').addClass('active');
		}
	});
</script>
</head>
<body>
<ul id='subType' class="nav nav-tabs">
	<li class="nav-item"><a id="nav1" class="nav-link" href="sublist.zips?subType=user">내 구독</a></li>
	<li class="nav-item"><a id="nav2" class="nav-link" href="sublist.zips?subType=subscribe">팔로워</a></li>
</ul>
<!-- 내 구독 -->
<c:if test="${param.subType eq 'user'}">
<ul class="list-group">
	<c:forEach items="${subList }" var="sub">
		<li class="list-group-item">${sub.subscribe_id }
			<span class="float-right">
			<a href="deletesub.zips?subType=user&subId=${sub.subscribe_id }">
			<i class="material-icons" style="font-size:24px;color:red">clear</i>
			</a></span></li>
	</c:forEach>
</ul>
</c:if>
<!-- 팔로워 -->
<c:if test="${param.subType eq 'subscribe'}">
<ul class="list-group">
	<c:forEach items="${subList }" var="sub">
		<li class="list-group-item">${sub.user_id }</li>
	</c:forEach>
</ul>
</c:if>
</body>
</html>