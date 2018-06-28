<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isErrorPage="true" %>
<script>
	alert('${exception.message}');
	location.href="${exception.url}";
</script>