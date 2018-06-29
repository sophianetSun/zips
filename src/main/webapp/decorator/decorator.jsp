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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/zipsboard.css">
  <title><decorator:title default="집에서 헬스하자 - zips" /></title>
  <decorator:head />
  <script>
  $(document).ready(function() {
  	$("#search_button").click(function() {
  		$("#search").submit();
  	})
	  
  });
  </script>
</head>
<body>
<!-- Header -->
<div class="row" style="margin-bottom:0">
  <div class="col-sm-10">
  <a href="${pageContext.request.contextPath }">
  	<img src="${pageContext.request.contextPath }/img/team.png" class="rounded main_logo" alt="teamlogo">
  </a> 
  </div>
<div class="col-sm-2 align-self-center">
<c:if test="${empty sessionScope.loginUser}">
  <a href="${pageContext.request.contextPath }/user/login.zips">로그인</a>
</c:if>
<c:if test="${!empty sessionScope.loginUser}">
  <a href="${pageContext.request.contextPath }/user/logout.zips">로그아웃</a>
</c:if>
  <a href="${pageContext.request.contextPath }/user/join.zips">회원가입</a>
  <a href="${pageContext.request.contextPath }/message">쪽지</a>
  <br>
  <form action="${pageContext.request.contextPath }/search.zips" method="POST" id="search">
  	<input type="text" name="query">
  	<a href="#" id="search_button"><i class="fa fa-search"></i>&nbsp;&nbsp;Search</a>
  </form>
</div>
<div class="col-sm-12">
  <h4><p class="text-info text-center"><strong>집</strong>에서 헬<strong>스</strong>하자!</p></h4>
</div>
</div>
	 
<!-- Navi -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
 <a class="navbar-brand" href="#"></a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
 <span class="navbar-toggler-icon"></span>
 </button>
 <div class="collapse navbar-collapse justify-content-around" id="collapsibleNavbar">
 <ul class="navbar-nav">
  <li class="nav-item">
   <a class="nav-link" href="${pageContext.request.contextPath }/board/list.zips">홈트게시판</a>
  </li>
  <li class="nav-item">
   <a class="nav-link" href="#">Question&amp;Answer</a>
  </li>
  <li class="nav-item">
   <a class="nav-link" href="#">자유게시판</a>
  </li>    
  <li class="nav-item">
   <a class="nav-link" href="#">Before&amp;After</a>
  </li>    
  <li class="nav-item">
   <a class="nav-link" href="${pageContext.request.contextPath }/shop/list.zips">중고장터</a>
  </li>    
 </ul>
</div>  
</nav>
<!-- Main  -->
<div class="container" style="margin-top:30px">
	<decorator:body/>
</div>
<!-- Footer -->
<footer class="jumbotron text-center" style="margin-bottom:0"> 
  <p>Powered by <a href="http://cafe.naver.com/itisgoodee" target="_blank" class="w3-hover-text-grey"><strong>GOODEE ACADEMY</strong></a></p>
</footer>
</body>
</html>