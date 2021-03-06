<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<link href="https://vjs.zencdn.net/7.0.5/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/ie8/ie8-version/videojs-ie8.min.js"></script>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" type="text/css" />
<script type="text/javascript">
function list(pageNum) {
	var searchType = document.searchform.searchType.value;
	var board_type = 1;
	if(searchType == null || searchType.length == 0) {
		document.searchform.searchContent.value = "";
		document.searchform.pageNum.value = "1";
		location.href="homeTraininglist.zips?pageNum=" + pageNum+"&board_type="+board_type;
	} else { document.searchform.pageNum.value = pageNum;
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
        "step"  : 8,    // How many times should the letters be changed
        "fps"   : 25,   // Frames Per Second
        "text"  : ""    // Use this text instead of the contents
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

        var types = [],
            letters = [];


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
                strCopy = str.slice(0); // Fresh copy of the string

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

    var container = $("#container4")

    container.shuffleLetters();

    setTimeout(function(){

        container.shuffleLetters({
            "text": "홈 트레이닝"
        });
       

    },4500);

});
</script>
</head>
<body>
<div class="bg-light mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
 <h1  class="testgreen" id="container4"><span>You are the most beautiful who try</span></h1>
  <br>
  <br>
        <div class="bg-white box-shadow mx-auto" style="width: 80%; height: 300px; border-radius: 21px 21px 0 0;" align="center">
  <img class="mySlides" src="../img/1-2.gif" style="width:30%">
  <img class="mySlides" src="../img/1-3.gif" style="width:30%">
  <img class="mySlides" src="../img/1-4.gif" style="width:30%">
  <img class="mySlides" src="../img/1-5.gif" style="width:30%">
        </div>
      </div>
      <BR>
<form action="homeTraininglist.zips?board_type=${param.board_type}" method="post" name="searchform" onsubmit="return list(1)">
<input type="hidden" name="pageNum" value="1">
 <div class="search__container" align="center">
<select name="searchType" id="searchType" class="custom-select d-block" style="width:100px;height:40px;">
<option value="subject">제목</option>
<option value="board_userid">글쓴이</option>   
</select>
<br>
    <input class="search__input" type="text" name="searchContent" placeholder="Search" value="${param.searchContent}">
</div>

<script type="text/javascript">
 if('${param.searchType}' != ''){
	document.getElementById("searchType").value='${param.searchType}'	 
 }
 var docWidth = $(card mb-4 box-shadow).width();
 
</script>
</form>

<ul>
<li><p class="testred test"><span>Best Hot 동영상  3 &nbsp;</span></p></li>
</ul>
<div class="album py-5 bg-light">
        <div class="container">
          <div class="row">
<c:forEach var="best" items="${Bestlist}" begin="0" end="2">
            <div class="col-md-4 test">
              <div class="card mb-4 box-shadow">
               <video width="docWidth" height="174" class="video-js" controls>
 	 		<source src="../img/${best.fileurl}" type="video/mp4">
				</video>
                <div class="card-body">
                  <p class="card-text">&nbsp;&nbsp;<a href="homeTraininglistForm.zips?num=${best.num}&pageNum=${pageNum}&board_type=${best.board_type}">
                   ${best.subject }</a>&nbsp;&nbsp;<span class="badge badge-pill badge-danger">HOT</span></p>
                   <hr>
                  <div class="d-flex justify-content-between align-items-center">
                  
					<small class="text-muted"><c:if test="${best.moddate != null }">등록일 :<fmt:formatDate value="${best.moddate}" pattern="yyyy-MM-dd-HH:mm:ss"/></c:if>
					<c:if test="${best.moddate == null }"><fmt:formatDate value="${best.regdate}" pattern="yyyy-MM-dd-HH:mm:ss"/></c:if>
					<br>
					작성자 :${best.board_userid}
					<br>
					조회수 :${best.board_count} 
					<br>
                    <div class="btn-group">
                      <button type="submit" class="best btn btn-sm btn-outline-primary" style="width: 72px;height: 27px;" disabled="disabled"><small>추천 <font color="red">♥
                      <span class="badge badge-light">&nbsp;${best.recommand}</span></font></small></button>
					<button type="button" class="btn btn-sm btn-outline-danger" style="width: 72px;height: 27px;" disabled="disabled"><small>▶ 구독 <font color="red"></font></small></button>
                    </div>
                   </small>
                  </div>
                </div>
              </div>
            </div>
