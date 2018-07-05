<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$('#calendar').fullCalendar({
			locale: 'ko',
			header: { 
				left : 'prev, next today',
				center: 'title',
				right: 'month,basicWeek,basicDay' 
			},
			navLinks: true,
			editable: true,
			eventLimit: true,
			views: {
			    month: { // name of view
			      // other view-specific options here
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