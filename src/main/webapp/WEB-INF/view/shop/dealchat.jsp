<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>WEbSocket Client</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<c:set var="port" value="${pageContext.request.localPort}"/>
<c:set var="server" value="${pageContext.request.serverName}"/>
<script type="text/javascript">
	$(function() {
		console.log('${server}');
		console.log('${port}');
		
		var ws = new WebSocket("ws://${server}:${port}/zips/echo.zips");
		ws.onopen = function() {
			$("#chatStatus").text("연결이 완료되었습니다.");
			$("input[name=chatInput]").on("keydown", function(evt){
				if(evt.keyCode == 13) {	// 13 : Enter 키
					var msg = $("input[name=chatInput]").val();
					ws.send(msg);
					$("input[name=chatInput]").val("");
				}
			});
		}
		
		ws.onmessage = function(event) {
			$("textarea").eq(0).prepend(event.data+"\n");
		}
		
		ws.onclode = function(event) {
			$("#chatStatus").text("info:connection closed.");
		}
		
	});
</script>
</head>
<body><p>
<div id="chatStatus"></div>
<textarea name="chatMsg" rows="5" cols="40"></textarea>
<br>
메세지 입력 : <input type="text" name="chatInput">
</body>
</html>