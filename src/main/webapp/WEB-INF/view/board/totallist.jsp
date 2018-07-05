<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<html>
<head>
<style type="text/css">
 th {
 	text-align: center;
 }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	// 스크립트 list function
	function list(pageNum2) {
		var searchType = document.searchform.searchType.value;
		if(searchType == null || searchType.length == 0) {
			document.searchform.searchContent.value = "";
			document.searchform.pageNum2.value = 1;
			location.href="totallist.zips?pageNum2=" + pageNum2+"&board_type="+${param.board_type};	
		} else {
			document.searchform.pageNum2.value = pageNum2;
			document.searchform.submit();
			return true;
		}
		return false;
	}
</script>
</head>
<body>
<c:if test="${param.board_type == 2 }">
<h2 align="center">질문과 답변 </h2>
</c:if>
<c:if test="${param.board_type == 3 }">
<h2 align="center">자유 게시판 </h2>
</c:if>
<c:if test="${param.board_type == 4 }">
<h2 align="center">Before & After</h2>
</c:if>


<div class="container">

<table class="table table-hover">

	<colgroup>
    		<col style="width: 90px">
    		<col style="width: auto">
    		<col style="width: 80px">
    		<col style="width: 80px">
    		<col style="width: 80px">
    		<col style="width: 89px">
    </colgroup>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>추천수</th>
			</tr>
			<c:forEach var="board" items="${boardlist2}">
			<tr>
				<td>${board.num }</td>
				<td><a href="totallistForm.zips?num=${board.num}&pageNum2=${pageNum2}&board_type=${param.board_type}">${board.subject}</a>
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span></span></td>	
				<td>${board.board_userid}</td>
				<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd-HH:mm:ss"/></td>
				<td>${board.board_count }</td>
				<td>${board.recommand }</td>
			</tr>
			</c:forEach>
			<tr align="center" height="26"><td colspan="5">
				<c:if test="${pageNum2 > 1}"> 
					<a href="javascript:list(${pageNum2 - 1})">[이전]</a>
				</c:if>&nbsp;
				<c:if test="${pageNum2 <= 1}">[이전]</c:if>&nbsp;
				
				<c:forEach var="a" begin="${startpage2}" end="${endpage2}">
					<c:if test="${a == pageNum2}">[${a}]</c:if>
					<c:if test="${a != pageNum2}">
						<a href="javascript:list(${a})">[${a}]</a>
					</c:if>
				</c:forEach>
					<c:if test="${pageNum2 < maxpage2}">
						<a href="javascript:list(${pageNum2 + 1})">[다음]</a>
					</c:if>&nbsp;
					<c:if test="${pageNum2 >= maxpage2}">[다음]						
					</c:if>&nbsp;
				</td></tr>

				
	<c:if test="${listcount2 ==0}">
		<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
	</c:if>
	
	<tr><td colspan="4" align="center">
		<form action="totallist.zips" method="post" name="searchform" id="searchform" onsubmit="return list(1)">
			<input type="hidden" name="pageNum2" value="1">
			<select name="searchType" id="searchType">
				<option value="">선택하세요</option>
				<option value="shop_subject">제목</option>
				<option value="shop_seller_id">글쓴이</option>
				<option value="shop_content">내용</option>
			</select>&nbsp;
			<script type="text/javascript">
				if('${param.searchType}' != '') {
					document.getElementById("searchType").value = '${param.searchType}';
				}
			</script>
			<input type="text" name="searchContent" value="${param.searchContent}">
			<input type="submit" value="검색">
		</form>
	</td></tr>
	
	<tr><td align="right" colspan="4">
		<a href="boardwrite.zips?board_type=${param.board_type }">[글쓰기]</a></td></tr>
		<tr align="center" valign="middle">
</table>
</div>

</body>
</html>