</c:forEach>
</div>
</div>
</div>

<hr>
 <div class="album py-5 bg-light">
        <div class="container">
          <div class="row">
<c:forEach var="board" items="${boardlist}">
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">
               <video width="docWidth" height="174" class="video-js"  controls>
 	 		<source src="../img/${board.fileurl}" type="video/mp4">
				</video>
                <div class="card-body">
                  <p class="card-text">&nbsp;&nbsp;<a href="homeTraininglistForm.zips?num=${board.num}&pageNum=${pageNum}&board_type=${param.board_type}"
                   >${board.subject }</a></p>
                   <hr>
                  <div class="d-flex justify-content-between align-items-center">
                  
					<small class="text-muted"><c:if test="${board.moddate != null }">등록일 :<fmt:formatDate value="${board.moddate}" pattern="yyyy-MM-dd-HH:mm:ss"/></c:if>
					<c:if test="${board.moddate == null }"><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd-HH:mm:ss"/></c:if>
					<br>
					작성자 :${board.board_userid}
					<br>
					조회수 :${board.board_count} 
					<br>
                    <div class="btn-group">
                      <button type="submit" class="best btn btn-sm btn-outline-primary" style="width: 72px;height: 27px;" disabled="disabled"><small>추천<font color="red">♥
                      <span class="badge badge-light">${board.recommand}</span></font></small></button>
					<button type="button" class="btn btn-sm btn-outline-danger" style="width: 72px;height: 27px;" disabled="disabled"><small>▶ 구독 <font color="red"></font></small></button>
                    </div>
                   </small>
                  </div>
                </div>
              </div>
            </div>
</c:forEach>


            </div>
            </div>
            </div>
            <br>
<ul class="pagination justify-content-center">
<%-- <c:if test="${pageNum <= 1}"><button type="button" class="btn btn-info">이전</button></c:if>&nbsp; --%>
<c:forEach var="a" begin="${startpage}" end="${endpage}">
<c:if test="${a == pageNum}">
<li class="page-item"><a class="page-link" href="javascript:list(${a})">${a}</a></li>
</c:if>
<c:if test="${a != pageNum}">
<li class="page-item"><a class="page-link" href="javascript:list(${a})">${a}&nbsp;</a></li>
</c:if>
</c:forEach>
<%-- <c:if test="${pageNum < maxpage}">
<a href="javascript:list(${pageNum + 1})"><li><button type="button" class="btn btn-info">다음</button></li></a>
</c:if>
<c:if test="${pageNum > 1}">
<a href="javascript:list(${pageNum - 1})"><li><button type="button" class="btn btn-info">이전</button></li></a>
</c:if>&nbsp;
<c:if test="${pageNum >= maxpage}">
<li><button type="button" class="btn btn-info">다음</button></li></c:if>&nbsp; --%>
<c:if test="${listcount == 0}">
등록된 게시물이 없습니다
</c:if>
</ul>
<a href="boardwrite.zips?board_type=${param.board_type }"><button type="button" class="btn btn-success" style="width: 120px;height: 50px;">동영상 업로드</button></a>
<a href="homeTraininglist.zips?board_type=${param.board_type}"><button type="button" class="btn btn-primary" style="width: 120px;height: 50px;">목록</button></a>
<br>
<br>
<script type="text/javascript">

var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
</body>
</html>