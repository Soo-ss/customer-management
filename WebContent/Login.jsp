<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Style.css">

<meta charset="EUC-KR">
<title>�α��� ������</title>
</head>
<body>

<div class="container">
	<h1 class="login_title">�α���</h1>
	<form action="j_security_check" method="post">
		<div class="input_box"> 
			<input type="text" name="j_username" placeholder="���̵� �Է����ּ���"/> 
		</div>
		<div class="input_box"> 
			<input type="password" name="j_password" placeholder="�н����带 �Է����ּ���"/>
		</div>
		<input class="login_btn" type="submit" value="�α���"/>
	</form>
	<a href = "http://localhost:8080/CustomerManagement/Signup.html">
		<div class="signup_btn">
				ȸ������
		</div>
	</a>
</div>
</body>
</html>