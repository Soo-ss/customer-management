<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/form.css">

<meta charset="EUC-KR">
<title>�α��� ������</title>
</head>
<body>

<div class="container">
	<div>
	<h1><i class="fa fa-home" aria-hidden="true"></i>Soo-Hyun</h1>
	<h1 class="login_title">�α���</h1>
	<form action="j_security_check" method="post">
		<div class="input_box"> 
			<input type="text" name="j_username" placeholder="ID"/> 
		</div>
		<div class="input_box"> 
			<input type="password" name="j_password" placeholder="�н�����"/>
		</div>
		<input class="submit_btn" type="submit" value="�α���"/>
	</form>
	<a href = "./Signup.html">
		<div class="signup_btn">
				ȸ������
		</div>
	</a>
	</div>
</div>
</body>
</html>