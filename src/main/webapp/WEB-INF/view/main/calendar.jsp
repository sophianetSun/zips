<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>달력 테스트</title>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/fullcalendar.css' />
<script src='${pageContext.request.contextPath}/js/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/js/fullcalendar.js'></script>
<script src='${pageContext.request.contextPath}/js/ko.js'></script>
<script>
	$(document).ready(function() {
		var list = ${list};
		
		$('#calendar').fullCalendar({
			locale: 'ko',
			header: { 
				left : 'prev, next today',
				center: 'title',
				right: 'month,basicWeek,basicDay' 
			},
			navLinks: true,
			editable: false,
			eventLimit: true,
			views: {
			    month: { // name of view
			      // other view-specific options here
			    }
			},
			events : [
				<c:forEach items='${list}' var='infoCal'>
				{
					id : '${infoCal.num}',
					title : '칼로리 : ' +  '${infoCal.calorie}' + '한마디 : ' + '${infoCal.nutri_memo}',
					start : '${infoCal.regdate}',
					url : "myinfo/graph.zips?regdate=" + "${infoCal.regdate}"
				},
				</c:forEach>
			],
			eventClick: function(event) {
				if (event.url) {
					window.open(event.url);
					return false;
				}
			}
		  });
	});
</script>
</head>
<body>
<div id='calendar'></div>
</body>
</html>