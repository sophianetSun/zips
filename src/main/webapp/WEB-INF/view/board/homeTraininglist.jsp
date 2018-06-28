<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../css/zipsboard.css?ver=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
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
<ul>
<li><p class="circle"><img src="../img/runicon.png" width="72" height="72" class="w3-circle"></p></li>
<li><p class="test"><I><span>홈 트레이닝&nbsp;</span></I></p></li>
</ul>
<hr class="my-hr1">
<form action="homeTraininglist.zips" method="post" name="searchform" onsubmit="return list(1)">
<input type="hidden" name="pageNum" value="1">
<select name="searchType" id="searchType">
<option value="">선택하세요</option>
<option value="subject">제목</option>
<option value="name">글쓴이</option>   
</select>&nbsp;




<script type="text/javascript">
 if('${param.searchType}' != ''){
	document.getElementById("searchType").value='${param.searchType}'	 
 }
 var docHeight = $(card mb-4 box-shadow).height();
 var docWidth = $(card mb-4 box-shadow).width();
 
</script>
<input type="text" name="searchContent" value="${param.searchContent}">
<input type="submit" value="검색">
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
<input type="hidden" name="num" value="${board.num }">
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">
               <a href="hometraining.zips?num=${param.num}&board_type=${board.board_type}&=pageNum=${pageNum}">
               <video width="docWidth" height="174" controls>
 	 		<source src="mov_bbb.mp4" type="video/mp4">
 			 <source src="mov_bbb.ogg" type="video/ogg">
				</video></a>
                <div class="card-body">
                  <p class="card-text">&nbsp;&nbsp;<a href="homeTraininglistForm.zips?num=${board.num}&=pageNum=${pageNum}&board_type=${board.board_type}"
                   >${board.subject }</a></p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-primary">추천 <font color="red">♥</font> ${board.recommand }</button>
                    </div>
					<small class="text-muted">작성자 :${board.board_userid}
					<br>
					등록일 :<fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd-HH:mm:ss"/>
					<br>
					조회수 :${board.board_count}
                   </small>
                  </div>
                </div>
              </div>
            </div>
</c:forEach>
            </div>
            </div>
            </div>
<div align="center">
<ul class="pagination">
<%-- <c:if test="${pageNum <= 1}"><button type="button" class="btn btn-info">이전</button></c:if>&nbsp; --%>
<c:forEach var="a" begin="${startpage}" end="${endpage}">
<c:if test="${a == pageNum}">
<li><a href="javascript:list(${a})">${a}</a></li>
</c:if>
<c:if test="${a != pageNum}">
<li><a href="javascript:list(${a})">${a}&nbsp;</a></li>
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
</div>    
<a href="boardwrite.zips"><button type="button" class="btn btn-primary">글 작성</button></a>
<br>
<br>
</body>
</html>