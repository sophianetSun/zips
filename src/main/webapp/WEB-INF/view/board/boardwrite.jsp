<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<link href="form-validation.css" rel="stylesheet">
<!-- Custom styles for this template -->
</head>

<body class="bg-center">

	<div class="container">
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4" src="../img/runicon.png" alt=""
				width="72" height="72">
			<p class="test">
				<I><span>홈 트레이닝&nbsp;</span></I>
			</p>
		</div>
	</div>
	<div class="jumbotron background:linear-gradient(to right, #1ddb16, #ffbb00); bg-success text-white"   
		 style="margin: auto;" >
		 
		<form:form modelAttribute="board" action="boardwrite.zips"
			method="post" enctype="multipart/form-data" name="f">
			<div align="left">
			<br>
				작성자
				<form:input path="board_userid" class="form-control"
					style="width:400px; height:40px;" readonly="true" value="회원에서 받아온 닉네임" />
				<font color="red"><form:errors path="board_userid" /></font>
			</div>
			<hr class="mb-4">
			<br>
			<div align="left">
				제목
				<form:input path="subject" placeholder="제목을 입력 해주세요."
					class="form-control" style=" width:400px; height:40px;" />
				<font color="red"><form:errors path="subject" /></font>
			</div>
			<hr class="mb-4">
			<div align="left">
				글내용 <span class="input-group-text"
					style="text-align: center; width: 230px; height: 40px;"><input
					type="file" name="filename"></span> <br>
				<form:textarea rows="15" cols="80" path="content"
					placeholder="여기는 홈 트레이닝 게시판입니다. 게시판 취지에 맞는 글만 올려주시고 너무 과한 노출,홍보성 글은 관리자의 의해 즉시 삭제 됩니다." />
				<font color="red"><form:errors path="content" /></font>
			</div>
			<hr class="mb-4">
			<center>
				<button class="btn btn-primary btn-block" type="submit"
					style="text-align: center; width: 270px; height: 45px;" onclick="javascript:alert('동영상 등록 완료');return true;">동영상
					업로드</button>
			</center>
		</form:form>
		<br>
	</div>
	<footer class="my-5 pt-5 text-muted text-center text-small">
	<p class="mb-1">&copy; 2017-2018 Zips</p>
	<ul class="list-inline">
		<li class="list-inline-item"><a href="#">www.zips.co.kr</a></li>
	</ul>
	</footer>
	</div>





	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write(
								'<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="../../assets/js/vendor/popper.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/vendor/holder.min.js"></script>
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
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
</body>
</html>