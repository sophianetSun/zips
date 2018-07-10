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
 td {
 	text-align: center;
 }
 a.btn_worry em.off {
    display: inline-block;
    border-radius: 3px;
    border: 1px solid #aaa;
    color: #777;
    width: 50px;
    font-size: 11px;
    text-align: center;
    vertical-align: top;
    letter-spacing: -0.04em;
    }
    
  a.btn_worry em.on {
    display: inline-block;
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
    border-top-right-radius: 3px;
    border-bottom-right-radius: 3px;
    border: 1px solid #e2614c;
    color: #e2614c;
    width: 50px;
    font-size: 11px;
    text-align: center;
    vertical-align: top;
    letter-spacing: -0.04em;
	}	

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중고 장터 게시판 목록</title>
<script type="text/javascript">
	// 스크립트 list function
	function list(pageNum) {
		var searchType = document.searchform.searchType.value;
		if(searchType == null || searchType.length == 0) {
			document.searchform.searchContent.value = "";
			document.searchform.pageNum.value = 1;
			location.href="list.zips?pageNum="+pageNum;			
		} else {
			document.searchform.pageNum.value = pageNum;
			document.searchform.submit();
			return true;
		}
		return false;
	}
</script>
</head>
<body>
<h2 align="center">중고 장터 게시판 목록 </h2> 글개수:${listcount}

<div class="container">
<table class="table table-hover">
	<colgroup>
    		<col style="width: 100px">
    		<col style="width: auto">
    		<col style="width: 150px">
    		<col style="width: 200px">
    </colgroup>
	<c:if test="${listcount > 0}">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
			</tr>
			<c:forEach var="shop" items="${shoplist}">
			<tr>
				<td>${shopcnt}</td>
					<c:set var="shopcnt" value="${shopcnt-1}"/>
				<td style="text-align: left;"> 
				<c:if test="${shop.shop_status == '0'}">
				<a href="detail.zips?shop_no=${shop.shop_no}">${shop.shop_subject}</a>
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn_worry mr10"><em class="off">판매중</em></a>
				</c:if>
				<c:if test="${shop.shop_status == '1'}">
					<c:if test="${(shop.shop_seller_id == loginUser.id) || (shop.shop_buyer_id == loginUser.id)}">
					<a href="dealpage.zips?shop_no=${shop.shop_no}">${shop.shop_subject}</a>
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn_worry mr10"><em class="off">구매중</em></a>			    
				    </c:if>
				      
					<c:if test="${(shop.shop_seller_id != loginUser.id) && (shop.shop_buyer_id != loginUser.id)}">    
					<a href="detail.zips?shop_no=${shop.shop_no}">${shop.shop_subject}</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn_worry mr10"><em class="off">구매중</em></a>
					</c:if>
				</c:if>
				
				<c:if test="${shop.shop_status == '2'}">
					<a href="detail.zips?shop_no=${shop.shop_no}">${shop.shop_subject}</a>
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn_worry mr10"><em class="on">판매완료</em></a>
				</c:if>
				</td>	
				<td>${shop.shop_seller_id}</td>
				<td><fmt:formatDate value="${shop.shop_regdate}" pattern="YY-MM-dd"/></td>	
			</tr>
			</c:forEach>
			<tr align="center" height="26"><td colspan="5">
				<c:if test="${pageNum > 1}"> 
					<a href="javascript:list(${pageNum - 1})">[이전]</a>
				</c:if>&nbsp;
				<c:if test="${pageNum <= 1}">[이전]</c:if>&nbsp;
				
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == pageNum}">[${a}]</c:if>
					<c:if test="${a != pageNum}">
						<a href="javascript:list(${a})">[${a}]</a>
					</c:if>
				</c:forEach>
					<c:if test="${pageNum < maxpage}">
						<a href="javascript:list(${pageNum + 1})">[다음]</a>
					</c:if>&nbsp;
					<c:if test="${pageNum >= maxpage}">[다음]						
					</c:if>&nbsp;
				</td></tr>
	</c:if>
	<c:if test="${listcount ==0}">
		<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
	</c:if>
	
	<tr><td colspan="4" align="center">
		<form action="list.zips" method="post" name="searchform" id="searchform" onsubmit="return list(1)">
			<input type="hidden" name="pageNum" value="1">
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
		<a href="write.zips">[글쓰기]</a></td></tr>
		<tr align="center" valign="middle">
</table>
</div>

</body>
</html>