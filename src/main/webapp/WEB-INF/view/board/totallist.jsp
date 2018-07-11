<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<html>
<head>
<style type="text/css">

 em.off {
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
    
  em.on {
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

 em.oning {
    display: inline-block;
    border-radius: 3px;
    border: 1px solid #aaa;
    color: green;
    width: 50px;
    font-size: 11px;
    text-align: center;
    vertical-align: top;
    letter-spacing: -0.04em;
    }
    

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" type="text/css" />
		<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
		<script src="assets/js/jquery.shuffleLetters.js"></script>
        <script src="assets/js/script.js"></script>
<script type="text/javascript">
	// 스크립트 list function
	function list(pageNum) {
		var searchType = document.searchform.searchType.value;
		if(searchType == null || searchType.length == 0) {
			document.searchform.searchContent.value = "";
			document.searchform.pageNum.value = 1;
			location.href="totallist.zips?pageNum=" + pageNum+"&board_type="+${param.board_type};	
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
	        pool = "ㄱㅏㄴㅓㄷㅗㄻㅛㅄㅅㅇㄱㅈㅇㅊㄹㅋㅠㅍㅌㅎ123456789";
	    }
	    else if (type == "upperLetter"){
	        pool = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	    }
	    else if (type == "symbol"){
	        pool = ",.?/\\(^)![]{}*&^%$#'\"";
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

	    var container = $("#container")

	    container.shuffleLetters();

	    setTimeout(function(){

	        container.shuffleLetters({
	            "text": "Question & Answer"
	        });


	    },3000);

	});
	
	$(function(){

	    var container = $("#container2")

	    container.shuffleLetters();

	    setTimeout(function(){

	        container.shuffleLetters({
	            "text": "자유 게시판"
	        });


	    },3000);

	});
	
	$(function(){

	    var container = $("#container3")

	    container.shuffleLetters();

	    setTimeout(function(){

	        container.shuffleLetters({
	            "text": "Before & After"
	        });


	    },4000);

	});
</script>
</head>
<body>
<c:if test="${param.board_type == 2 }">
<div class="card mb-3">
  <div class="card-body" id="container"><h2 class="raindow">홈트레이닝 궁금증 시원하게 해결 !</h2>
   <!-- <h2 class="card-title rainbow" align="center" id="container" ></h2> -->
  </div>
  <div>
  <img class="card-img-right" src="../img/Q&A.jpg" style="width: 300px;height: 250px;" alt="Card image cap" id="changeimg">
  <img class="card-img-right" src="../img/qqqaaa.jpg" style="width: 300px;height: 250px; " alt="Card image cap">
</div>
</div>
</c:if>
<c:if test="${param.board_type == 3 }">
<h2 align="center" id="container2" class="rainbow">지금 이순간을 즐겨라 ! 스트레스를 날려버릴 아무말 대잔치</h2>
</c:if>
<c:if test="${param.board_type == 4 }">
<h2 align="center" id="container3" class="rainbow">자신감 뿜뿜!! 드라마보다 더 드라마틱한  다이어트 성공신화</h2>
</c:if>


<div class="container">

	<form action="totallist.zips?board_type=${param.board_type }" method="post" name="searchform" id="searchform" onsubmit="return list(1)">
			<input type="hidden" name="pageNum" value="1">
			 <div class="search__container" align="center">
			<select name="searchType" id="searchType" class="custom-select d-block" style="width:100px;height:40px;">
			<option value="subject">제목</option>
			<option value="board_userid">글쓴이</option>   
				</select>
				<br>
    <input class="search__input" type="text" name="searchContent" placeholder="Search" value="${param.searchContent}">
			</div>
		</form>
		<br><br>
	

<table class="table table-hover">

	<colgroup>
    		<col style="width: 5%;">
    		<col style="width: 30%">
    		<col style="width: 10%">
    		<col style="width: 20%">
    		<col style="width: 10%">
    		<col style="width: 10%">
    </colgroup>
			<tr>
				<th>카테고리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>글쓴이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>날짜</th>
				<th>조회수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<c:if test="${param.board_type == 3 || param.board_type == 4}">
				<th>추천수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				</c:if>
			</tr>
			<c:forEach var="board" items="${boardlist2}">
			<tr>
			<c:if test="${param.board_type == 2 }">
				<td>Q&A</td>
				</c:if>
				<c:if test="${param.board_type == 3 }">
				<td>자유</td>
				</c:if>
				<c:if test="${param.board_type == 4 }">
				<td>Before&After</td>
				</c:if>
				<td>
			<c:if test="${param.board_type == 2}">
			<c:choose>
			<c:when test="${board.board_apply == 0}">
			<a href="totallistForm.zips?num=${board.num}&pageNum=${pageNum}&board_type=${param.board_type}">${board.subject} &nbsp;&nbsp;&nbsp;<em class="off">고민중</em></a></td>
			</c:when>
			<c:when test="${board.board_apply == 1}">
 			<a href="totallistForm.zips?num=${board.num}&pageNum=${pageNum}&board_type=${param.board_type}">${board.subject} <em class="on">고민해결</em></a>
			</c:when>
			</c:choose>
			</c:if>
				<c:if test="${param.board_type == 3 || param.board_type == 4}">
				<a href="totallistForm.zips?num=${board.num}&pageNum=${pageNum}&board_type=${param.board_type}">${board.subject}</a></td>
				    </c:if>	
				<td>${board.board_userid}</td>
				<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd-HH:mm:ss"/></td>
				<td>${board.board_count }</td>
				<c:if test="${param.board_type == 3 || param.board_type == 4}">
				<td>${board.recommand }</td>
				</c:if>
			</tr>
			</c:forEach>
			<tr align="center" height="26"><td colspan="5">
				<c:if test="${pageNum > 1}"> 
					<a href="javascript:list(${pageNum - 1})">[이전]</a>
				</c:if>&nbsp;
				<c:if test="${pageNum <= 1}">[이전]</c:if>&nbsp;
				
				<c:forEach var="a" begin="${startpage2}" end="${endpage2}">
					<c:if test="${a == pageNum}">[${a}]</c:if>
					<c:if test="${a != pageNum}">
						<a href="javascript:list(${a})">[${a}]</a>
					</c:if>
				</c:forEach>
					<c:if test="${pageNum < maxpage2}">
						<a href="javascript:list(${pageNum + 1})">[다음]</a>
					</c:if>&nbsp;
					<c:if test="${pageNum >= maxpage2}">[다음]						
					</c:if>&nbsp;
				</td></tr>

				
	<c:if test="${listcount2 ==0}">
		<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
	</c:if>
	
	<tr><td align="right" colspan="4">
		<a href="boardwrite.zips?board_type=${param.board_type }">[글쓰기]</a></td></tr>
		<tr align="center" valign="middle">
</table>
</div>

</body>
</html>