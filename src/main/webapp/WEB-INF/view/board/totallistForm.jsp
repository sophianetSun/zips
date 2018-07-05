<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>게시물 상세 보기</title>
	<script type="text/javascript">
	$(function(){
		$(crartediv).one('click', function (){
			addRow();
		})
		
	})
	function addRow(){
		
var html =   "<textarea rows='20' cols='90' name='content'>"
			+ "</textarea><input type='hidden' name='num' value='${board.num}'><input type='submit' value='등록'></div></div>";
	$(list_detail).append(html);
		
	}
	</script>
</head>
<body>
	   <div class="blog-post">
	   <c:if test="${param.board_type == 2 }">
            <h2 class="blog-post-title">질문과 답변</h2>
            </c:if>
             <c:if test="${param.board_type == 3 }">
            <h2 class="blog-post-title">자유 게시판</h2>
            </c:if>
             <c:if test="${param.board_type == 4 }">
            <h2 class="blog-post-title">Before & After</h2>
            </c:if>
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
				</div>
            </blockquote>
            <br>
            <br>
            <c:if test="${param.board_type == 2 }">
           <h1><strong>Q</strong></h1><h3>질문 내용 </h3>
    		</c:if>
    		<c:if test="${param.board_type == 3 }">
           <h3>아무말 대잔치</h3>
    		</c:if>
    		<c:if test="${param.board_type == 4 }">
           <h3>Before & After 후기 </h3>
    		</c:if>
            <br>
            <p>${board.content }</p>
            <hr>
            <br>
            <br>
            <br>
            <br>
            <br>
            <c:if test="${param.board_type == 2 }">
            <h1><strong>A</strong></h1><h3>답변</h3>
            <form method="post" action="zipscomment.zips?pageNum2=${param.pageNum2}&board_type=${param.board_type}">
            	<div id="list_detail" style="display: :table;">
            	<div class="contents_row" style="display:table-row">
            	<div class="contents_col" style="display:table-cell">
            <button type="button" id="crartediv" class="btn btn-sm btn-outline-primary" style="width: 100px;height: 50px">
            	답변하기</button>
      				</div>
      				</div>
      				</div>
            	</form>
            	
            	
            	
            	</c:if>
          </div>


          
<%--      	                <strong>댓글 쓰기</strong><br>
<form action="recommand.zips" method="post">
<input type="hidden" name="board_type" value="1">
<input type="hidden" name="id" value="${sessionScope.loginUser.nickname }">
<input type="hidden" name="co_num" value="1">
<input type="hidden" name="num" value="${board.num }">
<input type="hidden" name="pageNum" value="${pageNum }">
<textarea rows="3" cols="102" class="w3-round-large" name="content"></textarea>&nbsp;<input type="submit" align="top" class="w3-button w3-border w3-hover-blue" style="text-align:center;" value="등록">
</form> --%>




<%-- 
<c:forEach var="c" items="${rrlist}">
<fmt:formatDate value="${c.regdate}" type="date" var="regdatetime" />
<fmt:formatDate value="${time}" type="date" var="nowtime" />
${c.id }${c.content}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${nowtime == regdatetime }">
						<td style="text-align: center;"><fmt:formatDate value="${c.regdate}" pattern="HH:mm:ss"/></td>
					</c:if>
					<c:if test="${nowtime != regdatetime }">
						<td style="text-align: center;"><fmt:formatDate value="${c.regdate}" pattern="yyyy-MM-dd-E" />	</td>
					</c:if>
</c:forEach> --%>
          <div>
          <%-- <c:if test="${sessionScope.loginUser.nickname == board.board_userid}"> </c:if> --%>
				<a href="update.zips?num=${board.num }&pageNum=${param.pageNum}"><button type="button" class="btn btn-primary">수정</button></a>
				<a href="delete.zips?num=${board.num }&pageNum=${param.pageNum}"><button type="button" class="btn btn-warning">삭제</button></a>
				<a href="totallist.zips?board_type=${param.board_type }"><button type="button" class="btn btn-light">목록</button></a>
          </div>
</body>
</html>