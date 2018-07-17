<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<div>
  <h1><strong>마이 페이지</strong></h1><br>
  <form:form modelAttribute="user" method="post" action="update.zips" enctype="multipart/form-data">
  <input type="hidden" name="${dbuser.picture}" value="${dbuser.picture}">
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
	</style>
 <script type="text/javascript">
 $(document).ready(/* ready : mypage가 실행될 때 바로 실행되는 것 */
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
  <div align="center"><!-- test : 문자의 참거짓을 판별하는 조건식 -->
 <c:if test="${empty dbuser.picture}"><td align="center"><img src="../img/join.png" width="304" height="236" id="img_ex"></c:if>
   <c:if test="${!empty dbuser.picture}"><td align="center"><img src="../img/${dbuser.picture}" width="304" height="236" id="img_ex"></c:if>
   <br>
        <input type="file" id="file" name="pic" onchange="imageURL(this)"  value="${dbuser.picture}"/><!-- this : 자기 자신을 넣을것이다. -->
		현재 파일명 : <input type="text" id="picture" name="picture" value="${dbuser.picture}">
      </div><br><br>
    <div class="mb-3" style="width:600px;">
              <label for="id" id="id">아이디</label>
              <input type="text" class="form-control" name="id" id="id" readonly value="${dbuser.id}">
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="pw" style="width:600px;">비밀번호 <input type="button" name="pwchange" id="pwchange" onclick="location.href='pwchange.zips'" value="비밀번호수정"></label>
              <font color="red"><form:errors path="pw" /></font>
              <input type="password" class="form-control" name="pw" placeholder="회원정보를 변경하시려면 비밀번호를 입력해 주세요">
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="name" value="${dbuser.name}">
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="nickname" style="width:600px;">닉네임</label>
              <input type="text" class="form-control" name="nickname" value="${dbuser.nickname}">
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="tel" style="width:600px;">연락처</label>
              <input type="tel" class="form-control" name="tel" value="${dbuser.tel}">
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="email" style="width:600px;">이메일</label>
              <input type="email" class="form-control" name="email" value="${dbuser.email}">
            </div>
            
<div class="mb-3" style="width:600px;">
              <label for="address">주소</label>
              <input type="text" class="form-control" name="address" value="${dbuser.address}">
            </div>
            
     <div class="form-group" style="width:600px;">    
    	<label for="address">주소변경하기</label><br>          
		<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
    	<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 주소 변경하기</button>                               
	</div><br>
	
	<div class="form-group" style="width:600px;">
    	<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
	</div><br>
	<div class="form-group" style="width:600px;">
    	<input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text" />
	</div><br>
	
	 <div class="row" style="width:630px;">
    	<div class="col-md-6 mb-3" style="width:600px;">
                <label for="height">키(cm)</label>
                <input type="text" class="form-control" name="height" value="${dbuser.height}"><!--  value="" required="" -->
              </div>
              <div class="col-md-6 mb-3" style="width:600px;">
                <label for="weight">몸무게(kg)</label>
                <input type="text" class="form-control" name="weight" value="${dbuser.weight}">
              </div>
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="bodyfat">체지방(kg)</label>
              <input type="text" class="form-control" name="bodyfat" value="${dbuser.bodyfat}">
            </div>
    <div class="mb-3" style="width:600px;">
              <label for="muscle">골격근량(kg)</label>
              <input type="text" class="form-control" name="muscle" value="${dbuser.muscle}">
            </div>
 
 <div class="mb-3" align="center">
 <br>
    <c:if test="${dbuser.gender=='남'}">
	    <input type="radio" name="gender" value='남' checked="checked">남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="radio" name="gender" value='여'>여자<br />
 	</c:if>
    <c:if test="${dbuser.gender=='여'}">
	    <input type="radio" name="gender" value='남'>남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="radio" name="gender" value='여' checked="checked">여자<br />
	</c:if></div>
  <br><br>
  <div align="center">
  <c:if test="${sessionScope.loginUser.id == 'admin'}">
<input type="button" class="btn btn-default" value="&nbsp;관리자 &nbsp;" onclick="location.href='admin.zips'"></c:if>
    <button type="submit" class="btn btn-default">수정하기</button>
 <input type="button" class="btn btn-default" value="탈퇴하기" onclick="location.href='delete.zips'">
 <input type="button" class="btn btn-default" value="내게시물" onclick="location.href='sublist.zips?subtype=user'">
    </div>
    <br><br>
  </form:form>
</div>
</body>
</html> 