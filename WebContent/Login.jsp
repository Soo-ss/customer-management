<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Style.css">

<meta charset="EUC-KR">
<title>로그인 페이지</title>
</head>
<body>

<div class="container">
	<h1 class="login_title">로그인</h1>
	<form action="j_security_check" method="post">
		<div class="input_box"> 
			<input type="text" name="j_username" placeholder="아이디를 입력해주세요"/> 
		</div>
		<div class="input_box"> 
			<input type="password" name="j_password" placeholder="패스워드를 입력해주세요"/>
		</div>
		<input class="login_btn" type="submit" value="로그인"/>
	</form>
	<a href = "http://localhost:8080/CustomerManagement/Signup.html">
		<div class="signup_btn">
				회원가입
		</div>
	</a>
</div>
</body>
</html>