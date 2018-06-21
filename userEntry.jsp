<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사용자 등록</title>
</head>
<body>
<h2>사용자 등록</h2>
<%-- modelAttribute="user" : UserEntryController에서 전달해준 뷰에 전달된 객체
모델애트리뷰트를 쓰기위해선 유저객체를 써야한다? 여기서 가져온 유저가 modelAttribute="user" logic.User기 때문에 이름을 맞추고 컨트롤러에 생성한 User객체를 가져온거기때문에
"user"를 쓴거다 new User를 소문자로 쓴거다 
   --%>
<form:form modelAttribute="user" method="post" action="userEntry.shop">
<spring:hasBindErrors name="user">
<font color="red">
<%-- UserValidator에서 가져온 errors.reject에 등록된 값 --%>
<c:forEach items="${errors.globalErrors}" var="error">
<spring:message code="${error.code }"/>
</c:forEach>
</font>
</spring:hasBindErrors>
<table>
<%--  modelAttribute="user"의 get프로퍼티를 가져온다   form:input path="userid"  --%>
<tr height="40px"><td>아이디</td><td><form:input path="userid"/>
<font color="red"><form:errors path="userid" /></font></td></tr>
<tr height="40px"><td>비밀번호</td><td><form:password path="password"/>
<font color="red"><form:errors path="password"/></font></td></tr>
<tr height="40px"><td>이름</td><td><form:input path="userName"/>
<font color="red"><form:errors path="userName"/></font></td></tr>
<tr height="40px"><td>전화번호</td><td><form:input path="phoneNo"/>
<font color="red"><form:errors path="phoneNo"/></font></td></tr>
<tr height="40px"><td>우편번호</td><td><form:input path="postcode"/>
<font color="red"><form:errors path="postcode"/></font></td></tr>
<tr height="40px"><td>주소</td><td><form:input path="address"/>
<font color="red"><form:errors path="address"/></font></td></tr>
<tr height="40px"><td>Email</td><td><form:input path="email"/>
<font color="red"><form:errors path="email"/></font></td></tr>
<tr height="40px"><td>생년월일</td><td><form:input path="birthDay"/>
<font color="red"><form:errors path="birthDay"/></font></td></tr>
<tr height="40px"><td colspan="2" align="center">
<input type="submit" value="등록"><input type="reset" value="리셋"></td></tr>
</table>
</form:form>
</body>
</html>