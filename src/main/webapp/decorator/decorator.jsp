<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<html lang="en">
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
  <link rel="stylesheet" type="text/css" href="../css/style.css">
  <decorator:title>집에서 헬스하자 - zips</decorator:title>
  <decorator:head/>
</head>
  <style>
body,h1 {font-family: "Raleway", Arial, sans-serif}
h1 {letter-spacing: 6px}
.w3-row-padding img {margin-bottom: 12px}
</style>
<body>
<!-- Header -->
<div class="jumbotron text-center" style="margin-bottom:0">
  <img src="../img/team.png" class="rounded" alt="teamlogo" width="200" height="150"> 
  <h4><p><p class="text-info"><strong>집</strong>에서 헬<strong>스</strong>하자!</p></h4>
</div>
	 
<!-- Navi -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark justify-content-center">
 <a class="navbar-brand" href="#"></a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
 <span class="navbar-toggler-icon"></span>
 </button>
 <div class="collapse navbar-collapse" id="collapsibleNavbar">
 <ul class="navbar-nav">
  <li class="nav-item">
   <a class="nav-link" href="#">홈트게시판</a>
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
   <a class="nav-link" href="#">중고장터</a>
  </li>    
  <li class="nav-item">
   <a class="nav-link" href="#">Join&amp;Login</a>
  </li>    
  <li class="nav-item">
   <a class="nav-link" href="#"><i class="fa fa-search"></i>&nbsp;&nbsp;Search</a>
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