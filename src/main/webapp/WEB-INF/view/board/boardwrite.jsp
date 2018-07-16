<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC>
<html>
<link href="form-validation.css" rel="stylesheet">
</head>

<body class="bg-center">
	<div class="container">
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4" src="../img/runicon.png" alt=""
				width="72" height="72">
			<p class="test">
				<I><span>글 쓰기 &nbsp;</span></I>
			</p>
		</div>
	</div>
	<div class="jumbotron style=" margin:auto;" >

		<form:form modelAttribute="board"
			action="boardwrite.zips?board_type=${param.board_type}" method="post"
			enctype="multipart/form-data" name="f">
			<div align="left">
				<br>
				<div class="col-md-6">
					<div class="card flex-md-row mb-4 box-shadow h-md-200"
						style="width: 840px; height: 250px;">
						<div class="card-body d-flex flex-column align-items-start">
							<small class="d-inline-block mb-10 text-danger">필수입력사항 *</small>
							
							<h6 class="mb-100">
								<strong>작성자</strong>
								<form:input path="board_userid" class="form-control"
									style="width:400px; height:40px;" readonly="true"
									value="${sessionScope.loginUser.id}" />
								<font color="red"><form:errors path="board_userid" /></font>
							</h6>
							<hr style="background-color: red">
							<small class="d-inline-block mb-10 text-danger">필수입력사항 *</small>
							
							<div class="mb-1 text-muted">
								<strong>제목</strong>
							</div>
							<p class="card-text mb-auto">
								<form:input path="subject" placeholder="제목을 입력 해주세요."
									class="form-control" style=" width:400px; height:40px;" />
								<font color="red"><form:errors path="subject" /></font>
							</p>
						</div>
					</div>
				</div>
			</div>
			
			<hr class="mb-4">
			<div class="col-md-6">
				<div class="card flex-md-row mb-4 box-shadow h-md-200"
					style="width: 840px; height: 600px;">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-10 text-success">본문</strong> <small
							class="d-inline-block mb-10 text-danger">필수입력사항 *</small>

						<h3 class="mb-100">
							<a class="text-dark">글 내용</a>
						</h3>
						<%-- <div class="mb-1 text-muted"><span class="input-group-text"
					style="text-align: center; width: 230px; height: 40px;">
					<img src="../img/video.png" style="height: 50px;width: 50px;">
					<form:input path="filename" type="file" id="ex_file"/>
					<font color="red"><form:errors path="filename" /></font>
					<img src="../img/1-7.png" width="200px" height="200px" hspace="5">&nbsp;&nbsp;
					</span></div>
					<br> --%>


						<c:if test="${param.board_type == 4 }">
							<div class="mb-1 text-muted">
							<input type=file name='beforefile' style='display: none;'  multiple="multiple"> 
 							<img src='../img/beforeimg-1.PNG' style="width: 200px;height: 150px;" border='1' hspace="5" onclick='document.all.beforefile.click(); document.all.beforefile2.value=document.all.beforefile.value' class="w3-circle" > 
 							<input type='text' name='beforefile2' id='beforefile2' readonly="readonly" style='display: none;'> 
							<img src="../img/1-9.png" style="width: 120px;height: 120px;">
							<input type=file name='afterfile' style='display: none;'  multiple="multiple"> 
 							<img src='../img/after-1.jpg' style="width: 200px;height: 150px;" border='1' hspace="5" onclick='document.all.afterfile.click(); document.all.afterfile2.value=document.all.afterfile.value' class="w3-circle" > 
 							<input type='text' name='afterfile2' id='afterfile2' readonly="readonly" style='display: none;'> 
							</div>
							<br>
							<br>
							<form:textarea rows="15" cols="80" path="content" id="textarea" />
							<font color="red"><form:errors path="content" /></font>
					</div>
					</c:if>
					<c:if
						test="${param.board_type == 1 || param.board_type == 2 || param.board_type == 3}">
						<form:textarea rows="15" cols="80" path="content" id="textarea" />
						<font color="red"><form:errors path="content" /></font>
					</c:if>
				</div>
			</div>
	</div>
	<hr>
	<center>
		<c:if test="${param.board_type == 1}">
			<a href="javascript:board_submit()"><button
					class="btn btn-primary btn-block" type="button"
					style="text-align: center; width: 270px; height: 45px;">동영상
					업로드</button></a>
		</c:if>

		<c:if test="${param.board_type == 2 || param.board_type == 3}">
			<button class="btn btn-primary btn-block" type="submit"
				style="text-align: center; width: 270px; height: 45px;">글
				업로드</button>
		</c:if>
		<c:if test="${param.board_type == 4}">
			<button class="btn btn-primary btn-block" type="submit"
				style="text-align: center; width: 270px; height: 45px;">사진
				업로드</button>
		</c:if>
	</center>
	</form:form>
	<br>
	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; 2017-2018 Zips</p>
		<ul class="list-inline">
			<li class="list-inline-item"><a href="#">www.zips.co.kr</a></li>
		</ul>
	</footer>

	<script>
	$(function(){
	    $("input[type=file]").filestyle({ 
	   image: "../img/video.png",
	   imageheight : 20,
	  imagewidth : 58,
	  marginleft : 7,
	   width: 240
	   });
	 });
		function board_submit() {
			var file = filename.value.split(".");
			if (file[1] == null) {
				alert('동영상 파일을 꼭 올려주셔야 업로드가 가능합니다\n동영상 확장자 파일은 "mp4"만 가능합니다')
				return false;
			} else if (file[1] == "mp4") {
				f.submit();
			} else if (file[1] != "mp4") {
				alert('동영상 파일만 업로드 가능합니다. 파일을 확인하세요\n동영상 확장자 파일은 "mp4"만 가능합니다')
				f.filename.focus();
				return false;
			}
			/* var trans_text = document.getElementById("textarea");
			trans_text.value =  $('#textarea').val().replace(/\n/g,"<br>"); */
		}
		window.jQuery
				|| document
						.write(
								'<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
						(
								function() {
									'use strict';

									window
											.addEventListener(
													'load',
													function() {
														// Fetch all the forms we want to apply custom Bootstrap validation styles to
														var forms = document
																.getElementsByClassName('needs-validation');

														// Loop over them and prevent submission
														var validation = Array.prototype.filter
																.call(
																		forms,
																		function(
																				form) {
																			form
																					.addEventListener(
																							'submit',
																							function(
																									event) {
																								if (form
																										.checkValidity() === false) {
																									event
																											.preventDefault();
																									event
																											.stopPropagation();
																								}
																								form.classList
																										.add('was-validated');
																							},
																							false);
																		});
													}, false);
								})();
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script language="javascript" src="/js/jquery.filestyle.js"></script>
	<script src="../../assets/js/vendor/popper.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/vendor/holder.min.js"></script>
</body>
</html>