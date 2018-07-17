<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

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

function list(pageNum) {
 var searchType = document.searchform.searchType.value;
 if(searchType == null || searchType.length == 0) {
  document.searchform.searchContent.value = "";
  document.searchform.pageNum.value = 1;
  location.href="admin.zips?pageNum="+pageNum;   
 } else {
  document.searchform.pageNum.value = pageNum;
  document.searchform.submit();
  return true;
 }
 return false;
}

 

 

 

</script>

</head>
<body>
<div class="w3-container">
  <h2>관리자 페이지</h2>
  <input type="hidden" name="pageNum" value="${pageNum}">
  <form action="admin.zips" method="post" name="searchform" id="searchform" onsubmit="return list(1)">
  <input type="hidden" name="pageNum" value="${pageNum}">
   <div align="center">
   <select name="searchType"  id="searchType" class="custom-select d-block" style="width:100px; height:40px;">
    <option value="id">ID</option>
    <option value="name">이름</option>
   </select>&nbsp;
   </div>
   <script type="text/javascript">
    if('${param.searchType}' != '') {
     document.getElementById("searchType").value = '${param.searchType}';
    }
   </script>
   <div align="center">
   <input type="text" class="search__input" name="searchContent" value="${param.searchContent}" placeholder="Search"></div>
  </form>


  <br><br><br>
 <c:forEach items="${userList}" var="user" varStatus="stat">
  
<ul class="w3-ul w3-card-4">
    <li class="w3-bar">
    <p align="right">
        <button class="w3-button w3-xlarge w3-circle w3-black" onclick="myFunction('Demo${stat.index}')">+</button></p>
  <form:form modelAttribute="user" method="post" action="adminUpdate.zips" enctype="multipart/form-data">
   <img src="../img/${user.picture}" class="w3-bar-item w3-circle w3-hide-small" style="width:100px; height:100px;">
      <div class="w3-bar-item">
        <span class="w3-large">[ ${user.name}/</span>
        <span class="w3-large">${user.id} ]님의 정보</span>
        <br>
        <div id="Demo${stat.index}" class="w3-container w3-hide">
        <table>
      <tr>
   <td rowspan="10" align="center" valign="bottom">
    <div align="center">
 <c:if test="${empty user.picture}"><td align="center"><img src="../img/join.png" width="280" height="300" id="img_ex"></c:if>
    <c:if test="${!empty user.picture}"><td align="center"><img src="../img/${user.picture}" width="280" height="300" id="img_ex"></c:if>
   <br>
        <input type="file" id="file" name="pic" onchange="imageURL(this)" value="${user.picture}"/>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현재파일<input type="text" id="picture" name="picture" value="${user.picture}">
      </div>
   </td>
   <td>
      
<div align="right">
  <table class="w3-table">
    <tr>
      <th>아이디(id)</th>
      <th></th>
      <th>이름(name)</th>
      <th></th>
    </tr>
    <tr>
      <td colspan="2"><input class="w3-input" type="text" value="${user.id}" id="id" name="id" readonly="readonly"></td>
      <td colspan="2"><input class="w3-input" type="text" value="${user.name}" id="name" name="name"></td>
    </tr>
    <tr>
      <th colspan="2">닉네임(nickname)</th>
      <th>연락처(phone)</th>
      <th></th>
    </tr>
    <tr>
      <td colspan="2"><input class="w3-input" type="text" value="${user.nickname}" id="nickname" name="nickname"></td>
      <td colspan="2"><input class="w3-input" type="text" value="${user.tel}" id="tel" name="tel"></td>
    </tr>
    <tr>
     <th>코인(coin)</th>
        <th></th>
        <th>포인트(point)</th>     
        <th></th>
    </tr>
    <tr>
      <td colspan="2"><input class="w3-input" type="text" value="${user.coin}" id="coin" name="coin"></td>
      <td colspan="2"><input class="w3-input" type="text" value="${user.point}" id="point" name="point"></td>
 </tr>
 <tr>
      <th>키(cm)</th>
      <th>몸무게(kg)</th>
      <th>체지방(kg)</th>
      <th>골격근(kg)</th>
    </tr>
    <tr>
      <td><input class="w3-input" type="text" value="${user.height}" id="height" name="height"></td>
      <td><input class="w3-input" type="text" value="${user.weight}" id="weight" name="weight"></td>
      <td><input class="w3-input" type="text" value="${user.bodyfat}" id="bodyfat" name="bodyfat"></td>
      <td><input class="w3-input" type="text" value="${user.muscle}" id="muscle" name="muscle"></td>
    </tr>
  </table>
</div>
</td>
</tr></table>
<br>
    <br>
    <table class="w3-table">
    <tr>
      <th>이메일(email)</th>
      <th>등록일자(reg)</th>
      <th>logdate</th>
      <th>성별(gender)</th>
    </tr>
    <tr>
     <td><input class="w3-input" type="text" value="${user.email}" id="email" name="email"></td>
     <td><input class="w3-input" type="text" value="${user.regdate}" id="regdate" name="regdate"></td>
     <td><input class="w3-input" type="text" value="${user.logdate}" id="logdate" name="logdate"></td>
     <td><c:if test="${user.gender=='남'}">
     <input type="radio" name="gender" value='남' checked="checked">남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="radio" name="gender" value='여'>여자<br />
  </c:if>
    <c:if test="${user.gender=='여'}">
     <input type="radio" name="gender" value='남'>남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <input type="radio" name="gender" value='여' checked="checked">여자<br />
 </c:if></td>
     </tr>
     </table>
    <table class="w3-table">
    <tr>
      <th colspan="4">주소(address)</th>
    </tr>
    <tr>
     <td colspan="4"><input class="w3-input" type="text" value="${user.address}" id="address" name="address"></td>
     </tr>
     </table>
    <table class="w3-table">
    <tr>
      <th colspan="3">주소변경하기(address change)</th>
      <th><div onclick="execPostCode();" align="right">
      [<i class="fa fa-search"></i> 변경]</div></th>
    </tr>
    <tr>
     <td><input class="w3-input" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" ></td>
     <td colspan="2"><input class="w3-input" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" /></td>
     <td><input class="w3-input" placeholder="상세주소" name="addr3" id="addr3" type="text" /></td>
     </tr>
     </table>
<br><div align="center">
<input type="submit" class="btn btn-default" value="회원수정하기">
<a href="adminDelete.zips?id=${user.id}" id="userAdminDelete">
<button type="button" class="btn btn-default">강제탈퇴하기</button></a>
<a href="onemail.zips?id=${user.id}">
<button type="button" class="btn btn-default">메일전송하기</button></a>
<!-- <button type="button" class="btn btn-default" onclick="sendmail()">메일전송하기</button> -->
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

<br>

<ul class="pagination justify-content-center">

   <c:forEach var="a" begin="${startpage}" end="${endpage}">
    <c:if test="${a == pageNum}">
    <li class="page-item"><a class="page-link" href="javascript:list(${a})">${a}</a></li>
    </c:if>
    <c:if test="${a != pageNum}">
    <li class="page-item"><a class="page-link" href="javascript:list(${a})">${a}&nbsp;</a></li>
    </c:if>
    </c:forEach>
   </ul>

<c:if test="${listcount == 0}">
등록된 게시물이 없습니다
</c:if>

            <br>

<br>
<br>
</div>
</body>
</html>