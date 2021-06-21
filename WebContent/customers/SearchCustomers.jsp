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
		<h1>고객 정보 조회</h1>
		<form action = "ShowCustomers.jsp">
			<div class="input_box">
				<input type="text" name = "first_name" placeholder="성"/>
			</div>
			<div class="input_box">
				<input type="text" name = "last_name" placeholder="이름"/>
			</div>
			
			<div class="input_box">
				<input class="submit_btn" type="submit" value="검색"></input>
			</div>
		</form>
	</div>
</div>
</body>
</html>