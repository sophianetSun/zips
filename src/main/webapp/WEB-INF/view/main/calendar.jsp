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
					title : '(${infoCal.calorie}), ${infoCal.nutri_memo}',
					start : '${infoCal.regdate}',
					url : "${pageContext.request.contextPath}/myinfo/graph.zips?regdate=${infoCal.regdate}&in_type=${infoCal.in_type}"
				},
				</c:forEach>
			],
			
			eventClick: function(event) {
				if (event.url) {
					window.open(event.url);
					return false;
				}
			},
			 dayClick: function(date, jsEvent, view) {
			    location.href = "${pageContext.request.contextPath}/myInfoCal.zips?regdate=" + date.format();
			    //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
			    //alert('Current view: ' + view.name);
			 }
		  });
	});
</script>
</head>
<body>
<div id='calendar'></div>
</body>
</html>