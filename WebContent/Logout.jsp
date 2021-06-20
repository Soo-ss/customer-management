<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>로그아웃 되었습니다.</h2>
<%
	session.invalidate(); //로그아웃 정보가 사라진다.
%>
</body>
</html>