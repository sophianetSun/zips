<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색 결과 뷰</title>
<script src="${pageContext.request.contextPath }/js/jquery.awesomeCloud-0.2.js"></script>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<style>
	.wordcloud {
		border : 1px solid #036;
		width : 6in;
		height : 6in;
		margin : 0.5in auto;
		padding : 0;
		page-break-after : always;
		page-break-inside : avoid;
	}
</style>
</head>
<body>
<div id="wordcloud1" class="wordcloud">
	<c:forEach items="${map}" var="m">
		<span data-weight="${m.value }">${m.key }</span>
	</c:forEach>
</div>
<script>
		$(document).ready(function() {
			$("#wordcloud1").awesomeCloud({
				"size" : {"grid" : 9,"factor" : 0},
				"options" : {"color" : "random-dark",
					"rotationRatio" : 0.35},
				"font" : "'Times New Roman', Times, serif", 
				"shape" : "circle"	
			})
		});
</script>
${map }
</body>
</html>