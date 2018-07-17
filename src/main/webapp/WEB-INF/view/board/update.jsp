<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<script>
		function file_delete() {
			document.f.file2.value="";
			file_desc.style.display = "none";	// 파일 내용이 안보이게 됨
		}
		
		var trans_text = document.getElementById("textarea");
		trans_text.value =  $('#textarea').val().replace(/\n/g,"<br>"); 
		
		function board_submit() {
					var file = filename2.value.split(".");
					if (file[1] == null) {
						console.log("첫번째"+file[1])
						alert('동영상 파일을 꼭 올려주셔야 업로드가 가능합니다\n동영상 확장자 파일은 "mp4"만 가능합니다')
						return false;
					} else if (file[1] == "mp4") {
						console.log("두번째"+file[1])
						alert('fewkjfiewjfoiewfjeoi')
						f.submit();
					} else if (file[1] != "mp4") {
						console.log("세번째"+file[1])
						alert('동영상 파일만 업로드 가능합니다. 파일을 확인하세요\n동영상 확장자 파일은 "mp4"만 가능합니다')
						f.filename.focus();
						return false;
					}
				}
	</script>
</head>
<body>
<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4" src="../img/runicon.png" alt=""
				width="72" height="72">
		</div>
<div class="jumbotron style="margin: auto;" >
	<form:form modelAttribute="board" action="update.zips?num=${param.num }&board_type=${param.board_type}&pageNum=${paramNum}" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="num" value="${board.num }">
		<input type="hidden" name="file2" value="${board.fileurl}">
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<div align="left">
			<br>
			<div align="left">
			<br>
			<div class="col-md-6">
          <div class="card flex-md-row mb-4 box-shadow h-md-200" style="width: 840px;height:250px; ">
            <div class="card-body d-flex flex-column align-items-start">
              <small class="d-inline-block mb-10 text-danger">필수입력사항 *</small>
              <h6 class="mb-100">
				<strong>작성자</strong>
				<form:input path="board_userid" class="form-control"
					style="width:400px; height:40px;" readonly="true" value="${board.board_userid }" />
				<font color="red"><form:errors path="board_userid" /></font></h6><hr style="background-color: red">
              <small class="d-inline-block mb-10 text-danger">필수입력사항 *</small>
              <div class="mb-1 text-muted"><strong>제목</strong></div>
              <p class="card-text mb-auto"><form:input path="subject" placeholder="제목을 입력 해주세요."
					class="form-control" style=" width:400px; height:40px;" />
				<font color="red"><form:errors path="subject" /></font></p>
            </div>
          </div>
        </div>
			</div>
			<hr class="mb-4">
			<div class="col-md-6">
          <div class="card flex-md-row mb-4 box-shadow h-md-200" style="width: 840px;height:600px; ">
            <div class="card-body d-flex flex-column align-items-start">
                <small class="d-inline-block mb-10 text-danger">필수입력사항 *</small>
				<c:if test="${param.board_type == 1 || param.board_type == 2 || param.board_type == 3}">
		<div class="mb-1 text-muted"><br>
			<input type=file name='filename' style='display: none;'><img
				src='../img/video.png' style="width: 200px; height: 150px;"
				border='1' hspace="5"
				onclick='document.all.filename.click(); document.all.filename2.value=document.all.filename.value'
				class="w3-circle"> <input type='text' name='filename2'
				id='filename2' readonly="readonly" style='display: none;'>
		<br>
		<h3 class="mb-100">
							<strong class="d-inline-block mb-10 text-success">글 설명</strong>
						</h3>
		<form:textarea rows="15" cols="80" path="content" id="textarea" />
		<font color="red"><form:errors path="content" /></font>
				
	</c:if>
            </div>
          </div>
        </div>
        </div>
			</div>
			<hr class="mb-4">
			<center>
			<c:if test="${param.board_type == 1 }">
					<a href="javascript:board_submit()"><button
					class="btn btn-primary btn-block" type="button"
					style="text-align: center; width: 270px; height: 45px;">동영상
					업로드</button></a>
					</c:if>
			<c:if test="${param.board_type == 2  || param.board_type == 3 || param.board_type == 4}">
				<button class="btn btn-primary btn-block" type="submit"
					style="text-align: center; width: 270px; height: 45px;" onclick="javascript:alert('글 수정 완료');return true;">
					글 업로드</button></c:if>
					
			</center>
	</form:form>
</body>
</html>