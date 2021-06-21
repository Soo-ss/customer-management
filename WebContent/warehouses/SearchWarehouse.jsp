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
		<h1 class="bigTitle">창고 조회</h1>
		<form action = "ShowWarehouse.jsp">
			<div class="input_box">
				<input type="text" name = "warehouse_name" placeholder="창고명을 업력하세요"/>
			</div>
			<div class="input_box">
				<input class="submit_btn" type="submit" value="검색"></input>
			</div>
		</form>
	</div>
	<p>※아무것도 입력하지 않을 경우 전체 창고가 조회됩니다.</p>
</div>
</body>
</html>