<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지</title>
<script>
function deleteMsg(button) {
	var flag = confirm("쪽지를 삭제 하시겠습니까?");
	if (flag == true) {
		button.parentNode.parentNode.style.display = "none";
		$.post("message/hide.zips", { num : button.id }, function(data, status) {
			console.log(data);
		});
	} else { }
}

function makeTable(msgs, m_type) {
	var msgs = JSON.parse(msgs);  
	var table = "<table class='table table-bordered'><thead><tr>";
	if (m_type == "re") {
		table += "<th>보낸사람</th>";	
	} else {
		table += "<th>받은사람</th>";
	}
	table += "<th>내용</th><th>날짜</th><th></th></tr></thead><tbody>";
	for(i in msgs) {
		var msg = msgs[i].Message;
		if (m_type =="re") table += "<tr><td>" + msg.sender + "</td>";
		else table += "<tr><td>" + msg.receiver + "</td>";
		table += "<td>" + msg.content + "</td>";
		table += "<td>" + msg.regdate + "</td>";
		table += "<td><button type='button' id='" + msg.num 
			+ "' class='btn btn-danger' onclick='deleteMsg(this)'>삭제</button></td></tr>";
	}
	table += "</tbody></table>";
	return table;
}

  function showTable(msgs, m_type) {
	  document.getElementById('msg_table').innerHTML = makeTable(msgs, m_type);
  }
  
  $(document).ready(function() {
	$('#re_msg').click(function() {
		$.post("message/list.zips",
				{
					receiverId : '${id}',
					senderId : ""
				},
				function(data, status) {
					showTable(data, "re");
				});
		console.log("remsg");
	});
	$('#se_msg').click(function() {
		$.post("message/list.zips",
				{
					receiverId : "",
					senderId : '${id}'
				},
				function(data, status) {
					showTable(data, "se");
				});
		console.log("semsg");
	});
	$('#send').click(function() {
		console.log("send");
		var msgForm = "<form action='message/send.zips'><div class='form-group'>";
		msgForm += "<label for='receiver'>받는 사람ID</label>" +
			"<input type='text' class='form-control' id='receiver'></div>";
		msgForm += "<div class='form-group'>";
		msgForm += "<textarea rows='10' class='form-control' id='content'></textarea></div>";
		msgForm += "<button type='submit' class='btn btn-primary'>쪽지 보내기</button></form>"
		
		document.getElementById('msg_table').innerHTML = msgForm;
	});
	
  });
</script>
</head>
<body>
<div class="container">
	<button type="button" id="re_msg" class="btn btn-primary">받은 쪽지</button>
	<button type="button" id="se_msg" class="btn btn-info">보낸 쪽지</button>
	<button type="button" id="send" class="btn btn-success">쪽지 보내기</button>
	
	<div id="msg_table" class="mt-4">
	<table class="table table-bordered">
	  <thead>
	    <tr>
	      <th>보낸사람</th>
	      <th>내용</th>
	      <th>날짜</th>
	      <th></th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach items="${msgList}" var="msg">
		  <tr>
		      <td>${msg.sender }</td>
		      <td>${msg.content }</td>
		      <td><fmt:formatDate value="${msg.regdate }" pattern="YY/MM/dd ahh:mm"/></td>
		      <td><button type="button" id='${msg.num }' 
		      	onclick='deleteMsg(this)' class="btn btn-danger">삭제</button></td>
		  </tr>  	    
	    </c:forEach>
	  </tbody>
	</table>
	</div>
</div>
</body>
</html>