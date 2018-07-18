<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>게시물 상세 보기</title>
	<script type="text/javascript">
	
	$(document).ready(function(){
		$('.apply').one('click', function(){
			var co_no = $(this).val();
			var num = ${board.num};
			$.post("apply.zips", { co_no : co_no , num : num }, function(data, status) {
				alert('채택 완료')
				location.reload();
			})
		})
		
		$('#totalbst_btn').click(function() {
			console.log("추천 버튼 클릭!");
			var board_userid = '${sessionScope.loginUser.id}';
			var num = '${board.num}';
			var board_type = '${board.board_type}';
			$.get('${pageContext.request.contextPath }/board/totalajaxbest.zips', {
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
	
	
	
	
	
	$(function(){
		$(crartediv).one('click', function (){
			addRow();
		})
		
	})
	function addRow(){
		
		var html = "<br><br>"  
						+ "<textarea id='text' name='co_content' rows='2' style='overflow: hidden; word-wrap: break-word; resize: none; height: 160px; '>"
			 			+ "</textarea><input type='hidden' name='num' value='${board.num}'>"
			 			+"<input type='hidden' name='co_userid' value='${sessionScope.loginUser.id}'>"
			 			+ "<input type='submit' value='등록'></div></div>";
	$(list_detail).append(html);
		
	}
	</script>
</head>
<body>

<input type="hidden" name="co_no" value="${co_no}"> 
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
				
            <h2>${board.subject}(${recount })</h2>
            <hr>
            <div align="right">
            	<small>작성자 :${board.board_userid}</small>
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
            <br>
            <c:if test="${!empty board.fileurl}">
            <img src="../img/${board.fileurl}" style="width: 500px;height: 500px;">
            </c:if>
            
            <c:if test="${param.board_type == 4 }">
           <h2 class="testgreen"><span>Before</span></h2>
    		</c:if>
    		<br><br>
            <c:forEach var="file" items="${uploadFileList}" begin="0" end="1">
            
            <img class="w3-round" src="../bafile/${file.filename}" width="400px" height="300px">
            
            </c:forEach>
            
    		<br><br>
            <c:if test="${param.board_type == 4 }">
           <h2 class="testgreen"><span>After</span></h2>
    		</c:if>
    		<br><br>
            <c:forEach var="file" items="${uploadFileList}" begin="2" end="4">
            
            <img class="w3-round" src="../bafile/${file.filename}" width="400px" height="300px">
            
            </c:forEach>
            <br><br><br><br>
    		<c:if test="${param.board_type == 4 }">
           <h3>Before & After 후기 </h3>
    		</c:if>
    		 
    		<br>
            <h4>${board.content }</h4>
            <br><br>
            <hr>
            <br><br>
            <div align="center">
            <c:if test="${param.board_type == 3 || param.board_type == 4 }">
              <button type="submit" id="totalbst_btn" class="btn btn-sm btn-outline-primary" style="width: 103px;height: 50px">추천 <font color="red">♥</font>&nbsp;${board.totalrecommand}</button>
            </c:if>
            </div>
                     <br>
            <c:if test="${param.board_type == 2 }">
            <h1><strong>A</strong></h1><h3>답변</h3>
            <hr>
            <c:if test="${recomment.co_apply == 1 }">
            <p style="font-style: italic; ">이미 채택된 답변이 있습니다 </p>
            </c:if>
            <c:if test="${recomment.co_apply != 1}">
            <form method="post" action="zipscomment.zips?pageNum=${param.pageNum}&board_type=${param.board_type}">
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
            </c:if>
            	<br><br><br>
            	
          </div>
          

<c:if test="${param.board_type == 3 || param.board_type == 4 }">
     	                <strong>댓글</strong><br><br>
     	                
<form action="recomment.zips" method="post">
<input type="hidden" name="board_type" value="${param.board_type }">
<input type="hidden" name="co_userid" value="${sessionScope.loginUser.id}">
<input type="hidden" name="num" value="${board.num }">
<input type="hidden" name="pageNum" value="${pageNum }">
<textarea id="text" name="co_content" rows="2" style="overflow: hidden; word-wrap: break-word; resize: none; height: 160px; "></textarea> 
<input value="등록" type="submit" />
</form>
 
<div class="my-3 p-3 bg-white rounded box-shadow">
 <c:forEach var="re" items="${recommentlist}">
 <fmt:formatDate value="${c.regdate}" type="date" var="regdatetime" />
<fmt:formatDate value="${time}" type="date" var="nowtime" />
<div style="display: inline-block;">
          <img src="../img/reicon.PNG" alt="" class="mr-2 rounded">
<c:choose>
<c:when test="${re.co_userid == board.board_userid }">
<h5><strong>${re.co_userid }</strong></h5><small><span class="badge badge-pill badge-primary">작성자</span></small>
</c:when>
<c:otherwise>
 <h5><strong>${re.co_userid}</strong></h5>
</c:otherwise>
</c:choose>
</div>
<div align="right">
<c:if test="${nowtime == regdatetime }">
<fmt:formatDate value="${re.co_regdate}" pattern="HH:mm:ss"/>
</c:if>
<c:if test="${nowtime != regdatetime }">
<fmt:formatDate value="${re.co_regdate}" pattern="yyyy-MM-dd-E" /></c:if></div>
  <h5>${re.co_content}</h5>
<hr>
</c:forEach>
</div>
</c:if>




<c:if test="${param.board_type == 2}">
<c:forEach var="re" items="${recommentlist}">
<div>
<form action="apply.zips">
<fmt:formatDate value="${re.co_regdate}" type="date" var="regdatetime" />

<c:if test="${re.co_apply == 1 }">
<img src="../img/apply.PNG">
<br>
<h4><strong>${re.co_userid }님의 답변</strong></h4>
</c:if>
<c:if test="${re.co_apply == 0  || re.co_apply == 2}">
<h4><strong>${re.co_userid }님의 답변</strong></h4>
</c:if>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<c:if test="${sessionScope.loginUser.id == board.board_userid }">
<c:if test="${re.co_apply == 0 }">
<button type="button" id="apply" name="apply" class="apply btn btn-primary" value="${re.co_no}">채택하기</button>
</c:if>
</c:if>
</form>
</div>
<div>
답변 내용: ${re.co_content}
<hr>
</div>
<div></div>					<%-- <c:if test="${nowtime == regdatetime }">
						<td style="text-align: center;"><fmt:formatDate value="${c.regdate}" pattern="HH:mm:ss"/></td>
					</c:if>
					<c:if test="${nowtime != regdatetime }">
						<td style="text-align: center;"><fmt:formatDate value="${c.regdate}" pattern="yyyy-MM-dd-E" />	</td>
					</c:if> --%>

</c:forEach>
</c:if>
          <div>
          <c:if test="${sessionScope.loginUser.nickname == board.board_userid}">
				<a href="update.zips?num=${board.num }&pageNum=${param.pageNum}&board_type=${param.board_type}"><button type="button" class="btn btn-primary">수정</button></a>
				<a href="delete.zips?num=${board.num }&pageNum=${param.pageNum}&board_type=${param.board_type}"><button type="button" class="btn btn-warning">삭제</button></a>
				</c:if><a href="totallist.zips?board_type=${param.board_type }"><button type="button" class="btn btn-light">목록</button></a>
          </div>
</body>
</html>