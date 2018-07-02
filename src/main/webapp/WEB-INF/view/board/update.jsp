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
	</script>
</head>
<body>
<div class="container">
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4" src="../img/runicon.png" alt=""
				width="72" height="72">
			<p class="test">
				<I><span>홈 트레이닝&nbsp;</span></I>
			</p>
		</div>
	</div>

<div class="jumbotron style="margin: auto;" >
	<form:form modelAttribute="board" action="update.zips?pageNum=${param.pageNum}" method="post" enctype="multipart/form-data" name="f">
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
					style="width:400px; height:40px;" readonly="true" value="회원에서 받아온 닉네임" />
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
              <strong class="d-inline-block mb-10 text-success">본문</strong>
                <small class="d-inline-block mb-10 text-danger">필수입력사항 *</small>
              <h3 class="mb-100">
                <a class="text-dark">글 내용</a>
              </h3>
              <div class="mb-1 text-muted"><span class="input-group-text"
					style="text-align: center; width: 230px; height: 40px;">
						<input type="file" name="filename" >
					<c:if test="${empty board.fileurl }">
					기존 파일 : 없음
					</c:if>
					</span> <br>
				<form:textarea rows="15" cols="80" path="content"
					placeholder="여기는 홈 트레이닝 게시판입니다. 게시판 취지에 맞는 글만 올려주시고 너무 과한 노출,홍보성 글은 관리자의 의해 즉시 삭제 됩니다." />
				<font color="red"><form:errors path="content" /></font></div>
            </div>
          </div>
        </div>
        </div>
			</div>
			<hr class="mb-4">
			<center>
				<button class="btn btn-primary btn-block" type="submit"
					style="text-align: center; width: 270px; height: 45px;" onclick="javascript:alert('동영상 수정 완료');return true;">동영상
					업로드</button>
			</center>
	</form:form>
</body>
</html>