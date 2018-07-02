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

            <h2>제목  : ${board.subject}</h2>
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
              <button type="button" class="btn btn-sm btn-outline-primary" style="width: 100px;height: 50px">추천 <font color="red">♥</font>&nbsp;${board.recommand }</button>
              <button type="button" class="btn btn-sm btn-outline-danger" style="width: 100px;height: 50px">▶ 구독하기 <font color="red"></font></button>
            <br>
            <br>
            </div>	
          </div>
     	     덧글창 덧글구현
          
          <div>
          <%-- <c:if test="${sessionScope.loginUser.nickname == board.board_userid}"> </c:if> --%>
				<a href="update.zips?num=${board.num }&pageNum=${param.pageNum}"><button type="button" class="btn btn-primary">수정</button></a>
				<a href="delete.zips?num=${board.num }&pageNum=${param.pageNum}"><button type="button" class="btn btn-warning">삭제</button></a>
				<a href="homeTraininglist.zips"><button type="button" class="btn btn-light">목록</button></a>
          </div>
</body>
</html>