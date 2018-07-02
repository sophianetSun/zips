<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function list(pageNum) {
	var searchType = document.searchform.searchType.value;
	if(searchType == null || searchType.length == 0) {
		document.searchform.searchContent.value = "";
		document.searchform.pageNum.value = "1";
		location.href="homeTraininglist.zips?pageNum=" + pageNum;
	} else { document.searchform.pageNum.value = pageNum;
			 document.searchform.submit();
			 return true;
	}
	return false;
}

</script>
</head>
<body>

 <div class="col-lg-4">
<div class="w3-content w3-section" style="max-width:300px">
  <img class="mySlides" src="../img/1-2.gif" style="width:50%">
  <img class="mySlides" src="../img/1-3.gif" style="width:50%">
  <img class="mySlides" src="../img/1-4.gif" style="width:50%">
  <img class="mySlides" src="../img/1-5.gif" style="width:50%">
            <!-- <img class="rounded-circle" src="../img/runicon.png" alt="Generic placeholder image" width="140" height="140"> -->
            <p class="test"><span><a href="homeTraininglist.zips">홈 트레이닝&nbsp;</a></span></p>
            <br>
            <small><br>여러분도 이제 혼자 운동하지 말고 <br>동영상을 올려서 운동정보를 공유해보세요 </small>
            <br>
          </div>
          </div>
<hr class="my-hr1">
<form action="homeTraininglist.zips" method="post" name="searchform" onsubmit="return list(1)">
<input type="hidden" name="pageNum" value="1">
 <div class="search__container" align="center">
<select name="searchType" id="searchType" class="custom-select d-block" style="width:100px;height:40px;">
<option value="subject">제목</option>
<option value="name">글쓴이</option>   
</select>
<br>
    <input class="search__input" type="text" name="searchContent" placeholder="Search" value="${param.searchContent}">
</div>

<script type="text/javascript">
 if('${param.searchType}' != ''){
	document.getElementById("searchType").value='${param.searchType}'	 
 }
 var docHeight = $(card mb-4 box-shadow).height();
 var docWidth = $(card mb-4 box-shadow).width();
 
</script>
</form>

<c:if test="${empty board.fileurl }">&nbsp;&nbsp;&nbsp;</c:if>
<c:if test="${not empty board.fileurl}">
<a href="../img/${board.fileurl}">@</a>
</c:if>

<ul>
<li><p class="testred"><I><span>Best Hot 동영상 &nbsp;</span></I></p></li>
</ul>
<c:forEach var="best" items="${recommandlist }" begin="0" end="2">
<div class="col-md-4">
              <div class="card mb-4 box-shadow">
               <video width="docWidth" height="174" controls>
 	 		<source src="mov_bbb.mp4" type="video/mp4">
 			 <source src="mov_bbb.ogg" type="video/ogg">
				</video>
                <div class="card-body">
                  <p class="card-text">&nbsp;&nbsp;<a href="homeTraininglistForm.zips?num=${board.num}&=pageNum=${pageNum}&board_type=${board.board_type}"
                   >${best.subject }</a></p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="fun-btn">추천 <font color="red">♥ :</font>${best.recommand }</button>
                    </div>
					<small class="text-muted">작성자 :${best.board_userid}
					<br>
					
					등록일 :<fmt:formatDate value="${best.regdate}" pattern="yyyy-MM-dd-HH:mm:ss"/>
					<br>
					조회수 :${best.board_count}
                   </small>
                  </div>
                </div>
              </div>
            </div>
</c:forEach>
<hr>
 <div class="album py-5 bg-light">
        <div class="container">
          <div class="row">

<c:forEach var="board" items="${boardlist}">
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">
               <video width="docWidth" height="174" controls>
 	 		<source src="mov_bbb.mp4" type="video/mp4">
 			 <source src="mov_bbb.ogg" type="video/ogg">
				</video>
                <div class="card-body">
                  <p class="card-text">&nbsp;&nbsp;<a href="homeTraininglistForm.zips?num=${board.num}&=pageNum=${pageNum}&board_type=${board.board_type}"
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
                      <button type="button" class="btn btn-sm btn-outline-primary" style="width: 72px;height: 27px;"><small>추천 <font color="red">♥<span class="badge badge-light">&nbsp;${board.recommand }</span></font></small></button>&nbsp;
                      <button type="button" class="btn btn-sm btn-outline-danger" style="width: 72px;height: 27px;"><small>▶ 구독 <font color="red"></font></small></button>
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
<a href="boardwrite.zips"><button type="button" class="btn btn-success" style="width: 120px;height: 50px;">동영상 업로드</button></a>
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