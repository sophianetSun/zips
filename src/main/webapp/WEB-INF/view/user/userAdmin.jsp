<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	}else alert('파일입력이 잘못되었습니다.');
}
			
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

function allchkbox(chk) {
		var chks = documemt.getElementsByName("idchks")
		for(var i=0; i<chks.length; i++) {
		chks[i].checked = chk.checked;
		}	
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

$(function(){
	  $('#userAdminDelete').click(function(event){
		  alert('회원삭제완료');
	  });
	});
</script>
</head>
<body>
<div class="w3-container">
  <h2>관리자 페이지</h2>
  <br><br><br>
	<c:forEach items="${userList}" var="user" varStatus="stat">
<ul class="w3-ul w3-card-4">
    <li class="w3-bar">
        <button class="w3-button w3-xlarge w3-circle w3-black" onclick="myFunction('Demo${stat.index}')">+</button>
  <form:form modelAttribute="user" method="post" action="adminUpdate.zips" enctype="multipart/form-data">
	 <img src="../img/${user.picture}" class="w3-bar-item w3-circle w3-hide-small" style="width:85px">
      <div class="w3-bar-item">
        <span class="w3-large" id="name">${user.name}/</span>
        <span class="w3-large" id="id">${user.id}</span>
        <br>
        <div id="Demo${stat.index}" class="w3-container w3-hide">
        <table>
      <tr>
   <td rowspan="10" align="center" valign="bottom">
				<div align="center">
	<c:if test="${empty user.picture}"><td align="center"><img src="../img/join.png" width="280" height="300" id="img_ex"></c:if>
    <c:if test="${!empty user.picture}"><td align="center"><img src="../img/${user.picture}" id="img_ex"></c:if>
   <br>
        <input type="file" id="file" name="pic" onchange="imageURL(this)" value="${dbuser.picture}"  id="picture"/>
      </div>
			</td>
			<td>
						
<div align="right">
  <table class="w3-table">
    <tr>
      <th>이름(name)</th>
      <th></th>
      <th>아이디(id)</th>
      <th></th>
    </tr>
    <tr>
      <td colspan="2"><input class="w3-input" type="text" value="${user.name}" id="name" name="name"></td>
      <td colspan="2"><input class="w3-input" type="text" value="${user.id}" id="id" name="id"></td>
    </tr>
    <tr>
      <th>닉네임(nick)</th>
      <th></th>
      <th>연락처(phone)</th>
      <th></th>
    </tr>
    <tr>
      <td colspan="2"><input class="w3-input" type="text" value="${user.nickname}" id="nickname" name="nickname"></td>
      <td colspan="2"><input class="w3-input" type="text" value="${user.tel}" id="tel" name="tel"></td>
    </tr>
    <tr>
    	<th>주소(address)</th>
        <th></th>
        <th></th>     
        <th><div onclick="execPostCode();" align="right">
      [<i class="fa fa-search"></i> 변경]</div></th>
    </tr>
    <tr>
   		
      <td colspan="4"><input class="w3-input" type="text" value="${user.address}" id="address" name="address"></td>
      <td></td>
      <td></td>
      <td></td>
	</tr>
	<tr>
      <th>키(height)</th>
      <th>몸무게(weight)</th>
      <th>체지방(bodyfat)</th>
      <th>골격근(muscle)</th>
    </tr>
    <tr>
      <td><input class="w3-input" type="text" value="${user.height}" id="height" name="heignt"></td>
      <td><input class="w3-input" type="text" value="${user.weight}" id="weight" name="weight"></td>
      <td><input class="w3-input" type="text" value="${user.bodyfat}" id="bodyfat" name="bodyfat"></td>
      <td><input class="w3-input" type="text" value="${user.muscle}" id="muscle" name="muscle"></td>
    </tr>
    <tr>
      <th>포인트(point)</th>
      <th></th>
      <th>코인(coin)</th>
      <th></th>
    </tr>
    <tr>
    	<td colspan="2"><input class="w3-input" type="text" value="${user.point}" id="point" name="point"></td>
        <td colspan="2"><input class="w3-input" type="text" value="${user.coin}" id="coin" name="coin"></td>
     </tr>
  </table>
</div>
</td>
</tr></table>
<br><div align="center">
<a href="adminUpdate.zips?id=${user.id}">
<button type="submit" class="btn btn-default">회원수정하기</button></a>
<a href="adminDelete.zips?id=${user.id}" id="userAdminDelete">
<button type="button" class="btn btn-default">강제탈퇴하기</button></a>
</div>
<br>
</div>
</div>
</form:form>
</li>
</ul>
<br>
</c:forEach>
<br>
<div align="center">
<button type="button" class="btn btn-default" onclick="location.href='mail.zips'">전체메일보내기</button>
<button type="button" class="btn btn-default" onclick="location.href='join.zips'">선택한회원탈퇴</button><br>
</div>
<br>
</div>
</body>
</html>
