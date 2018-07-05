<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>

  <h1><strong>회원 가입</strong></h1><br>
  <form:form modelAttribute="user" method="post" action="userEntry.zips" enctype="multipart/form-data">
  <form:hidden path="coin" value="500" />
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
  <img src="../img/join.png" id="img_ex" class="img-thumbnail" width="304" height="236"> 
            <br>
        <input type="file" id="file" name="pic" onchange="imageURL(this)"/>
      </div><br><br>
				
    <div class="mb-3">
              <label for="id" id="id">아이디</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="id" /></font>
              <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해 주세요">
            </div>
    <div class="row">
    <div class="col-md-6 mb-3">
                <label for="pw">비밀번호</label>
                <input type="password" class="form-control" name="pw" placeholder="비밀번호를 입력해 주세요"><!--  value="" required="" -->
              </div>
              <div class="col-md-6 mb-3">
                <label for="pwch">비밀번호 확인</label>
                <input type="password" class="form-control" name="pwch" placeholder="비밀번호입력을 위해 다시 한 번 입력해 주세요">
              </div>
            </div>
    <div class="mb-3">
              <label for="name">이름</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="name" /></font>
              <input type="text" class="form-control" name="name" placeholder="이름을 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="nickname">닉네임</label>
              <input type="text" class="form-control" name="nickname" placeholder="닉네임을 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="tel">연락처</label>
              <input type="text" class="form-control" name="tel" placeholder="연락처를 '010-0000-0000'형식으로 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="email">이메일</label>
              <input type="text" class="form-control" name="email" placeholder="이메일을  'zips@zips.com'형식으로 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="address">주소</label>
              <input type="text" class="form-control" name="address" placeholder="주소를 입력해 주세요">
            </div>
    <div class="row">
    <div class="col-md-6 mb-3">
                <label for="height">키</label>
                <input type="text" class="form-control" name="height" placeholder="cm"><!--  value="" required="" -->
              </div>
              <div class="col-md-6 mb-3">
                <label for="weight">몸무게</label>
                <input type="text" class="form-control" name="weight" placeholder="kg">
              </div>
            </div>
    <div class="mb-3">
              <label for="bodyfat">체지방</label>
              <input type="text" class="form-control" name="bodyfat" placeholder="체지방을 입력해 주세요">
            </div>
    <div class="mb-3">
              <label for="muscle">골격근량</label>
              <input type="text" class="form-control" name="muscle" placeholder="골격근량을 입력해 주세요">
            </div>
    <label for="gender">성별</label><br>
    <label class="radio-inline">
      <input type="radio" name="gender" value="남" checked>남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </label>
    <label class="radio-inline">
      <input type="radio" name="gender" value="여">여자
    </label>
 	<br><br>
    <input type="submit" class="btn btn-default btn-lg btn-block" value="회원가입">
    <br><br>
  </form:form>
</body>
</html>
