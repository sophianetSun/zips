<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>게시물 상세 보기</title>
<!-- 구독 기능 script -->
<script>
$(window).ready(function(){
	$(".boton").wrapInner('<div class=botontext></div>');
	    
	    $(".botontext").clone().appendTo( $(".boton") );
	    
	    $(".boton").append('<span class="twist"></span><span class="twist"></span><span class="twist"></span><span class="twist"></span>');
	    
	    $(".twist").css("width", "25%").css("width", "+=3px");
	});

	$(document).ready(function() {
		$('#sub_btn').click(function() {
			console.log("구독 버튼 클릭!");
			var userId = '${sessionScope.loginUser.id}';
			var subId = '${board.board_userid}';
			$.get('${pageContext.request.contextPath }/user/subscribe.zips', {
				userId : userId,
				subId : subId
			},
			function(data) {
				if (data.result == 1) {
					alert(data.subId + ' 구독되었습니다!');
					location.reload();
				} else if (data.result == 2) {
					alert(data.subId + " 구독취소 되었습니다!");
					location.reload();
				}
			});
		})
		$('#bst_btn').click(function() {
			console.log("추천 버튼 클릭!");
			var board_userid = '${sessionScope.loginUser.id}';
			var num = '${board.num}';
			var board_type = '${board.board_type}';
			$.get('${pageContext.request.contextPath }/board/ajaxbest.zips', {
				board_userid : board_userid,
				num : num,
				board_type : board_type
			},
			function(data) {
			console.log("여기까지 감??");
				if (data.result == 1) {
					alert(' 추천되었습니다!');
					location.reload();
				} else if (data.result == 2) {
					alert(" 추천이 취소 되었습니다!");
					location.reload();
				}
			});
		})
	});
	
</script>
</head>
<body>
	   <div class="blog-post">
            <h2 class="blog-post-title">홈 트레이닝</h2>
            <p class="blog-post-meta"><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd-HH:mm:ss"/></p>

            <h2>제목  : ${board.subject} (${recount})</h2>
            <hr>
            <div align="right">
            	<small>닉네임 :${board.board_userid}</small>
            	<br>
            	<small>조회수:${board.board_count}</small>
            	<br>
            	<br>
            </div>
            <blockquote>
            <div align="center">
             <video width="700" height="450" controls >
 	 		<source src="../img/${board.fileurl}" type="video/mp4">
				</video>
				</div>
            </blockquote>
            <br>
            <br>
            <h3>운동 설명 & 운동 후기 </h3>
            <br>
            <p>${board.content }</p>
             <br> <br> <br>
            <div align="center">
              <button type="button" id="bst_btn" class="btn btn-sm btn-outline-primary" style="width: 103px;height: 50px">추천 <font color="red">♥</font>&nbsp;${board.recommand}</button>
                     <br>
                     
            <c:if test="${sessionScope.loginUser.id != board.board_userid}">
            <button type="button" id="sub_btn"  class="btn btn-sm btn-outline-danger" style="width: 103px;height: 50px">▶ 구독하기 <font color="red"></font></button>
            </c:if>
            <br>
            <br>
            </div>	
          </div>
          <hr>
     	                <strong>댓글</strong><br><br>
<form action="recomment.zips" method="post">
<input type="hidden" name="board_type" value="${param.board_type }">
<input type="hidden" name="co_userid" value="${sessionScope.loginUser.id}">
<input type="hidden" name="num" value="${board.num }">
<input type="hidden" name="pageNum" value="${pageNum }">
<textarea id="text" name="co_content" rows="2" style="overflow: hidden; word-wrap: break-word; resize: none; height: 160px; "></textarea> 
<input value="등록" type="submit" />
</form>
<br>
<hr>
 <c:forEach var="re" items="${recommentlist}">
<c:choose>
<c:when test="${re.co_userid == board.board_userid }">
${re.co_userid } <span class="badge badge-pill badge-primary">작성자</span>
</c:when>
<c:otherwise>
 ${re.co_userid }
</c:otherwise>
</c:choose>
<fmt:formatDate value="${c.regdate}" type="date" var="regdatetime" />
<fmt:formatDate value="${time}" type="date" var="nowtime" />
<div>
<br>
${re.co_content}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
<div align="right">
<c:if test="${nowtime == regdatetime }">
						<td style="text-align: center;"><fmt:formatDate value="${re.co_regdate}" pattern="HH:mm:ss"/></td>
					</c:if>
					<c:if test="${nowtime != regdatetime }">
						<td style="text-align: center;"><fmt:formatDate value="${re.co_regdate}" pattern="yyyy-MM-dd-E" />	</td>
					</c:if>
</div>
</div>
<hr>
</c:forEach>
          <div>
          <c:if test="${sessionScope.loginUser.id == board.board_userid}">
				<a href="update.zips?num=${board.num }&pageNum=${param.pageNum}&board_type=${param.board_type}"><button type="button" class="btn btn-primary">수정</button></a>
				<a href="delete.zips?num=${board.num }&pageNum=${param.pageNum}&board_type=${param.board_type}"><button type="button" class="btn btn-warning">삭제</button></a>
				</c:if><a href="homeTraininglist.zips?board_type=${param.board_type}"><button type="button" class="btn btn-light">목록</button></a> 
          </div>
</body>
</html>