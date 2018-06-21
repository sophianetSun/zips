<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����� ���</title>
</head>
<body>
<h2>����� ���</h2>
<%-- modelAttribute="user" : UserEntryController���� �������� �信 ���޵� ��ü
�𵨾�Ʈ����Ʈ�� �������ؼ� ������ü�� ����Ѵ�? ���⼭ ������ ������ modelAttribute="user" logic.User�� ������ �̸��� ���߰� ��Ʈ�ѷ��� ������ User��ü�� �����°ű⶧����
"user"�� ���Ŵ� new User�� �ҹ��ڷ� ���Ŵ� 
   --%>
<form:form modelAttribute="user" method="post" action="userEntry.shop">
<spring:hasBindErrors name="user">
<font color="red">
<%-- UserValidator���� ������ errors.reject�� ��ϵ� �� --%>
<c:forEach items="${errors.globalErrors}" var="error">
<spring:message code="${error.code }"/>
</c:forEach>
</font>
</spring:hasBindErrors>
<table>
<%--  modelAttribute="user"�� get������Ƽ�� �����´�   form:input path="userid"  --%>
<tr height="40px"><td>���̵�</td><td><form:input path="userid"/>
<font color="red"><form:errors path="userid" /></font></td></tr>
<tr height="40px"><td>��й�ȣ</td><td><form:password path="password"/>
<font color="red"><form:errors path="password"/></font></td></tr>
<tr height="40px"><td>�̸�</td><td><form:input path="userName"/>
<font color="red"><form:errors path="userName"/></font></td></tr>
<tr height="40px"><td>��ȭ��ȣ</td><td><form:input path="phoneNo"/>
<font color="red"><form:errors path="phoneNo"/></font></td></tr>
<tr height="40px"><td>�����ȣ</td><td><form:input path="postcode"/>
<font color="red"><form:errors path="postcode"/></font></td></tr>
<tr height="40px"><td>�ּ�</td><td><form:input path="address"/>
<font color="red"><form:errors path="address"/></font></td></tr>
<tr height="40px"><td>Email</td><td><form:input path="email"/>
<font color="red"><form:errors path="email"/></font></td></tr>
<tr height="40px"><td>�������</td><td><form:input path="birthDay"/>
<font color="red"><form:errors path="birthDay"/></font></td></tr>
<tr height="40px"><td colspan="2" align="center">
<input type="submit" value="���"><input type="reset" value="����"></td></tr>
</table>
</form:form>
</body>
</html>