<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>게시물 상세 보기</title>

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
 	 		<source src="mov_bbb.mp4" type="video/mp4">
 			 <source src="mov_bbb.ogg" type="video/ogg">
				</video>
				</div>
            </blockquote>
            <br>
            <br>
            <h3>운동 설명 & 운동 후기 </h3>
            <br>
            <p>${board.content }</p>
            <hr>
            <div align="center">
                    <c:forEach var="be" items="${dbbest}">
            <c:choose>
       				<c:when test="${be.rec_user != sessionScope.loginUser.id}">
            <form action="best.zips?board_type=${param.board_type}">
                    <input type="hidden" name="board_userid" value="${sessionScope.loginUser.id}">
                    <input type="hidden" name="num" value="${board.num}">
                    <input type="hidden" name="board_type" value="${board.board_type}">
              <button type="submit" class="btn btn-sm btn-outline-primary" style="width: 103px;height: 50px">추천 <font color="red">♥</font>&nbsp;${bestcnt}</button>
                     </form>
        			<c:when test="${be.rec_user == sessionScope.loginUser.id}">
        			<c:out value="${be.rec_user}"/>
        			<c:out value="${sessionScope.loginUser.id}"/>
						이미추천
       				</c:when>
                     </c:when>
       				<c:otherwise>
        			<c:out value="${be.rec_user}"/>
        			<c:out value="${sessionScope.loginUser.id}"/>
       				 </c:otherwise> 
    					</c:choose>
           		 	 </c:forEach>
                     <br>
              <button type="button" class="btn btn-sm btn-outline-danger" style="width: 103px;height: 50px">▶ 구독하기 <font color="red"></font></button>
            <br>
            <br>
            </div>	
          </div>
     	                <strong>댓글 쓰기</strong><br>
<form action="recomment.zips" method="post">
<input type="hidden" name="board_type" value="${param.board_type }">
<input type="hidden" name="co_userid" value="${sessionScope.loginUser.id}">
<input type="hidden" name="num" value="${board.num }">
<input type="hidden" name="pageNum" value="${pageNum }">
<textarea rows="3" cols="82" class="w3-round-large" name="co_content"></textarea>&nbsp;<input type="submit" align="top" class="w3-button w3-border w3-hover-blue" style="text-align:center;" value="등록">
</form>
 
<c:forEach var="re" items="${recommentlist}">
<fmt:formatDate value="${c.regdate}" type="date" var="regdatetime" />
<fmt:formatDate value="${time}" type="date" var="nowtime" />
<div>
${re.co_userid }
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
          <%-- <c:if test="${sessionScope.loginUser.nickname == board.board_userid}"> </c:if> --%>
				<a href="update.zips?num=${board.num }&pageNum=${param.pageNum}&board_type=${param.board_type}"><button type="button" class="btn btn-primary">수정</button></a>
				<a href="delete.zips?num=${board.num }&pageNum=${param.pageNum}&board_type=${param.board_type}"><button type="button" class="btn btn-warning">삭제</button></a>
				<a href="homeTraininglist.zips?board_type=${param.board_type}"><button type="button" class="btn btn-light">목록</button></a>
          </div>
</body>
</html>