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
		<h1 class="bigTitle">고객 정보 조회</h1>
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
	<p>※아무것도 입력하지 않을 경우 전체 고객이 조회됩니다.</p>
</div>
</body>
</html>