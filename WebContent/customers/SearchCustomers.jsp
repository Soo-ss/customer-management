<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/form.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div>
		<h1 class="bigTitle">�� ���� ��ȸ</h1>
		<form action = "ShowCustomers.jsp">
			<div class="input_box">
				<input type="text" name = "first_name" placeholder="��"/>
			</div>
			<div class="input_box">
				<input type="text" name = "last_name" placeholder="�̸�"/>
			</div>
			
			<div class="input_box">
				<input class="submit_btn" type="submit" value="�˻�"></input>
			</div>
		</form>
	</div>
	<p>�ؾƹ��͵� �Է����� ���� ��� ��ü ���� ��ȸ�˴ϴ�.</p>
</div>
</body>
</html>