<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" type="text/css" />
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
    border: 1px solid blue;
    color: blue;
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

 a.btn_worry em.oning {
    display: inline-block;
    border-radius: 3px;
    border: 1px solid green;
    color: green;
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
	$(document).ready(function(){
		$('a.page-link').css('color', '#17a2b8');
	}) 
	
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
	
	(function($){

	    $.fn.shuffleLetters = function(prop){

	        var options = $.extend({
	        },prop)

	        return this.each(function(){
	        });
	    };


	    function randomChar(type){
	    }

	})(jQuery);
	
	function randomChar(type){
	    var pool = "";

	    if (type == "lowerLetter"){
	        pool = "qwerkdosavwertogvkapowoekrgmskd";
	    }
	    else if (type == "upperLetter"){
	        pool = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	    }
	    else if (type == "symbol"){
	        pool = "ㄱㅏ,ㄷㅜ시어ㄴㄷㅂㄴㅊㅍㅜㅈㄷㅅㅕㅁㅌㅊ";
	    }

	    var arr = pool.split('');
	    return arr[Math.floor(Math.random()*arr.length)];
	}
	
	$.fn.shuffleLetters = function(prop){

	    var options = $.extend({
	        "step"  : 8,    
	        "fps"   : 25,   
	        "text"  : ""    
	    },prop)

	    return this.each(function(){

	        var el = $(this),
	            str = "";

	        if(options.text) {
	            str = options.text.split('');
	        }
	        else {
	            str = el.text().split('');
	        }

	        // The types array holds the type for each character;
	        // Letters holds the positions of non-space characters;

	        var types = [],
	            letters = [];

	        // Looping through all the chars of the string

	        for(var i=0;i<str.length;i++){

	            var ch = str[i];

	            if(ch == " "){
	                types[i] = "space";
	                continue;
	            }
	            else if(/[a-z]/.test(ch)){
	                types[i] = "lowerLetter";
	            }
	            else if(/[A-Z]/.test(ch)){
	                types[i] = "upperLetter";
	            }
	            else {
	                types[i] = "symbol";
	            }

	            letters.push(i);
	        }

	        el.html("");            


	        (function shuffle(start){


	            var i,
	                len = letters.length,
	                strCopy = str.slice(0); 

	            if(start>len){
	                return;
	            }

	            for(i=Math.max(start,0); i < len; i++){


	                if( i < start+options.step){
	                    strCopy[letters[i]] = randomChar(types[letters[i]]);
	                }
	                else {
	                    strCopy[letters[i]] = "";
	                }
	            }

	            el.text(strCopy.join(""));

	            setTimeout(function(){

	                shuffle(start+1);

	            },1000/options.fps);

	        })(-options.step);

	    });
	};

	$(function(){

	    var container = $("#shop_shop")

	    container.shuffleLetters();

	    setTimeout(function(){

	        container.shuffleLetters({
	            "text": "중 고 장 터"
	        });


	    },3000);

	});
</script>
</head>
<body>
<h2 align="center" id="shop_shop">너도 파니? 나도 판다!</h2> 
 
<div class="container">
	<div align="center">
		<form action="list.zips" method="post" name="searchform" id="searchform" onsubmit="return list(1)">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<div align="center">
			<select name="searchType"  id="searchType" class="custom-select d-block" style="width:100px; height:40px;">
				<option value="">카테고리</option>
				<option value="shop_subject">제목</option>
				<option value="shop_seller_id">작성자</option>
				<option value="shop_content">내용</option>
			</select>&nbsp;
			</div>
			<script type="text/javascript">
				if('${param.searchType}' != '') {
					document.getElementById("searchType").value = '${param.searchType}';
				}
			</script>
			<input type="text" class="search__input" name="searchContent" value="${param.searchContent}" placeholder="Search">
		</form> 
	</div>
	<br> 
		<div align="right"> 
		<button type="button" class="btn btn-primary"
				onclick="location.href='write.zips'"> 
				글쓰기
		</button> 
	</div> 
	<br>
	<div align="center">
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
				<a class="btn_worry mr10"><em class="off">판매중</em></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="detail.zips?shop_no=${shop.shop_no}">${shop.shop_subject}</a>
				</c:if> 
				<c:if test="${shop.shop_status == '1'}">
					<c:if test="${(shop.shop_seller_id == loginUser.id) || (shop.shop_buyer_id == loginUser.id)}">
					<a class="btn_worry mr10"><em class="oning">구매중</em></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="dealpage.zips?shop_no=${shop.shop_no}">${shop.shop_subject}</a>  
				    </c:if>
				      
					<c:if test="${(shop.shop_seller_id != loginUser.id) && (shop.shop_buyer_id != loginUser.id)}">    
					<a class="btn_worry mr10"><em class="oning">구매중</em></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="detail.zips?shop_no=${shop.shop_no}">${shop.shop_subject}</a>
					</c:if> 
				</c:if>
				
				<c:if test="${shop.shop_status == '2'}">
					<a class="btn_worry mr10"><em class="on">판매완료</em></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="detail.zips?shop_no=${shop.shop_no}">${shop.shop_subject}</a>
				</c:if>
				</td>	
				<td>${shop.shop_seller_id}</td>
				<td><fmt:formatDate value="${shop.shop_regdate}" pattern="YY-MM-dd"/></td>	
			</tr>
			</c:forEach>
			<tr align="center" height="26"><td colspan="5">
			<ul class="pagination justify-content-center">
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == pageNum}">
				<li class="page-item"><a class="page-link" href="javascript:list(${a})">${a}</a></li>
				</c:if>
				<c:if test="${a != pageNum}">
				<li class="page-item"><a class="page-link" href="javascript:list(${a})">${a}&nbsp;</a></li>
				</c:if>
				</c:forEach>
			</ul>
			</td></tr>
	</c:if>
	<c:if test="${listcount ==0}">
		<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
	</c:if>
	</table>
	</div>
</div>

</body>
</html>