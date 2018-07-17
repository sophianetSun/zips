<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
   function inputcheck(f) {
	   if (f.pw.value != f.pwch.value) {
		   alert("비밀번호가 다릅니다.")
		   f.id.focus();
		   return false;
	   }
	   if (f.email.value == null) {
		   alert("이메일은 반드시 입력해 주세요. ID/PW분실시 필요합니다.")
		   f.id.focus();
		   return false;
	   }
   }
</script>
<!-- <style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
	.hn{font-family: 'Hanna', sans-serif;}
</style> -->
</head>
<body>
  <h1><strong>회원 가입</strong></h1><br>
  <form:form modelAttribute="user" method="post" action="userEntry.zips" enctype="multipart/form-data" onsubmit="return inputcheck(this)">
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
		.mb-3 {
			margin:0 auto;
		}
		.form-control {
			margin:0 auto;
		}
		.form-control {
			margin:0 auto;
		}
		.form-group {
			margin:0 auto;
		}
		.row {
			margin:0 auto;
		}
		.w3-row-padding {
			margin:0 auto;
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
		
		function execPostCode() {
	         new daum.Postcode({
	             oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                console.log(data.zonecode);
	                console.log(fullRoadAddr);
	                
	                
	                $("[name=addr1]").val(data.zonecode);
	                $("[name=addr2]").val(fullRoadAddr);
	                
	                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
	                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
	            }
	         }).open();
	     }
	</script>	
	
  <div align="center">
  <img src="../img/join.png" id="img_ex" class="img-thumbnail" width="304" height="236"> 
            <br>
        <input type="file" id="file" name="pic" onchange="imageURL(this)"/>
      </div><br><br>
				
    <div class="mb-3" style="width:600px;">
              <label for="id" id="id">아이디</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="id" /></font>
              <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해 주세요">
            </div>
    <div class="row" style="width:630px;">
    <div class="col-md-6 mb-3">
                <label for="pw">비밀번호</label>
                <input type="password" class="form-control" name="pw" placeholder="비밀번호">
              </div>
              <div class="col-md-6 mb-3">
                <label for="pwch">비밀번호 확인</label>
                <input type="password" class="form-control" name="pwch" placeholder="비밀번호확인">
              </div>
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="name">이름</label>&nbsp;&nbsp;&nbsp;<font color="red"><form:errors path="name" /></font>
              <input type="text" class="form-control" name="name" placeholder="이름을 입력해 주세요">
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="nickname">닉네임</label>
              <input type="text" class="form-control" name="nickname" placeholder="닉네임을 입력해 주세요">
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="tel">연락처</label>
              <input type="text" class="form-control" name="tel" placeholder="연락처를 '010-0000-0000'형식으로 입력해 주세요">
            </div>
        <div class="mb-3" style="width:600px;">
              <label for="email" style="width:600px;">이메일</label>
              <input type="email" class="form-control" name="email" placeholder="이메일을 zips@zips.com형식으로 입력해 주세요">
            </div>
    <div class="form-group" style="width:600px;">    
    	<label for="address">주소</label><br>          
		<input class="form-control" style="width: 70%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
    	<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button><br>                           
	</div><br>   
	<div class="form-group" style="width:600px;">
    	<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
	</div><br>
	<div class="form-group" style="width:600px;">
    	<input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
	</div><br>   
	
    <div class="row" style="width:630px;">
    <div class="col-md-6 mb-3">
                <label for="height">키</label>
                <input type="text" class="form-control" name="height" placeholder="cm"><!--  value="" required="" -->
              </div>
              <div class="col-md-6 mb-3">
                <label for="weight">몸무게</label>
                <input type="text" class="form-control" name="weight" placeholder="kg">
              </div>
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="bodyfat">체지방</label>
              <input type="text" class="form-control" name="bodyfat" placeholder="체지방을 입력해 주세요">
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="muscle">골격근량</label>
              <input type="text" class="form-control" name="muscle" placeholder="골격근량을 입력해 주세요">
            </div>
            <div class="mb-3" align="center"><br>
      <input type="radio" name="gender" value="남"checked>남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="gender" value="여">여자</div>
 	<br><br>
    <center><input type="submit" class="btn btn-default btn-lg btn-block" value="회원가입" style="width:300px;"></center>
    <br><br>
  </form:form>
</body>
</html>
