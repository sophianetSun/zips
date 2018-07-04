<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
<div>
  <h1><strong>마이 페이지</strong></h1><br>
  <form:form modelAttribute="user" method="post" action="update.zips" enctype="multipart/form-data">
  <form:hidden path="pic" />
	<spring:hasBindErrors name="user">
		<font color = "red">
			<c:forEach items = "${errors.globalErrors}" var="error">
				<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<style type="text/css">
		#preview img {
			width:304px;
			height:236px;
		}
	</style>
	
	<script type="text/javascript">
	$(document).ready(
		function() {
			$('#file').change(function() {
				addPreview($(this));
			});
		});
		function imageURL(input) {
			if(input.files && input.files[0]) {
				var reader = new FileReader();
				
				reader.onload = function(img) {
					$("#img_ex").attr("src",img.target.result)
				};
				reader.readAsDataURL(input.files[0]);
			}else alert('invalid file input');
		}
	</script>

  <div align="center">
	<c:if test="${empty loginUser.picture}"><td>사진없음</td></c:if>
   <c:if test="${!empty loginUser.picture}"><td align="center"><img src="../img/${loginUser.picture}" width="304" height="236" id="img_ex">
   </c:if>
   <br>
        <input type="file" id="file" name="pic" onchange="imageURL(this)" multiple/>
      </div><br><br>
    <div class="mb-3">
              <label for="id" id="id">아이디</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="id" /></font>
              <input type="text" class="form-control" name="id" id="id" readonly value="${loginUser.id}">
            </div>
    <div class="mb-3">
              <label for="pw">비밀번호</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="pw" /></font>
              <input type="password" class="form-control" name="pw" placeholder="회원정보를 변경하시려면 비밀번호를 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="name">이름</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="name" /></font>
              <input type="text" class="form-control" name="name" value="${loginUser.name}">
            </div>
    <div class="mb-3">
              <label for="nickname">닉네임</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="nickname" /></font>
              <input type="text" class="form-control" name="nickname" value="${loginUser.nickname}">
            </div>
    <div class="mb-3">
              <label for="tel">연락처</label>
              <input type="tel" class="form-control" name="tel" value="${loginUser.tel}">
            </div>
    <div class="mb-3">
              <label for="email">이메일</label>
              <input type="email" class="form-control" name="email" value="${loginUser.email}">
            </div>
    <div class="mb-3">
              <label for="address">주소</label>
              <input type="text" class="form-control" name="address" value="${loginUser.address}">
            </div>
    <div class="row">
    <div class="col-md-6 mb-3">
                <label for="height">키(cm)</label>
                <input type="text" class="form-control" name="height" value="${loginUser.height}"><!--  value="" required="" -->
              </div>
              <div class="col-md-6 mb-3">
                <label for="weight">몸무게</label>
                <input type="text" class="form-control" name="weight" value="${loginUser.weight}">
              </div>
            </div>
    <div class="mb-3">
              <label for="bodyfat">체지방</label>
              <input type="text" class="form-control" name="bodyfat" value="${loginUser.bodyfat}">
            </div>
    <div class="mb-3">
              <label for="muscle">골격근량</label>
              <input type="text" class="form-control" name="muscle" value="${loginUser.muscle}">
            </div>
    <label for="gender">성별</label><br>
    <label class="radio-inline">
      <input type="radio" name="gender" value="남">남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </label>
    <label class="radio-inline">
      <input type="radio" name="gender" value="여">여자
    </label>
 	<br><br>
 	<div align="center">
    <button type="submit" class="btn btn-default">수정하기</button>
	<input type="button" class="btn btn-default" value="탈퇴하기" onclick="location.href='delete.zips'">
    </div>
    <br><br>
  </form:form>
</div>
</body>
</html>