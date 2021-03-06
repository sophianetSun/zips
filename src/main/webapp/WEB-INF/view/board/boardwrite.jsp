<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC>
<html>
<link href="form-validation.css" rel="stylesheet">
<head>
<script type="text/javascript">
function board_submit() {
			var file = document.all.filename.value.split(".");
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
		}

</script>
</head>

<body class="bg-center">

	<div class="py-5 text-center">
		<img class="d-block mx-auto mb-4" src="../img/runicon.png" alt=""
			width="72" height="72">
	</div>
	<div class="jumbotron style="margin:auto;" >

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
						<c:if test="${param.board_type == 4 }">
						<div class="row">
							<div class="col-lg-4" align="center">
							<img class="rounded-circle" src='../img/beforeimg-1.PNG'
								border='1' hspace="5"
								onclick='document.all.beforefile.click(); document.all.beforefile2.value=document.all.beforefile.value'
								alt="Generic placeholder image"
								style="width: 150px; height: 150px;">
							<input type=file name='beforefile' style='display: none;'
								multiple="multiple">
							<h2>Before</h2>
							<p>&nbsp;&nbsp;Before 이미지를 클릭해 사진을 등록 해주세요.</p>
							</div>
					<img src="../img/1-9.png" style="width: 200px;" height="200px;">
					<div class="col-lg-4" align="center">
						<img class="rounded-circle" src='../img/after-1.jpg'
							style="width: 150px; height: 150px;" border='1' hspace="5"
							onclick='document.all.afterfile.click(); document.all.afterfile2.value=document.all.afterfile.value'
							alt="Generic placeholder image">
						<input type=file name='afterfile' style='display: none;'
							multiple="multiple"> <input type='text' name='afterfile2'
							id='afterfile2' readonly="readonly" style='display: none;'>
						<h2>After</h2>
						<p>&nbsp;&nbsp;After 이미지를 클릭해 사진을 등록 해주세요.</p>
					</div>
				</div>
						<br><br>
						<h3 class="mb-100">
							<strong class="d-inline-block mb-10 text-success">Before & After 후기</strong>
						</h3>
						<textarea id="text" name="content" rows="2" style="overflow: hidden; word-wrap: break-word; resize: none; height: 160px; "></textarea>
			</c:if>
	<c:if test="${param.board_type == 1 || param.board_type == 2 || param.board_type == 3}">
		<div class="mb-1 text-muted"><br>
			<input type=file name='filename' onchange='document.all.filename2.value=document.all.filename.value' style="display: none;">
			<input type='text' name='filename2' readonly="readonly" style="display: none;">
			<img src='../img/video.png' style="width: 200px; height: 150px;" border='1' hspace="5"
				onclick='document.all.filename.click()' class="w3-circle"> 
				<br><br>
				<p>이미지를 클릭해 사진이나 동영상을 등록해주세요</p>
		<br>
		<h3 class="mb-100">
		<strong class="d-inline-block mb-10 text-success">글 설명</strong>
		</h3>
	<textarea id="text" name="content" rows="15" cols="70" style="overflow: hidden; word-wrap: break-word; resize: none; height: 160px; " wrap="hard"></textarea>
	
	</c:if>
			</div>
			</div>
	</div>
	<center>
	<c:choose>
	<c:when test="${param.board_type == 1}">
		<a href="javascript:board_submit()"><button
					class="btn btn-primary btn-block" type="button"
					style="text-align: center; width: 270px; height: 45px;">동영상
					업로드</button></a>
	</c:when>
	<c:when test="${param.board_type == 2 || param.board_type == 3}">
		<button class="btn btn-primary btn-block" type="submit"
				style="text-align: center; width: 270px; height: 45px;">글
				업로드</button>
	</c:when>
	<c:when test="${param.board_type == 4}">
	<button class="btn btn-primary btn-block" type="submit"
				style="text-align: center; width: 270px; height: 45px;">사진
				업로드</button>
	</c:when>
	</c:choose>
	</center>
	</form:form>
	</div>
	</div>
	<br>
	<script>
			var trans_text = document.getElementById("textarea");
			trans_text.value =  $('#textarea').val().replace(/\n/g,"<br>"); 
			
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script language="javascript" src="/js/jquery.filestyle.js"></script>
	<script src="../../assets/js/vendor/popper.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/vendor/holder.min.js"></script>
</body>
</html>