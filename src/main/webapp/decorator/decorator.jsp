<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Encode+Sans+Condensed|Rokkitt" rel="stylesheet">
  <link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
  <link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Abel|Black+Han+Sans|Encode+Sans+Condensed|Gothic+A1|Nanum+Myeongjo|Rokkitt" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Abel|Black+Han+Sans|Encode+Sans+Condensed|Faster+One|Gothic+A1|Nanum+Myeongjo|Rokkitt" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/zipsboard.css">
  
  <title><decorator:title default="집에서 헬스하자 - zips" /></title>
  <decorator:head />
  <script>
  $(document).ready(function() {
  	$("#search_button").click(function() {

  </script>
  <style type="text/css">
  	body {
  		font-family: 'Noto Sans KR', sans-serif;
  	}
    p, h2, h5, h1, h4 {
    	font-family: 'Hanna', sans-serif;
    }
   .nav-link {
   		font-size: 120%;
   }
  </style>
</head>
<body>
<br>
<!-- Header -->
<div class="container">
<div class="row mb-0">
  <div class="col-sm-9">
  <a href="${pageContext.request.contextPath }">
  	<img src="${pageContext.request.contextPath }/img/team.png" class="rounded main_logo" alt="teamlogo">
  </a> </div><br>
<div class="col-sm-3 align-self-center">
<c:if test="${!empty loginUser }"><strong>${loginUser.nickname }(${loginUser.id })</strong> 님 환영합니다!!</c:if><br>
<c:if test="${empty sessionScope.loginUser}">
  <a href="${pageContext.request.contextPath}/user/join.zips">회원가입</a></c:if>
<c:if test="${empty sessionScope.loginUser}">
  <a href="${pageContext.request.contextPath}/user/login.zips">로그인</a>
</c:if>
<c:if test="${!empty sessionScope.loginUser}">
  <a href="${pageContext.request.contextPath}/user/logout.zips">로그아웃</a></c:if>
  
<c:if test="${!empty sessionScope.loginUser }">
	<a href="${pageContext.request.contextPath}/user/mypage.zips">마이페이지</a>
	<a href="${pageContext.request.contextPath }/message.zips"><i class="fa fa-envelope" style="font-size:20px"></i></a>
	<a href="${pageContext.request.contextPath}/calendar.zips"><i class="fa fa-calendar" style="font-size:20px"></i></a>	 
</c:if>
  <form action="${pageContext.request.contextPath }/search.zips" method="POST" id="search">
<div class="input-group">  	
  	<input type="text" name="query">
  	<div class="input-group-append">
  	<span class="input-group-text">
  	<a href="#" id="search_button"><i class="fa fa-search"></i></a></span>
  	</div>
</div><br>
  </form>
</div>
<br>
</div>
</div>
<div align="center">
<ul class="nav nav-tabs nav-justified" style="width:2100px" >
    <li class="nav-item">
      <a class="nav-link disabled"></a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled"></a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="${pageContext.request.contextPath }/board/homeTraininglist.zips?board_type=1">홈트게시판</a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="${pageContext.request.contextPath }/board/totallist.zips?board_type=2">질문과답변</a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="${pageContext.request.contextPath }/board/totallist.zips?board_type=3">자유게시판</a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="${pageContext.request.contextPath }/board/totallist.zips?board_type=4">Before&amp;After</a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="${pageContext.request.contextPath }/shop/list.zips">중고장터</a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled"></a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled"></a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled"></a>
    </li>
 </ul>
 </div>
<br><!-- Main  -->
<div class="container pt-1 pb-2">
	<decorator:body/>
</div>
<!-- Footer -->
<footer class="jumbotron text-center mb-0"> 
  <p>Powered by <a href="http://cafe.naver.com/itisgoodee" target="_blank" class="w3-hover-text-grey"><strong>GOODEE ACADEMY</strong></a></p>
</footer>
</body>
</html>