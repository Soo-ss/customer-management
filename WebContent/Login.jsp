<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<h2>로그인이 필요합니다.</h2>
<form action="j_security_check" method="post">
아이디 : <input type="text" name="j_username"/> <br>
암호 : <input type="password" name="j_password" />
<input type="submit" />
</form>


</body>
</html>